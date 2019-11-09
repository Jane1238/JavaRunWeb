<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>梦想标志Swiper汇总</title>
<link href="http://cdn.bootcss.com/highlight.js/8.0/styles/monokai_sublime.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/heightlength.css">
<link rel="stylesheet" href="css/mxjs.css">

</head>
<<style>
img{
	width:100%;
}
</style>
<body>

<div class="container">
  <div class="jsbg">
    <div class="col-lg-12 mxlength">
      <div class="mx-1">
      		<h1 class = "postTitle">
			JavaWeb简单教程
		</h1>
<p><strong>一、JSP简介</strong></p>
<p>JSP：Java Server Pages。在传统的HTML文件(*htm,*.html)中加入Java程序片段(Scriptlet)和JSP标记(tag)，就构成了JSP网页。</p>
<p>&nbsp;</p>
<p><strong>二、学习重点：</strong></p>
<ul>
<li>JSP语法（脚本、指令、动作）</li>
<li>JSP的内置对象</li>
<li>创建动态的内容</li>
<li>用户会话跟踪</li>
</ul>
<p>&nbsp;</p>
<p><strong>三、</strong><strong>使用tomcat软件在本地搭建服务器：</strong></p>
<p>Tomcat是Apache组织的Jakarta项目中的一个重要子项目，是Sun公司推荐的运行Servlet和JSP的容器(引擎)，其源代码完全公开。</p>
<p>有了这个服务器，就相当于在本地的计算机有了一个网站，然后我们可以通过浏览器来访问这个网站。</p>
<p>tomcat软甲是apache旗下的一个开源项目。软件下载链接：<a href="http://tomcat.apache.org/">http://tomcat.apache.org/</a></p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232104286524890.png" alt="" /></p>
<p>下载之后，将压缩包解压：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232104410586765.png" alt="" /></p>
<p>注意目录名不能有中文和空格。目录介绍如下：</p>
<ul>
<li>bin：二进制执行文件。里面最常用的文件是<strong>startup.bat</strong></li>
<li>conf:配置目录。里面最核心的文件是<strong>server.xml</strong>。可以在里面改端口号等。默认端口号是8080，也就是说，此端口号不能被其他应用程序占用。</li>
<li>lib：库文件。tomcat运行时需要的jar包所在的目录</li>
<li>logs：日志</li>
<li>temp：临时产生的文件，即缓存</li>
<li>webapps：web的应用程序。web应用放置到此目录下浏览器可以直接访问</li>
<li>work：编译以后的class文件。</li>
</ul>
<p>软件运行之前要保证Java环境变量已经配置：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232105017932166.jpg" alt="" /></p>
<p>上图中，变量名为JAVA_HOME，变量值为：JDK安装的绝对路径。</p>
<p>注：Catalina_Home环境变量:指定tomcat在启动时启动哪个tomcat,一般不推荐配置。</p>
<p>回到tomcat的bin目录中, 双击startup.bat：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232105246057262.png" alt="" /></p>
<p>之后弹出如下界面：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232105392158264.png" alt="" /></p>
<p>这个时候，本地的服务器就已经搭建起来了。<strong>如果想关闭服务器</strong>，可以直接关闭上面的窗口，或者在里面输入Ctrl+C禁止服务。</p>
<p>首先查看自己电脑的ip地址，我的计算机的ip地址为：192.168.1.112。</p>
<p>在浏览器中输入http://192.168.1.112:8080/（或者输入http://localhost:8080/也是可以的）。如果弹出如下界面，进入本地服务器的首页，表示tomcat安装成功并且启动起来了：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232106014657934.jpg" alt="" /></p>
<p>上方图片中，显示我的Tomcat的版本为：8.0.14。它的版本号是跟着JDK的版本走的，所以，建议JDK的版本为1.8。</p>
<p>我们现在在浏览器上测试一下它吧：</p>
<p>首先在D:\apache-tomcat-8.0.14\webapps\ROOT目录中新建一个jsp文件：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232106198557249.jpg" alt="" /></p>
<p>jsp文件中填入如下内容：</p>
<div class="col-lg-12  ">
      <pre class="mScroll">
        <code class="lang-java">&lt;%

