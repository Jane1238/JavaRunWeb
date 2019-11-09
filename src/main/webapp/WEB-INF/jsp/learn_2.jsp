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
<link rel='stylesheet' id='wp-block-library-css'  href='http://www.runoob.com/wp-includes/css/dist/block-library/style.min.css?ver=5.1.1' type='text/css' media='all' />
<style>
 table {
	width:100%;
	margin:15px 0;
	border:0;
	}
</style>
</head>

<body class="mScroll">
<div class="container">
  <div class="jsbg">
    <div class="col-lg-12 mxlength">
      <div class="mx-1">
       <h1>Java 基础语法</h1>
<p>一个 Java 程序可以认为是一系列对象的集合，而这些对象通过调用彼此的方法来协同工作。下面简要介绍下类、对象、方法和实例变量的概念。</p>
<ul>
	<li>
		<strong>对象</strong>：对象是类的一个实例，有状态和行为。例如，一条狗是一个对象，它的状态有：颜色、名字、品种；行为有：摇尾巴、叫、吃等。</li>
	<li>
		<strong>类</strong>：类是一个模板，它描述一类对象的行为和状态。</li>
	<li>
		<strong>方法</strong>：方法就是行为，一个类可以有很多方法。逻辑运算、数据修改以及所有动作都是在方法中完成的。</li>
	<li>
		<strong>实例变量</strong>：每个对象都有独特的实例变量，对象的状态由这些实例变量的值决定。</li>
</ul><hr>
<h2>第一个Java程序</h2>
<p>下面看一个简单的 Java 程序，它将打印字符串 <em>Hello World</em></p>
<div class="col-lg-12  ">
     <pre class="mScroll">
        <code class="lang-java">
		public class A{
		/*第一个java实例
		* 它将打印字符串 Hello World
		*/
			public static void main(String args[]){
				System.out.print("Hello World!");
			}	
		}
		</pre>
		</code>
   
    </div>
<br>

</div>
<p>下面将逐步介绍如何保存、编译以及运行这个程序：</p>
<ul>
	<li>
		打开代码编辑器，把上面的代码添加进去；</li>
	<li>
		把文件名保存为：HelloWorld.java；</li>
	<li>
		打开 cmd 命令窗口，进入目标文件所在的位置，假设是 C:\</li>
	<li>
		在命令行窗口输入 <span class="marked">javac HelloWorld.java</span>  按下回车键编译代码。如果代码没有错误，cmd 命令提示符会进入下一行（假设环境变量都设置好了）。</li>
	<li>
		再键输入 <span class="marked">java HelloWorld</span> 按下回车键就可以运行程序了</li>
</ul>
<p>你将会在窗口看到 Hello World</p>
<pre class="mScroll">
<code>
C : &gt; javac HelloWorld.java
C : &gt; java HelloWorld 
Hello World
</code>
</pre>


<hr>
<h2>基本语法</h2>
<p>编写 Java 程序时，应注意以下几点：</p>
<ul>
	<li>
		<strong>大小写敏感</strong>：Java 是大小写敏感的，这就意味着标识符 Hello 与 hello 是不同的。</li>
	<li>
		<strong>类名</strong>：对于所有的类来说，类名的首字母应该大写。如果类名由若干单词组成，那么每个单词的首字母应该大写，例如 <strong>MyFirstJavaClass</strong> 。</li>
	<li>
		<strong>方法名</strong>：所有的方法名都应该以小写字母开头。如果方法名含有若干单词，则后面的每个单词首字母大写。</li>
	<li>
		<strong>源文件名</strong>：源文件名必须和类名相同。当保存文件的时候，你应该使用类名作为文件名保存（切记 Java 是大小写敏感的），文件名的后缀为 <strong>.java</strong>。（如果文件名和类名不相同则会导致编译错误）。</li>
	<li>
		<strong>主方法入口</strong>：所有的 Java 程序由 <strong>public static void main(String []args)</strong> 方法开始执行。</li>
</ul>

<hr>
<h2>Java 标识符</h2>
<p>Java 所有的组成部分都需要名字。类名、变量名以及方法名都被称为标识符。</p>
<p>关于 Java 标识符，有以下几点需要注意：</p>
<ul>
	<li>
		所有的标识符都应该以字母（A-Z 或者 a-z）,美元符（$）、或者下划线（_）开始</li>
	<li>
		首字符之后可以是字母（A-Z 或者 a-z）,美元符（$）、下划线（_）或数字的任何字符组合</li>
	<li>
		关键字不能用作标识符</li>
	<li>
		标识符是大小写敏感的</li>
	<li>
		合法标识符举例：age、$salary、_value、__1_value</li>
	<li>
		非法标识符举例：123abc、-salary</li>
