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
<style type="text/css>
 .table {
	width:100%;
	margin:15px 0;
	border:0;
	}
</style>
</head>
<style type="text/css>
 table {
	width:100%;
	margin:15px 0;
	border:0;
	}
</style>
<body class="mScroll">
 <div class="container">
  <div class="jsbg">
    <div class="col-lg-12 mxlength">
      <div class="mx-1">
      <h1>Java 对象和类</h1>
<p>Java作为一种面向对象语言。支持以下基本概念：</p>
<ul>
	<li>
		多态</li>
	<li>
		继承</li>
	<li>
		封装</li>
	<li>
		抽象</li>
	<li>
		类</li>
	<li>
		对象</li>
	<li>
		实例</li>
	<li>
		方法</li>
	<li>
		重载</li>
</ul><p>
本节我们重点研究对象和类的概念。</p>
<ul>
	<li>
		<strong>对象</strong>：对象是类的一个实例（<strong>对象不是找个女朋友</strong>），有状态和行为。例如，一条狗是一个对象，它的状态有：颜色、名字、品种；行为有：摇尾巴、叫、吃等。</li>
	<li>
		<strong>类</strong>：类是一个模板，它描述一类对象的行为和状态。</li>
</ul>
<p>下图中男孩女孩为类，而具体的每个人为该类的对象：</p>
<p>
<img src="//www.runoob.com/wp-content/uploads/2013/12/object-class.jpg"></p>
<hr>
<h2>
	Java中的对象</h2>
	<p>
	<p>现在让我们深入了解什么是对象。看看周围真实的世界，会发现身边有很多对象，车，狗，人等等。所有这些对象都有自己的状态和行为。</p>
	<p>拿一条狗来举例，它的状态有：名字、品种、颜色，行为有：叫、摇尾巴和跑。</p>
	<p>对比现实对象和软件对象，它们之间十分相似。</p>
	<p>软件对象也有状态和行为。软件对象的状态就是属性，行为通过方法体现。</p>
	<p>在软件开发中，方法操作对象内部状态的改变，对象的相互调用也是通过方法来完成。</p>
<h2>Java中的类</h2>
<p>类可以看成是创建Java对象的模板。</p>
<p>通过下面一个简单的类来理解下Java中类的定义：</p>
<div class="col-lg-12  ">
      <pre class="mScroll">
        <code class="lang-java">
			public class Dog{
  			String breed;
  			int age;
  			String color;
  			void barking(){
 		 	}
  			void hungry(){
  			}
 
 		 	void sleeping(){
  			}
		}
		</code>
    </pre>
    </div>
<p>一个类可以包含以下类型变量：</p>
<ul>
	<li>
		<strong>局部变量</strong>：在方法、构造方法或者语句块中定义的变量被称为局部变量。变量声明和初始化都是在方法中，方法结束后，变量就会自动销毁。</li>
	<li>
		<strong>成员变量</strong>：成员变量是定义在类中，方法体之外的变量。这种变量在创建对象的时候实例化。成员变量可以被类中方法、构造方法和特定类的语句块访问。</li>
	<li>
		<strong>类变量</strong>：类变量也声明在类中，方法体之外，但必须声明为static类型。</li>
</ul>
<p>一个类可以拥有多个方法，在上面的例子中：barking()、hungry()和sleeping()都是Dog类的方法。

</p><hr>
<h2>构造方法</h2>
<p>每个类都有构造方法。如果没有显式地为类定义构造方法，Java编译器将会为该类提供一个默认构造方法。</p>
<p>在创建一个对象的时候，至少要调用一个构造方法。构造方法的名称必须与类同名，一个类可以有多个构造方法。</p>
<p>下面是一个构造方法示例：</p>
<div class="col-lg-12  ">
      <pre class="mScroll">
        <code class="lang-java">
		public class Puppy{
    		public Puppy(){
   			 }
 
    		public Puppy(String name){
        	// 这个构造器仅有一个参数：name
    		}
		}
		</code>
    </pre>
    </div>