String name = request.getParameter("name");
String pwd = request.getParameter("password"); 

out.print("name:" + name + ",password:" + pwd); //在浏览器上显示输入地址中的用户名与密码

%&gt;&nbsp;</code></pre></div>
<p>现在我们随便起一个用户名和密码的账号，比如用户名smyhvae，密码为smyh，然后在浏览器中输入如下内容：</p>
<p>http://192.168.1.112:8080/test.jsp?name=smyhvae&amp;password=smyh</p>
<p>输入这个链接之后，回车，出现如下界面：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232110160433561.jpg" alt="" /></p>
<p>上图中表示，我们向服务器发送这样一个请求，链接中，问号前面的内容代表请求的路径，问号后面是我们要传送的参数（键是固定不变的，值是用户自己填写的），然后服务器返还给我们这样的数据。</p>
<p>&nbsp;</p>
<p><strong>三、将Tomcat和eclipse相关联：</strong></p>
<p>打开eclipse for Java EE ，选择菜单栏Windows--&gt;preferences，弹出如下界面：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232111301681549.png" alt="" /></p>
<p>上图中，点击&ldquo;add&rdquo;的添加按钮，弹出如下界面：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232111442933866.png" alt="" /></p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232112054656263.png" alt="" /></p>
<p>上图中，选择对应的Tomcat版本，继续：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232112245587963.png" alt="" /></p>
<p>上图中，选择Tomcat的路径，以及JRE，点击&ldquo;完成&rdquo;，配置完毕。</p>
<p>新建java工程，建一个动态的工程：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232112541213100.png" alt="" /></p>
<p>注：对&ldquo;动态&rdquo;的理解：html是静态的，写成什么，就是什么。动态指的是根据服务器端返回的数据动态地生成页面。比如张三登陆可以看到张三的信息；换成李四登陆，可以看到李四的信息。</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201411/302044303245040.png" alt="" /></p>
<p>点开上图中的红框部分，弹出如下界面：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201411/302045039346772.png" alt="" /></p>
<p>按照上图进行配置，其中，第三个红框中，是加载自己的jdk的安装路径即可:</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201411/302045252932113.png" alt="" /></p>
<p>然后，单击finish。继续：</p>
<p>&nbsp;</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232113121219000.png" alt="" /></p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232113256216676.png" alt="" /></p>
<p>工程文件结构：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232113367466511.png" alt="" /></p>
<p>上图中，deployment descriptor：部署的描述。Web App Libraries：自己加的包可以放在里面。build：放入编译之后的文件。WebContent:放进写入的页面。</p>
<p>在WebContent文件夹下新建一个jsp文件。在下图中可以看到它的默认代码：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232115106372126.png" alt="" /></p>
<p>上图中，这种编码方式不支持中文。我们来修改一下JSP文件的编码方式，按上图所示，鼠标右击，选择"Preferences"，弹出如下对话框：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232116185271919.png" alt="" /></p>
<p>上图中，将编码方式改为UTF-8。</p>
<p>同样，我们还需要将文本内容的编码方式改为UTF-8（这个编码和程序无关），选择菜单栏Windows--preferences，打开如下界面，将编码方式改为UTF-8，并点击update：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/311039297063444.png" alt="" /></p>
<p>以后每次新建一个jsp文件，默认的编码方式就是UTF-8了。默认代码如下：</p>
<div class="col-lg-12  ">
      <pre class="mScroll">
        <code class="lang-java">
 1 &lt;%@ page language="java" contentType="text/html; charset=UTF-8"
 2     pageEncoding="UTF-8"%&gt;
 3 &lt;!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"&gt;
 4 &lt;html&gt;
 5 &lt;head&gt;
 6 &lt;meta http-equiv="Content-Type" content="text/html; charset=UTF-8"&gt;
 7 &lt;title&gt;Insert title here&lt;/title&gt;
 8 &lt;/head&gt;
 9 &lt;body&gt;
