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

<style>
 .table {
	width:100%;
	margin:15px 0;
	border:0;
	}
</style>
<body>

<div class="container">
  <div class="jsbg">
    <div class="col-lg-12 mxlength">
      <div class="mx-1"> 
			<h1>Java 多线程编程
</h1>
<p>
Java 给多线程编程提供了内置的支持。
一条线程指的是进程中一个单一顺序的控制流，一个进程中可以并发多个线程，每条线程并行执行不同的任务。</p><p>
多线程是多任务的一种特别的形式，但多线程使用了更小的资源开销。</p><p>
这里定义和线程相关的另一个术语 - 进程：一个进程包括由操作系统分配的内存空间，包含一个或多个线程。一个线程不能独立的存在，它必须是进程的一部分。一个进程一直运行，直到所有的非守护线程都结束运行后才能结束。</p><p>
多线程能满足程序员编写高效率的程序来达到充分利用 CPU 的目的。</p><hr>
<h2>
一个线程的生命周期
</h2>
<p>
线程是一个动态执行的过程，它也有一个从产生到死亡的过程。</p>
<ul>
<li><b>新建状态:</b><p>使用 <strong>new</strong> 关键字和 <strong>Thread</strong> 类或其子类建立一个线程对象后，该线程对象就处于新建状态。它保持这个状态直到程序 <strong>start()</strong> 这个线程。</p></li>

<li><b>就绪状态:</b><p>当线程对象调用了start()方法之后，该线程就进入就绪状态。就绪状态的线程处于就绪队列中，要等待JVM里线程调度器的调度。</p></li>
<li><b>运行状态:</b><p>如果就绪状态的线程获取 CPU 资源，就可以执行 <strong>run()</strong>，此时线程便处于运行状态。处于运行状态的线程最为复杂，它可以变为阻塞状态、就绪状态和死亡状态。</p></li>
<li><b>阻塞状态:</b><p>如果一个线程执行了sleep（睡眠）、suspend（挂起）等方法，失去所占用资源之后，该线程就从运行状态进入阻塞状态。在睡眠时间已到或获得设备资源后可以重新进入就绪状态。可以分为三种：  </p>

<ul><li><p>等待阻塞：运行状态中的线程执行 wait() 方法，使线程进入到等待阻塞状态。
</p></li><li><p>同步阻塞：线程在获取 synchronized 同步锁失败(因为同步锁被其他线程占用)。
</p></li><li><p>其他阻塞：通过调用线程的 sleep() 或 join() 发出了 I/O 请求时，线程就会进入到阻塞状态。当sleep() 状态超时，join() 等待线程终止或超时，或者 I/O 处理完毕，线程重新转入就绪状态。</p></li>

</ul>
</li>
<li><b>死亡状态: </b><p>一个运行状态的线程完成任务或者其他终止条件发生时，该线程就切换到终止状态。</p></li>
</ul>
<hr>
<h2>
线程的优先级</h2>
<p>每一个 Java 线程都有一个优先级，这样有助于操作系统确定线程的调度顺序。</p><p>Java 线程的优先级是一个整数，其取值范围是 1 （Thread.MIN_PRIORITY ） - 10 （Thread.MAX_PRIORITY ）。</p><p>默认情况下，每一个线程都会分配一个优先级 NORM_PRIORITY（5）。
</p><p>具有较高优先级的线程对程序更重要，并且应该在低优先级的线程之前分配处理器资源。但是，线程优先级不能保证线程执行的顺序，而且非常依赖于平台。</p>
<hr>
<h2>
创建一个线程</h2>
<p>Java 提供了三种创建线程的方法：</p>
<ul><li>
通过实现 Runnable 接口；</li><li>
通过继承  Thread 类本身；</li>
<li>通过 Callable 和 Future 创建线程。</li>
</ul>
<hr><h2>
通过实现 Runnable 接口来创建线程</h2>
<p>
创建一个线程，最简单的方法是创建一个实现 Runnable 接口的类。</p><p>
为了实现 Runnable，一个类只需要执行一个方法调用 run()，声明如下：</p><p>
<div class="col-lg-12  ">
      <pre class="mScroll">
        <code class="lang-java">
        public void run()
       </code>
       </pre>
       </div>
