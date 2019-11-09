package com.shaoyujian.JavaRunWeb.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


/**
 * 动态编译输出运行结果
 *
 */
@RestController
public class JavaRunController {

	private static Process process;
	ExecutorService pool = Executors.newCachedThreadPool();
	@RequestMapping("/run")
	@ResponseBody
	public StringBuffer toStudy(HttpServletRequest req) throws IOException, ServletException {
		// 设置字符编码为UTF-8,前台页面支持汉字显示
//		resp.setCharacterEncoding("UTF-8");
		StringBuffer res =new StringBuffer();
		String code = req.getParameter("code");
		// 获取页面参数
		String className = null; // 类名
		String classStr = null;
		BufferedWriter bw = null;
		try {
			classStr = code.substring(code.indexOf("public class"), code.indexOf("{")).toString();// 获取类名字符串
			String[] classStrArray = classStr.split("\\s{1,}");// 按空格分开
			if (classStrArray.length != 3) {
//				req.setAttribute("msg", "编译失败：格式不符合规范，请检查类名是否正确(如：public class YouClassName{})");
				res.append("编译失败：格式不符合规范，请检查类名是否正确(如：public class YouClassName{})") ;
			} else {
				className = classStrArray[classStrArray.length - 1];
				File sourceFile = new File(className + ".java");// 保存源代码
				if (sourceFile.exists()) {
					sourceFile.delete();
				}
				FileWriter fr = new FileWriter(sourceFile);
				bw = new BufferedWriter(fr);
				bw.write(code);
				bw.close();
				fr.close();

				Runtime runtime = Runtime.getRuntime();
				process = runtime.exec("cmd");
				Thread.sleep(1000);// 防止cmd.exe程序未启动，当然也可以直接使用javac命令
				// 往控制台注入命令
				bw = new BufferedWriter(new OutputStreamWriter(process.getOutputStream()));
				bw.write("javac -encoding UTF-8 " + className + ".java \n");
				bw.flush();
				long startFreeMemory = runtime.freeMemory();// Java 虚拟机中的空闲内存量
				// 执行时间也是无法知道，因为dos执行java命令，程序无法知道它到底执行到那里了，两个进程，互不了解
				long startCurrentTime = System.currentTimeMillis();// 获取系统当前时间
				bw.write("java " + className + " \n");
				bw.close();
				
				
				// 获取控制台输出的结果
				// Thread runtimeInput = new Thread(new RuntimeInput(req));
				// runtimeInput.start();
				// 线程池处理主进程的输出结果
				Cc cc = new Cc(req.getParameter("code"));
				Future<String> future = pool.submit(cc);
				while (true) {
					if (future.isDone()) {
						String returnValue = future.get().toString();
//						req.setAttribute("msg", returnValue);
						String test=returnValue.substring(2, 3);
						System.out.println(test);
						if(test.equals("成")) {
							// 获取内存信息,实际过程中，是无法得到这个程序到底多少内存，内存的分配有操作系统决定，如果
							// 程序需要，系统会动态分配内存，如果有对象没有引用，可能会被垃圾回收器回收，所以是无法得到到底多少内存的
							// 现在得到程序运行前后内存使用率，不过输出的是0，因为程序退出，不占内存了
							Thread.sleep(1000);
							long endCurrentTime = System.currentTimeMillis();
							long endFreeMemory = runtime.freeMemory();
							double useMemory = (startFreeMemory - endFreeMemory) / 1024;
							System.out.println("开始时间:" + startCurrentTime);
							System.out.println("结束时间:" + endCurrentTime);
							long useTime = endCurrentTime - startCurrentTime;
							res.append( "运行时间为:" + useTime);
//							req.setAttribute("arg", "运行成功,运行时间为:" + useTime+"毫秒");
							res.append("\r\n");
						    res.append(returnValue);
						}else {
							 res.append(returnValue);
							 System.out.println(returnValue);
						}
						
						break;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			res.append( "格式不符合规范，请检查类名是否正确(如：public class YouClassName{}).错误信息:" + e.getMessage());
		}
		return res;
	}
	//调用callable接口实现多线程
	public class Cc implements Callable<String>{
		public Cc(String code) {
			this.code = code;
		}
		String code = null;
		
		public String getCode() {
			return code;
		}

		public void setCode(String code) {
			this.code = code;
		}
		//重写call方法
		@Override
		public String call() throws Exception {
			String res ="";
			BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream(),"GBK"));//文件输入流读取输出结果
			BufferedReader be = new BufferedReader(new InputStreamReader(process.getErrorStream(),"GBK"));//文件输入流读取错误结果
			//BufferedWriter bew = new BufferedWriter(new OutputStreamWriter(process.getOutputStream()));
			StringBuffer sb = new StringBuffer();
			//ByteArrayOutputStream baos=new ByteArrayOutputStream();
			String content = null;  //编译成功的结果
			String error = null;	//编译失败的结果
			String className = null;	//类名的数组形式
			String classStr = null;		//类名
			classStr = code.substring(code.indexOf("public class"), code.indexOf("{")).toString();
			String[] classStrArray = classStr.split("\\s{1,}");
			className = classStrArray[classStrArray.length - 1];
			int i = 0;
			try {
				//获取编译失败区的结果
				while ((error = be.readLine()) != null) {
					System.out.println(error);
					sb.append(error + "\n");
					i++;
				}
				String pr =sb.toString();
				res = "运行失败,请看错误提示:\n"+pr;
				be.close();
				if (i == 0) {
					//获取编译成功区的结果
					while ((content = br.readLine()) != null) {
						sb.append(content + "\n");
					}
						
						pr = sb.toString();
						pr = pr.substring(pr.indexOf("java " + className) + (5 + className.length()), pr.lastIndexOf("D:"));

					// response.setContentType("text/html;charset=utf-8");
					// PrintWriter out1=response.getWriter();
					
					res ="运行成功,结果为" + pr;
					System.out.println("程序结果为:" + pr);
					//删除生成的文件
					String path="D:"+File.separator+"work_space"+File.separator+"JavaRunWeb"+File.separator+"JavaRunWeb";
					String jv=className+".java";
					String cs=className+".class";
					String realpath1=path+File.separator+jv;
					String realpath2=path+File.separator+cs;
					File f1 = new File(realpath1);
					File f2 = new File(realpath2);
					f1.delete();
					f2.delete();
					br.close();

				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			return res;
		}
		
	}
	
}