10 
11 &lt;/body&gt;
12 &lt;/html&gt;
</code></pre>
</div>
<p>我们在hello.jsp中修改一下，将上方的第7行的标题改一下，并在第10行添加输出语句。最终代码如下：</p>
<div class="col-lg-12  ">
      <pre class="mScroll">
        <code class="lang-java"> 
 1 &lt;%@ page language="java" contentType="text/html; charset=UTF-8"
 2     pageEncoding="UTF-8"%&gt;
 3 &lt;!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"&gt;
 4 &lt;html&gt;
 5 &lt;head&gt;
 6 &lt;meta http-equiv="Content-Type" content="text/html; charset=UTF-8"&gt;
<strong> 7 &lt;title&gt;hello JSP&lt;/title&gt;</strong>
 8 &lt;/head&gt;
 9 &lt;body&gt;
<strong>10     &lt;%
11         out.println("hello,JSP");
12     %&gt;</strong>
13 &lt;/body&gt;
14 &lt;/html&gt;</code></pre>
</div>
<p>上方的第11行，out指的是输出流。通过页面获取这个输出流，并打印在页面中。以前学的System.out.println()指的是向控制台输出。</p>
<p>程序运行之前，我们先修改一下浏览器选项:</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232119394023584.png" alt="" /></p>
<p>现在我们开始运行程序：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232119524331103.png" alt="" /></p>
<p>运行时，弹出如下错误：(如果没有此错误，请忽略)</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232120047932694.png" alt="" /></p>
<p>原因是，我们之前点击了Tomcat安装包中的​startup.bat，这样一来就手动打开了Tomcat服务器，这明显是多余的，因为程序运行时，eclipse会自动开启Tomcat服务器。所以我们先<strong>手动关掉tomcat软件</strong>，再次运行程序，就行了。控制台信息如下：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232120441212179.png" alt="" /></p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232120199803353.png" alt="" /></p>
<p>浏览器会自动打开，网页信息如下：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232120597936224.png" alt="" /></p>
<p>现在来解释一下上方网址的名称为什么显示的是 http://localhost:8080/TomcatTest/</p>
<p>我们选中项目，右键选择&ldquo;properties&rdquo;，弹出如下对话框：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232121476835759.png" alt="" /></p>
<p>上图显示，我们所部署的路径是根目录，根目录的名称默认为我们新建的项目名，所以网址才会显示为：主机名+端口号+项目名。</p>
<p>网页显示的错误为404，即找不到网页，可见网页中并没有看到我们新建的jsp文件，我们再来找一下原因。打开工程文件中，WEB-INF目录下的web.xml文件：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232122567934080.png" alt="" /></p>
<p>上图解释：当程序运行时，Tomcat会首先读取工程的配置文件，且名字必须为web.xml。当系统默认进入的链接为：主机名+端口+工程名时，服务器就会找上图中&lt;welcome-file-list&gt;标签里的页面（有好几个页面的话，就依次往下找）；而标签&lt;welcome-file-list&gt;中并没有hello.jsp文件。所以，我们需要在浏览器地址栏输入：http://localhost:8080/TomcatTest/hello.jsp，才会将hello.jsp页面显示出来。效果如下：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232124339491865.png" alt="" /></p>
<p><strong>四、程序运行的原理：</strong></p>
<p>我们现在来分析一下上面的程序运行的原理。</p>
<p>当在服务器上运行后，会生成与工程文件并列的一个文件夹：Servers。如下：（如果删掉了Servers文件夹，当重新运行时，文件夹又会自动生成）</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232124450741700.png" alt="" /></p>
<p>这个文件夹是Tomcat服务器的一个基本的配置。</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232124553407962.png" alt="" /></p>
<p>上图中表明，我们新建的项目已经部署到Tomcat服务器上去了，也就是看到了TomcatTest这个工程被发布出去了（发布的过程即：将写的工程打包以后放到Tomcat里）。</p>
<p>其实eclipse for EE已经包含了Tomcat服务的插件，但其也必须依赖Tomcat来启动。我们双击上图的红框部分，显示如下信息：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232125204187102.png" alt="" /></p>
<p>上图的红框部分表明，服务的部署是在eclipse里面（默认是放在工作空间里的.metadata文件夹下），而不是在Tomcat里面。我们来改一下，前提是工程并没有发布到Tomcat中去，那我们先把之前发布的版本删了吧（稍后重新发布）：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232125525273092.png" alt="" /></p>
<p>然后就可以修改部署的路径了：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232126056684811.png" alt="" /></p>
<p>上图中，使用Tomcat的安装目录作为部署的位置，并修改部署的路径Deploy path（建议改成Tomcat的webapps目录下），然后保存即可。这时，<strong>重新运行程序</strong>。现在来到Tomcat的webapps目录下，发现多了一个TomcatTest文件夹（即工程文件名），并且文件夹下包含了工程文件中WebContent的内容：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232126293873764.png" alt="" /></p>
<p>上图说明，说明这才是真正将程序发布到服务器上。</p>
<p>我们再来到Tomcat的work目录中，看一下编译之后的文件：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201410/232126434804325.png" alt="" />​</p>
<p>上图表明，<strong>Tomcat会先将jsp文件转为java文件，然后再把java文件编译为class文件，最终执行的是class文件</strong>。现在来看一下JSP运行的原理。</p>
<p>&nbsp;</p>
<p><strong>四、JSP的运行原理：</strong></p>
<ul>
<li>只有当客户端第一次请求JSP时，才需要将其转换、编译（所以第二次浏览同样的网页时，速度会更快）</li>
<li>Web服务器在遇到访问JSP网页的请求时，首先执行其中的程序片段，然后将执行结果以HTML格式返回给客户。</li>
<li>程序片段可以操作数据库、重新定向网页以及发送email等等，这就是建立动态网站所需要的功能。</li>
<li>所有程序操作都在服务器端执行，网络上传送给客户端的仅是得到的结果，对客户浏览器的要求最低。</li>
</ul>
<p>总结：本文的整个过程，让我们学会了如何配置Tomcat和部署工程文件，明白了jsp文件是怎样发布到服务器上并最终显示出来。关于JSP的进一步学习，将在后面呈现。</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><strong>五、Tomcat的其他问题：</strong></p>
<p><strong>1、端口占用问题：</strong></p>
<p>在cmd中输入<strong>netstat -ano</strong>命令，查看占用端口的进程pid，再用任务管理器关闭相应进程即可。</p>
<p>我们在浏览器中输入"www.baidu.com"，但是并没有输入端口号依然能进入网页，这是因为浏览器默认的端口号为80，如果对方服务器是监听在80端口上，则在浏览器中输入网址时，可以不用输入端口号。</p>
<p>Tomcat默认监听的端口号是8080（server.xml文件的第63行），可以在配置文<strong>件conf/server.xml</strong>中修改<strong>。</strong></p>
<p>【备注】Tomcat关联帮助文档Javadoc</p>
<p>我们以后如果要使用到Servlet类，但是想查看里面的源码和帮助文档，发现看不到：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201411/211920478439210.png" alt="" /></p>
<p>按住ctrl点进去之后，是下面的界面：</p>
<p><img src="https://images0.cnblogs.com/blog/641601/201411/211922135627189.png" alt="" /></p>
<p>我们下载的tomcat中自带了源码，但是帮助文档需要另外下载</p> 
		</div>
	</div>
  </div>	
</div>
<script src="js/jquery.min.js"></script> 
<script src="http://cdn.bootcss.com/highlight.js/8.0/highlight.min.js"></script> 
<script src="js/smoothscroll.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
</body>
</html>