<p>
你可以重写该方法，重要的是理解的 run() 可以调用其他方法，使用其他类，并声明变量，就像主线程一样。</p><p>
在创建一个实现 Runnable 接口的类之后，你可以在类中实例化一个线程对象。</p><p>
Thread 定义了几个构造方法，下面的这个是我们经常使用的：</p>
<div class="col-lg-12  ">
      <pre class="mScroll">
        <code class="lang-java">
       Thread(Runnable threadOb,String threadName);
       </code>
       </pre>
       </div>
<p>
这里，threadOb 是一个实现 Runnable 接口的类的实例，并且 threadName 指定新线程的名字。</p><p>
新线程创建之后，你调用它的 start() 方法它才会运行。</p>
<div class="col-lg-12  ">
      <pre class="mScroll">
        <code class="lang-java">
      void start();
       </code>
       </pre>
       </div>

<p>
下面是一个创建线程并开始让它执行的实例：
</p>
<div class="col-lg-12  ">
      <pre class="mScroll">
        <code class="lang-java">
      class RunnableDemo implements Runnable {
   private Thread t;
   private String threadName;
   
   RunnableDemo( String name) {
      threadName = name;
      System.out.println("Creating " +  threadName );
   }
   
   public void run() {
      System.out.println("Running " +  threadName );
      try {
         for(int i = 4; i > 0; i--) {
            System.out.println("Thread: " + threadName + ", " + i);
            // 让线程睡眠一会
            Thread.sleep(50);
         }
      }catch (InterruptedException e) {
         System.out.println("Thread " +  threadName + " interrupted.");
      }
      System.out.println("Thread " +  threadName + " exiting.");
   }
   
   public void start () {
      System.out.println("Starting " +  threadName );
      if (t == null) {
         t = new Thread (this, threadName);
         t.start ();
      }
   }
}
 
public class TestThread {
 
   public static void main(String args[]) {
      RunnableDemo R1 = new RunnableDemo( "Thread-1");
      R1.start();
      
      RunnableDemo R2 = new RunnableDemo( "Thread-2");
      R2.start();
   }   
}
       </code>
       </pre>
       </div>
<p>
编译以上程序运行结果如下：
 </p>
 <div class="col-lg-12  ">
      <pre class="mScroll">
      <code class="lang-java">
Creating Thread-1
Starting Thread-1
Creating Thread-2
Starting Thread-2
Running Thread-1
Thread: Thread-1, 4
Running Thread-2
Thread: Thread-2, 4
Thread: Thread-1, 3
Thread: Thread-2, 3
Thread: Thread-1, 2
Thread: Thread-2, 2
Thread: Thread-1, 1
Thread: Thread-2, 1
Thread Thread-1 exiting.
Thread Thread-2 exiting.
       </code>
       </pre>
       </div>

<hr>
<h2>
通过继承Thread来创建线程</h2>
<p>
创建一个线程的第二种方法是创建一个新的类，该类继承 Thread 类，然后创建一个该类的实例。</p><p>
继承类必须重写 run() 方法，该方法是新线程的入口点。它也必须调用 start() 方法才能执行。</p>
<p>该方法尽管被列为一种多线程实现方式，但是本质上也是实现了 Runnable 接口的一个实例。</p>
<div class="col-lg-12  ">
      <pre class="mScroll">
        <code class="lang-java">
class ThreadDemo extends Thread {
   private Thread t;
   private String threadName;
   
   ThreadDemo( String name) {
      threadName = name;
      System.out.println("Creating " +  threadName );
   }
   