</ul><hr>
<h2>Java修饰符</h2>
<p>
	像其他语言一样，Java可以使用修饰符来修饰类中方法和属性。主要有两类修饰符：</p>
<ul>
	<li>访问控制修饰符 : default, public , protected, private</li>
	<li>非访问控制修饰符 : final, abstract, static, synchronized </li>
</ul>
<p>
	在后面的章节中我们会深入讨论 Java 修饰符。</p><hr>
	<h2>
	Java 变量</h2>
Java 中主要有如下几种类型的变量<br />
<ul>
	<li>局部变量</li>
	<li>类变量（静态变量）</li>
	<li>成员变量（非静态变量）</li>
</ul><hr>
<h2>Java 数组</h2>
<p>数组是储存在堆上的对象，可以保存多个同类型变量。在后面的章节中，我们将会学到如何声明、构造以及初始化一个数组。</p><hr>
<h2>Java 枚举</h2>
<p>Java 5.0引入了枚举，枚举限制变量只能是预先设定好的值。使用枚举可以减少代码中的 bug。</p>
<p>例如，我们为果汁店设计一个程序，它将限制果汁为小杯、中杯、大杯。这就意味着它不允许顾客点除了这三种尺寸外的果汁。</p>

<h3>实例</h3>
<div class="col-lg-12  ">
     <pre class="mScroll">
        <code class="lang-java">
		public class FreshJuice {
   			enum FreshJuiceSize{ SMALL, MEDIUM , LARGE }
   			FreshJuiceSize size;
		}
 
		public class FreshJuiceTest {
   			public static void main(String []args){
      		FreshJuice juice = new FreshJuice();
      		juice.size = FreshJuice.FreshJuiceSize.MEDIUM  ;
   		}
	}
	 	</pre>
		</code>
   
    </div>
<p><strong>注意：</strong>枚举可以单独声明或者声明在类里面。方法、变量、构造函数也可以在枚举中定义。</p>
<hr>
<h2>
Java 关键字
</h2>
<p>
下面列出了 Java 关键字。这些保留字不能用于常量、变量、和任何标识符的名称。
</p>
<table class="table">
<tbody><tr>
<th>类别</th>
<th>关键字</th>
<th>说明</th>
</tr>
<tr>
<td rowspan="3" align="center">访问控制</td>
<td>private</td>
<td>私有的</td>
</tr>
<tr>
<td>protected</td>
<td>受保护的</td>
</tr>
<tr>
<td>public</td>
<td>公共的</td>
</tr>
<tr>
<td rowspan="13" align="center">类、方法和变量修饰符</td>
<td>abstract</td>
<td>声明抽象</td>
</tr>
<tr>
<td>class</td>
<td>类</td>
</tr>
<tr>
<td>extends</td>
<td>扩充,继承</td>
</tr>
<tr>
<td>final</td>
<td>最终值,不可改变的</td>
</tr>
<tr>
<td>implements</td>
<td>实现（接口）</td>
</tr>
<tr>
<td>interface</td>
<td>接口</td>
</tr>
<tr>
<td>native</td>
<td>本地，原生方法（非 Java 实现）</td>
</tr>
<tr>
<td>new</td>
<td>新,创建</td>
</tr>
<tr>
<td>static</td>
<td>静态</td>
</tr>
<tr>
<td>strictfp</td>
<td>严格,精准</td>
</tr>
<tr>
<td>synchronized</td>
<td>线程,同步</td>
</tr>
<tr>
<td>transient</td>
<td>短暂</td>
</tr>
<tr>
<td>volatile</td>
<td>易失</td>
</tr>
<tr>
<td rowspan="12" align="center">程序控制语句</td>
<td>break</td>
<td>跳出循环</td>
</tr>
<tr>
<td>case</td>
<td>定义一个值以供 switch 选择</td>
</tr>
<tr>
<td>continue</td>
<td>继续</td>
</tr>
<tr>
<td>default</td>
<td>默认</td>
</tr>
<tr>
<td>do</td>
<td>运行</td>
</tr>
<tr>
<td>else</td>
<td>否则</td>
</tr>
<tr>
<td>for</td>
<td>循环</td>
</tr>
<tr>
<td>if</td>
<td>如果</td>
</tr>
<tr>
<td>instanceof</td>
<td>实例</td>
</tr>
<tr>
<td>return</td>
<td>返回</td>
</tr>
<tr>
<td>switch</td>
<td>根据值选择执行</td>
</tr>
<tr>
<td>while</td>
<td>循环</td>
</tr>
<tr>
<td rowspan="6" align="center">错误处理</td>
<td>assert</td>
<td>断言表达式是否为真</td>
</tr>
<tr>
<td>catch</td>
<td>捕捉异常</td>
</tr>
<tr>
<td>finally</td>
<td>有没有异常都执行</td>
</tr>
<tr>
<td>throw</td>
<td>抛出一个异常对象</td>
</tr>
<tr>
<td>throws</td>
<td>声明一个异常可能被抛出</td>
</tr>
<tr>
<td>try</td>
<td>捕获异常</td>
</tr>
<tr>
<td rowspan="2" align="center">包相关</td>
<td>import</td>
<td>引入</td>
</tr>
<tr>
<td>package</td>
<td>包</td>
</tr>
<tr>
<td rowspan="8" align="center">基本类型</td>
<td>boolean</td>
<td>布尔型</td>
</tr>
<tr>
<td>byte</td>
<td>字节型</td>
</tr>
<tr>
<td>char</td>
<td>字符型</td>
</tr>
<tr>
<td>double</td>
<td>双精度浮点</td>
</tr>
<tr>
<td>float</td>
<td>单精度浮点</td>
</tr>
<tr>
<td>int</td>
<td>整型</td>
</tr>
<tr>
<td>long</td>
<td>长整型</td>
</tr>
<tr>
<td>short</td>
<td>短整型</td>
</tr>