<hr>
<h2>创建对象</h2>
<p>对象是根据类创建的。在Java中，使用关键字new来创建一个新的对象。创建对象需要以下三步：</p>
<ul>
	<li>
		<strong>声明</strong>：声明一个对象，包括对象名称和对象类型。</li>
	<li>
		<strong>实例化</strong>：使用关键字new来创建一个对象。</li>
	<li>
		<strong>初始化</strong>：使用new创建对象时，会调用构造方法初始化对象。</li>
</ul>
<p>下面是一个创建对象的例子：</p>

<div class="col-lg-12  ">
      <pre class="mScroll">
        <code class="lang-java">
		public class Puppy{
  			 public Puppy(String name){
     		 //这个构造器仅有一个参数：name
       		 System.out.println("小狗的名字是 : " + name ); 
   			}
   			public static void main(String[] args){
      		// 下面的语句将创建一个Puppy对象
      			Puppy myPuppy = new Puppy( "tommy" );
   			}
		}
		</code>
    </pre>
    </div>
<p>编译并运行上面的程序，会打印出下面的结果：</p>
<pre>
<code>
小狗的名字是 : tommy
</code>
</pre>
<hr><h2>
访问实例变量和方法</h2>
<p>

通过已创建的对象来访问成员变量和成员方法，如下所示：</p>
<div class="col-lg-12  ">
      <pre class="mScroll">
        <code class="lang-java">
		/* 实例化对象 */
		Object referenceVariable = new Constructor();
		/* 访问类中的变量 */
		referenceVariable.variableName;
		/* 访问类中的方法 */
		referenceVariable.methodName();
		</code>
    </pre>
    </div>
<hr>
<h2>实例</h2><p>

下面的例子展示如何访问实例变量和调用成员方法：</p>
<div class="col-lg-12  ">
      <pre class="mScroll">
        <code class="lang-java">
		public class Puppy{
   			int puppyAge;
   			public Puppy(String name){
      		// 这个构造器仅有一个参数：name
      			System.out.println("小狗的名字是 : " + name ); 
  			 }
 
  			 public void setAge( int age ){
      			 puppyAge = age;
   			}
 
   			public int getAge( ){
       			System.out.println("小狗的年龄为 : " + puppyAge ); 
       			return puppyAge;
   			}
 
   			public static void main(String[] args){
      			/* 创建对象 */
      			Puppy myPuppy = new Puppy( "tommy" );
      			/* 通过方法来设定age */
      			myPuppy.setAge( 2 );
      			/* 调用另一个方法获取age */
      			myPuppy.getAge( );
      			/*你也可以像下面这样访问成员变量 */
      			System.out.println("变量值 : " + myPuppy.puppyAge ); 
  			 }
		}
		</code>
    </pre>
    </div>

<p>
编译并运行上面的程序，产生如下结果：
</p>
<pre>
<code>
小狗的名字是 : tommy
小狗的年龄为 : 2
变量值 : 2
</code>
</pre>
<hr>
<h2>源文件声明规则</h2>
<p>在本节的最后部分，我们将学习源文件的声明规则。当在一个源文件中定义多个类，并且还有import语句和package语句时，要特别注意这些规则。</p>
<ul>
	<li>
		一个源文件中只能有一个public类</li>
	<li>
		一个源文件可以有多个非public类</li>
	<li>
		源文件的名称应该和public类的类名保持一致。例如：源文件中public类的类名是Employee，那么源文件应该命名为Employee.java。</li>
	<li>
		如果一个类定义在某个包中，那么package语句应该在源文件的首行。</li>
	<li>
		如果源文件包含import语句，那么应该放在package语句和类定义之间。如果没有package语句，那么import语句应该在源文件中最前面。</li>
	<li>
		import语句和package语句对源文件中定义的所有类都有效。在同一源文件中，不能给不同的类不同的包声明。</li>