   public void run() {
      System.out.println("Running " +  threadName );
      try {
         for(int i = 4; i > 0; i--) {
            System.out.println("Thread: " + threadName + ", " + i);
            // 让线程睡眠一会
            Thread.sleep(50);
         }
      }catch (InterruptedException e) {
         System.out.println("Thread " +  threadName + " interrupted.");
      }
      System.out.println("Thread " +  threadName + " exiting.");
   }
   
   public void start () {
      System.out.println("Starting " +  threadName );
      if (t == null) {
         t = new Thread (this, threadName);
         t.start ();
      }
   }
}
 
public class TestThread {
 
   public static void main(String args[]) {
      ThreadDemo T1 = new ThreadDemo( "Thread-1");
      T1.start();
      
      ThreadDemo T2 = new ThreadDemo( "Thread-2");
      T2.start();
   }   
}
       </code>
       </pre>
       </div>
<p>编译以上程序运行结果如下：
</p>
<div class="col-lg-12  ">
      <pre class="mScroll">
      <code class="lang-java">
Creating Thread-1
Starting Thread-1
Creating Thread-2
Starting Thread-2
Running Thread-1
Thread: Thread-1, 4
Running Thread-2
Thread: Thread-2, 4
Thread: Thread-1, 3
Thread: Thread-2, 3
Thread: Thread-1, 2
Thread: Thread-2, 2
Thread: Thread-1, 1
Thread: Thread-2, 1
Thread Thread-1 exiting.
Thread Thread-2 exiting.
</code>
       </pre>
       </div>
<hr>
<h2>
Thread 方法</h2>
<p>
下表列出了Thread类的一些重要方法：
</p>
<table class="table">
	<tbody>
		<tr>
			<th>
				<strong>序号</strong></th>
			<th style="text-align: center;">
				<strong>方法描述</strong></th>
		</tr>
		<tr>
			<td>
				1</td>
			<td>
				<strong>public void start()</strong><br>
				使该线程开始执行；<b style="color:black;background-color:#ffff66">Java</b> 虚拟机调用该线程的&nbsp;run&nbsp;方法。</td>
		</tr>
		<tr>
			<td>
				2</td>
			<td>
				<strong>public void run()</strong><br>
				如果该线程是使用独立的&nbsp;Runnable&nbsp;运行对象构造的，则调用该&nbsp;Runnable&nbsp;对象的&nbsp;run&nbsp;方法；否则，该方法不执行任何操作并返回。</td>
		</tr>
		<tr>
			<td>
				3</td>
			<td>
				<strong>public final void setName(String name)</strong><br>
				改变线程名称，使之与参数&nbsp;name&nbsp;相同。</td>
		</tr>
		<tr>
			<td>
				4</td>
			<td>
				<strong>public final void setPriority(int priority)</strong><br>
				&nbsp;更改线程的优先级。</td>
		</tr>
		<tr>
			<td>
				5</td>
			<td>
				<strong>public final void setDaemon(boolean on)</strong><br>
				将该线程标记为守护线程或用户线程。</td>
		</tr>
		<tr>
			<td>
				6</td>
			<td>
				<strong>public final void join(long millisec)</strong><br>
				等待该线程终止的时间最长为&nbsp;millis&nbsp;毫秒。</td>
		</tr>
		<tr>
			<td>
				7</td>
			<td>
				<strong>public void interrupt()</strong><br>
				中断线程。</td>
		</tr>
		<tr>
			<td>
				8</td>
			<td>
				<strong>public final boolean isAlive()</strong><br>
				测试线程是否处于活动状态。</td>
		</tr>
	</tbody>