<tr>
<td rowspan="3" align="center">变量引用</td>
<td>super</td>
<td>父类,超类</td>
</tr>
<tr>
<td>this</td>
<td>本类</td>
</tr>
<tr>
<td>void</td>
<td>无返回值</td>
</tr>
<tr>
<td rowspan="3" align="center">保留关键字</td>
<td>goto</td>
<td>是关键字，但不能使用</td>
</tr>
<tr>
<td>const</td>
<td>是关键字，但不能使用</td>
</tr>
<tr>
<td>null</td>
<td>空</td>
</tr>
</tbody></table>

<hr>
<h2>
Java注释</h2>
<p>类似于 C/C++、Java 也支持单行以及多行注释。注释中的字符将被 Java 编译器忽略。</p>
<div class="col-lg-12  ">
      <pre class="mScroll">
        <code class="lang-java">
		public class HelloWorld {
   			/* 这是第一个Java程序
    		*它将打印Hello World
    		* 这是一个多行注释的示例
    		*/
   			 public static void main(String []args){
       		// 这是单行注释的示例
       		/* 这个也是单行注释的示例 */
      		 System.out.println("Hello World"); 
    }
}
		</code>
    </pre>
    </div>
    <hr>
<h2>Java 空行</h2>
<p>空白行或者有注释的行，Java 编译器都会忽略掉。</p><hr>

<h2>
	继承</h2>
<p>在 Java 中，一个类可以由其他类派生。如果你要创建一个类，而且已经存在一个类具有你所需要的属性或方法，那么你可以将新创建的类继承该类。</p>
<p>
利用继承的方法，可以重用已存在类的方法和属性，而不用重写这些代码。被继承的类称为超类（super class），派生类称为子类（subclass）。</p><hr>
<h2>接口</h2>
<p>在 Java 中，接口可理解为对象间相互通信的协议。接口在继承中扮演着很重要的角色。</p>
<p>
接口只定义派生要用到的方法，但是方法的具体实现完全取决于派生类。</p>

<hr>
<h2>Java 源程序与编译型运行区别</h2>
<p>如下图所示：</p>
<p><img src="//www.runoob.com/wp-content/uploads/2013/12/ZSSDMld.png"></p>

      </div>
    </div>
  </div>
</div>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script> 
<script src="http://cdn.bootcss.com/highlight.js/8.0/highlight.min.js"></script> 
<script src="js/smoothscroll.js"></script> 
<script>hljs.initHighlightingOnLoad();</script> 
<script src="js/mking.js"></script>
</body>
</html>