</ul>
<p>类有若干种访问级别，并且类也分不同的类型：抽象类和final类等。这些将在访问控制章节介绍。</p>
<p>除了上面提到的几种类型，Java还有一些特殊的类，如：内部类、匿名类。</p>
<hr>
<h2>Java包</h2>
<p>包主要用来对类和接口进行分类。当开发Java程序时，可能编写成百上千的类，因此很有必要对类和接口进行分类。</p>
<h2>Import语句</h2>
<p>在Java中，如果给出一个完整的限定名，包括包名、类名，那么Java编译器就可以很容易地定位到源代码或者类。Import语句就是用来提供一个合理的路径，使得编译器可以找到某个类。</p>
<p>例如，下面的命令行将会命令编译器载入java_installation/java/io路径下的所有类</p>
<pre>
<code>
import java.io.*;
</code>
</pre>
<hr>
<h2>一个简单的例子</h2>
<p>在该例子中，我们创建两个类：<strong>Employee</strong> 和 <strong>EmployeeTest</strong>。</p>
<p>
首先打开文本编辑器，把下面的代码粘贴进去。注意将文件保存为 Employee.java。</p>
<p>
Employee类有四个成员变量：name、age、designation和salary。该类显式声明了一个构造方法，该方法只有一个参数。</p>
<h2 class="example">Employee.java 文件代码：</h2>
<div class="col-lg-12  ">
      <pre class="mScroll">
        <code class="lang-java">
	import java.io.*;
 
		public class Employee{
   			String name;
   			int age;
   			String designation;
   			double salary;
   			// Employee 类的构造器
   			public Employee(String name){
      			this.name = name;
   			}
   			// 设置age的值
   			public void empAge(int empAge){
      			age =  empAge;
   			}
   			/* 设置designation的值*/
  			 public void empDesignation(String empDesig){
      			designation = empDesig;
   			}
   			/* 设置salary的值*/
   			public void empSalary(double empSalary){
      			salary = empSalary;
   			}
   			/* 打印信息 */
   			public void printEmployee(){
      			System.out.println("名字:"+ name );
      			System.out.println("年龄:" + age );
      			System.out.println("职位:" + designation );
      			System.out.println("薪水:" + salary);
   			}
		}
		</code>
    </pre>
    </div>

<p>程序都是从main方法开始执行。为了能运行这个程序，必须包含main方法并且创建一个实例对象。</p>

<p>下面给出EmployeeTest类，该类实例化2个 Employee 类的实例，并调用方法设置变量的值。</p>

<p>将下面的代码保存在 EmployeeTest.java文件中。</p>
<div class="col-lg-12  ">
      <pre class="mScroll">
        <code class="lang-java">
	import java.io.*;
		public class EmployeeTest{
 
  			 public static void main(String[] args){
      			/* 使用构造器创建两个对象 */
      			Employee empOne = new Employee("RUNOOB1");
      			Employee empTwo = new Employee("RUNOOB2");
 
      			// 调用这两个对象的成员方法
      			empOne.empAge(26);
      			empOne.empDesignation("高级程序员");
      			empOne.empSalary(1000);
      			empOne.printEmployee();
 
      			empTwo.empAge(21);
      			empTwo.empDesignation("菜鸟程序员");
      			empTwo.empSalary(500);
      			empTwo.printEmployee();
   			}
		}
		</code>
    </pre>
    </div>
<p>编译这两个文件并且运行 EmployeeTest 类，可以看到如下结果：</p>
<pre>
<code>
$ javac EmployeeTest.java
$ java EmployeeTest 
名字:RUNOOB1
年龄:26
职位:高级程序员
薪水:1000.0
名字:RUNOOB2
年龄:21
职位:菜鸟程序员
薪水:500.0
</code>
</pre>
      
      
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