</table>
<p>测试线程是否处于活动状态。 上述方法是被Thread对象调用的。下面的方法是Thread类的静态方法。
</p>
<table class="table">
	<tbody>
		<tr>
			<th>
				<strong>序号</strong></th>
			<th style="text-align: center;">
				<strong>方法描述</strong></th>
		</tr>
		<tr>
			<td>
				1</td>
			<td>
				<strong>public static void yield()</strong><br>
				暂停当前正在执行的线程对象，并执行其他线程。</td>
		</tr>
		<tr>
			<td>
				2</td>
			<td>
				<strong>public static void sleep(long millisec)</strong><br>
				在指定的毫秒数内让当前正在执行的线程休眠（暂停执行），此操作受到系统计时器和调度程序精度和准确性的影响。</td>
		</tr>
		<tr>
			<td>
				3</td>
			<td>
				<strong>public static boolean holdsLock(Object x)</strong><br>
				当且仅当当前线程在指定的对象上保持监视器锁时，才返回&nbsp;true。</td>
		</tr>
		<tr>
			<td>
				4</td>
			<td>
				<strong>public static Thread currentThread()</strong><br>
				返回对当前正在执行的线程对象的引用。</td>
		</tr>
		<tr>
			<td>
				5</td>
			<td>
				<strong>public static void dumpStack()</strong><br>
				将当前线程的堆栈跟踪打印至标准错误流。</td>
		</tr>
	</tbody>
</table>

<h3>实例</h3>
<p>
如下的ThreadClassDemo 程序演示了Thread类的一些方法：
</p>
<div class="col-lg-12  ">
<h2 class="example">DisplayMessage.java文件代码：</h2> 
      <pre class="mScroll">
        <code class="lang-java">
// 文件名 : DisplayMessage.java
// 通过实现 Runnable 接口创建线程
public class DisplayMessage implements Runnable {
   private String message;
   
   public DisplayMessage(String message) {
      this.message = message;
   }
   
   public void run() {
      while(true) {
         System.out.println(message);
      }
   }
}
       </code>
       </pre>
       </div>
<div class="col-lg-12  ">
<h2 class="example">GuessANumber.java文件代码：</h2> 
      <pre class="mScroll">
        <code class="lang-java">
// 文件名 : GuessANumber.java
// 通过继承 Thread 类创建线程
 
public class GuessANumber extends Thread {
   private int number;
   public GuessANumber(int number) {
      this.number = number;
   }
   
   public void run() {
      int counter = 0;
      int guess = 0;
      do {
         guess = (int) (Math.random() * 100 + 1);
         System.out.println(this.getName() + " guesses " + guess);
         counter++;
      } while(guess != number);
      System.out.println("** Correct!" + this.getName() + "in" + counter + "guesses.**");
   }
}
       </code>
       </pre>
       </div>
<div class="col-lg-12  ">
<h2 class="example">ThreadClassDemo.java文件代码：</h2> 
      <pre class="mScroll">
        <code class="lang-java">
// 文件名 : ThreadClassDemo.java
public class ThreadClassDemo {
 
   public static void main(String [] args) {
      Runnable hello = new DisplayMessage("Hello");
      Thread thread1 = new Thread(hello);
      thread1.setDaemon(true);
      thread1.setName("hello");
      System.out.println("Starting hello thread...");
      thread1.start();
      
      Runnable bye = new DisplayMessage("Goodbye");
      Thread thread2 = new Thread(bye);
      thread2.setPriority(Thread.MIN_PRIORITY);
      thread2.setDaemon(true);
      System.out.println("Starting goodbye thread...");
      thread2.start();
 
      System.out.println("Starting thread3...");
      Thread thread3 = new GuessANumber(27);
      thread3.start();
      try {
         thread3.join();
      }catch(InterruptedException e) {
         System.out.println("Thread interrupted.");
      }
      System.out.println("Starting thread4...");
      Thread thread4 = new GuessANumber(75);
      
      thread4.start();
      System.out.println("main() is ending...");
   }
}
       </code>
       </pre>
       </div>

<p>
运行结果如下，每一次运行的结果都不一样。
 </p>
<div class="col-lg-12  ">
      <pre class="mScroll">
      <code class="lang-java">
Starting hello thread...
Starting goodbye thread...
Hello
Hello
Hello
Hello
Hello
Hello
Goodbye
Goodbye
Goodbye
Goodbye
Goodbye
.......
</code>
       </pre>
       </div>

