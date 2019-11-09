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

<body>

<div class="container">
  <div class="jsbg">
    <div class="col-lg-12 mxlength">
      <div class="mx-1"> 
			<h1>Java 简介</h1>
<p>Java是由Sun Microsystems公司于1995年5月推出的Java面向对象程序设计语言和Java平台的总称。由James Gosling和同事们共同研发，并在1995年正式推出。</p>
<p>Java分为三个体系：</p><ul><li>JavaSE（J2SE）（Java2 Platform Standard Edition，java平台标准版）</li><li>
JavaEE(J2EE)(Java 2 Platform,Enterprise Edition，java平台企业版)</li><li>JavaME(J2ME)(Java 2 Platform Micro Edition，java平台微型版)。</li></ul>
<p>2005年6月，JavaOne大会召开，SUN公司公开Java SE 6。此时，Java的各种版本已经更名以取消其中的数字"2"：J2EE更名为Java EE, J2SE更名为Java SE，J2ME更名为Java ME。
</p>

<hr>
<h2>
主要特性
</h2>
<ul>
<li><strong>Java语言是简单的：</strong><p>Java语言的语法与C语言和C++语言很接近，使得大多数程序员很容易学习和使用。另一方面，Java丢弃了C++中很少使用的、很难理解的、令人迷惑的那些特性，如操作符重载、多继承、自动的强制类型转换。特别地，Java语言不使用指针，而是引用。并提供了自动的废料收集，使得程序员不必为内存管理而担忧。</p></li>
<li><strong>Java语言是面向对象的：</strong><p>Java语言提供类、接口和继承等面向对象的特性，为了简单起见，只支持类之间的单继承，但支持接口之间的多继承，并支持类与接口之间的实现机制（关键字为implements）。Java语言全面支持动态绑定，而C++语言只对虚函数使用动态绑定。总之，Java语言是一个纯的面向对象程序设计语言。</p></li>
<li><strong>Java语言是分布式的：</strong><p>Java语言支持Internet应用的开发，在基本的Java应用编程接口中有一个网络应用编程接口（java net），它提供了用于网络应用编程的类库，包括URL、URLConnection、Socket、ServerSocket等。Java的RMI（远程方法激活）机制也是开发分布式应用的重要手段。</p></li>
<li><strong>Java语言是健壮的：</strong><p>Java的强类型机制、异常处理、垃圾的自动收集等是Java程序健壮性的重要保证。对指针的丢弃是Java的明智选择。Java的安全检查机制使得Java更具健壮性。</p></li>
<li><strong>Java语言是安全的：</strong><p>Java通常被用在网络环境中，为此，Java提供了一个安全机制以防恶意代码的攻击。除了Java语言具有的许多安全特性以外，Java对通过网络下载的类具有一个安全防范机制（类ClassLoader），如分配不同的名字空间以防替代本地的同名类、字节代码检查，并提供安全管理机制（类SecurityManager）让Java应用设置安全哨兵。</p></li>
<li><strong>Java语言是体系结构中立的：</strong><p>Java程序（后缀为java的文件）在Java平台上被编译为体系结构中立的字节码格式（后缀为class的文件），然后可以在实现这个Java平台的任何系统中运行。这种途径适合于异构的网络环境和软件的分发。</p></li>
<li><strong>Java语言是可移植的：</strong><p>这种可移植性来源于体系结构中立性，另外，Java还严格规定了各个基本数据类型的长度。Java系统本身也具有很强的可移植性，Java编译器是用Java实现的，Java的运行环境是用ANSI C实现的。</p></li>
<li><strong>Java语言是解释型的：</strong><p>如前所述，Java程序在Java平台上被编译为字节码格式，然后可以在实现这个Java平台的任何系统中运行。在运行时，Java平台中的Java解释器对这些字节码进行解释执行，执行过程中需要的类在联接阶段被载入到运行环境中。</p></li>
<li><strong>Java是高性能的：</strong><p>与那些解释型的高级脚本语言相比，Java的确是高性能的。事实上，Java的运行速度随着JIT(Just-In-Time）编译器技术的发展越来越接近于C++。</p></li>
<li><strong>Java语言是多线程的：</strong><p>在Java语言中，线程是一种特殊的对象，它必须由Thread类或其子（孙）类来创建。通常有两种方法来创建线程：其一，使用型构为Thread(Runnable)的构造子类将一个实现了Runnable接口的对象包装成一个线程，其二，从Thread类派生出子类并重写run方法，使用该子类创建的对象即为线程。值得注意的是Thread类已经实现了Runnable接口，因此，任何一个线程均有它的run方法，而run方法中包含了线程所要运行的代码。线程的活动由一组方法来控制。Java语言支持多个线程的同时执行，并提供多线程之间的同步机制（关键字为synchronized）。</p></li>
<li><strong>Java语言是动态的：</strong><p>Java语言的设计目标之一是适应于动态变化的环境。Java程序需要的类能够动态地被载入到运行环境，也可以通过网络来载入所需要的类。这也有利于软件的升级。另外，Java中的类有一个运行时刻的表示，能进行运行时刻的类型检查。</p></li>
</ul>

<hr><h2>发展历史</h2>
<ul>
<li>1995年5月23日，Java语言诞生</li>
<li>1996年1月，第一个JDK-JDK1.0诞生</li>
<li>1996年4月，10个最主要的操作系统供应商申明将在其产品中嵌入JAVA技术</li>
<li>1996年9月，约8.3万个网页应用了JAVA技术来制作</li>
<li>1997年2月18日，JDK1.1发布</li>
<li>1997年4月2日，JavaOne会议召开，参与者逾一万人，创当时全球同类会议规模之纪录</li>
<li>1997年9月，JavaDeveloperConnection社区成员超过十万</li>
<li>1998年2月，JDK1.1被下载超过2,000,000次</li>
<li>1998年12月8日，JAVA2企业平台J2EE发布</li>
<li>1999年6月，SUN公司发布Java的三个版本：标准版（JavaSE,以前是J2SE）、企业版（JavaEE以前是J2EE）和微型版（JavaME，以前是J2ME）</li>
<li>2000年5月8日，JDK1.3发布</li>
<li>2000年5月29日，JDK1.4发布</li>
<li>2001年6月5日，NOKIA宣布，到2003年将出售1亿部支持Java的手机</li>
<li>2001年9月24日，J2EE1.3发布</li>
<li>2002年2月26日，J2SE1.4发布，自此Java的计算能力有了大幅提升</li>
<li>2004年9月30日18:00PM，J2SE1.5发布，成为Java语言发展史上的又一里程碑。为了表示该版本的重要性，J2SE1.5更名为Java SE 5.0</li>
<li>2005年6月，JavaOne大会召开，SUN公司公开Java SE 6。此时，Java的各种版本已经更名，以取消其中的数字"2"：J2EE更名为Java EE，J2SE更名为Java SE，J2ME更名为Java ME</li>
<li>2006年12月，SUN公司发布JRE6.0</li>
<li>2009年04月20日，甲骨文74亿美元收购Sun。取得java的版权。</li>
<li>2010年11月，由于甲骨文对于Java社区的不友善，因此Apache扬言将退出JCP[4]。</li>
<li>2011年7月28日，甲骨文发布 Java7.0 的正式版。</li>
<li>2014年3月18日，Oracle公司发表 Java SE 8。</li>
<li>2017年9月21日，Oracle公司发表 Java SE 9</li>
<li>2018年3月21日，Oracle公司发表 Java SE 10</li>
<li>2018年9月25日，Java SE 11 发布</li>
<li>2019年3月20日，Java SE 12 发布</li>
</ul>
<hr><h2>Java开发工具</h2>
<p>Java语言尽量保证系统内存在1G以上，其他工具如下所示：</p>

<ul>
<li>Linux 系统、Mac OS 系统、Windows 95/98/2000/XP，WIN 7/8系统。</li>

<li><a href="http://www.oracle.com/technetwork/cn/java/javase/downloads/index.html" target="_blank" rel="noopener noreferrer">Java JDK 7、8……</a></li>

<li><a href="https://notepad-plus-plus.org/" target="_blank" rel="noopener noreferrer">Notepad</a> 编辑器或者其他编辑器。</li>
<li>IDE：<a href="http://www.eclipse.org/downloads/" target="_blank" rel="noopener noreferrer">Eclipse</a></li>
</ul>

<p>安装好以上的工具后，我们就可以输出Java的第一个程序"Hello World！"</p>

	  </div>
    </div>
    <div class="col-lg-12  ">
      <pre class="mScroll">
        <code class="lang-java">
		public class A{
			public static void main(String args[]){
				System.out.print("Hello World!");
			}	
		}
		</code>
    </pre>
    </div>
  </div>	
</div>
<script src="js/jquery.min.js"></script> 
<script src="http://cdn.bootcss.com/highlight.js/8.0/highlight.min.js"></script> 
<script src="js/smoothscroll.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
</body>
</html>