<hr>
<h2>通过 Callable 和 Future 创建线程</h2><ul><li><p>
1. 创建 Callable 接口的实现类，并实现 call() 方法，该 call() 方法将作为线程执行体，并且有返回值。</p></li><li><p>
2. 创建 Callable 实现类的实例，使用 FutureTask 类来包装 Callable 对象，该 FutureTask 对象封装了该 Callable 对象的 call() 方法的返回值。</p></li><li><p>
3. 使用 FutureTask 对象作为 Thread 对象的 target 创建并启动新线程。</p></li><li><p>
4. 调用 FutureTask 对象的 get() 方法来获得子线程执行结束后的返回值。</p></li></ul>
<div class="col-lg-12  ">
<h2 class="example">GuessANumber.java文件代码：</h2> 
      <pre class="mScroll">
        <code class="lang-java">
// 文件名 : GuessANumber.java
// 通过继承 Thread 类创建线程
 
public class GuessANumber extends Thread {
   private int number;
   public GuessANumber(int number) {
      this.number = number;
   }
   
   public void run() {
      int counter = 0;
      int guess = 0;
      do {
         guess = (int) (Math.random() * 100 + 1);
         System.out.println(this.getName() + " guesses " + guess);
         counter++;
      } while(guess != number);
      System.out.println("** Correct!" + this.getName() + "in" + counter + "guesses.**");
   }
}
       </code>
       </pre>
       </div>
<div class="col-lg-12">
      <pre class="mScroll">
        <code class="lang-java">
public class CallableThreadTest implements Callable<Integer> {
    public static void main(String[] args)  
    {  
        CallableThreadTest ctt = new CallableThreadTest();  
        FutureTask<Integer> ft = new FutureTask<>(ctt);  
        for(int i = 0;i < 100;i++)  
        {  
            System.out.println(Thread.currentThread().getName()+" 的循环变量i的值"+i);  
            if(i==20)  
            {  
                new Thread(ft,"有返回值的线程").start();  
            }  
        }  
        try  
        {  
            System.out.println("子线程的返回值："+ft.get());  
        } catch (InterruptedException e)  
        {  
            e.printStackTrace();  
        } catch (ExecutionException e)  
        {  
            e.printStackTrace();  
        }  
  
    }
    @Override  
    public Integer call() throws Exception  
    {  
        int i = 0;  
        for(;i<100;i++)  
        {  
            System.out.println(Thread.currentThread().getName()+" "+i);  
        }  
        return i;  
    }  
}
       </code>
       </pre>
       </div>

<hr>
<h2>创建线程的三种方式的对比</h2>
<ul>
<li><p>1. 采用实现 Runnable、Callable 接口的方式创建多线程时，线程类只是实现了 Runnable 接口或 Callable 接口，还可以继承其他类。</p></li><li><p>
2. 使用继承 Thread 类的方式创建多线程时，编写简单，如果需要访问当前线程，则无需使用 Thread.currentThread() 方法，直接使用 this 即可获得当前线程。</p>
</li></ul>
<hr>
<h2>线程的几个主要概念
</h2>
<p>
在多线程编程时，你需要了解以下几个概念：</p>
<ul>
<li>
线程同步</li><li>
线程间通信</li><li>
线程死锁</li><li>
线程控制：挂起、停止和恢复</li></ul>
<hr><h2>多线程的使用</h2>
<p>
有效利用多线程的关键是理解程序是并发执行而不是串行执行的。例如：程序中有两个子系统需要并发执行，这时候就需要利用多线程编程。</p><p>
通过对多线程的使用，可以编写出非常高效的程序。不过请注意，如果你创建太多的线程，程序执行的效率实际上是降低了，而不是提升了。</p><p>
请记住，上下文的切换开销也很重要，如果你创建了太多的线程，CPU 花费在上下文的切换的时间将多于执行程序的时间！</p>
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
