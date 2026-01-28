---
title: Java中创建线程的几种方式
date: 2024-02-03
sidebar: auto
tags: 
 - Java
categories:
 - Java
---

1. 继承 Thread 类： 重写 run() 方法。
2. 实现 Runnable 接口： 实现 run() 方法，然后将 Runnable 实例作为参数传递给 Thread 构造函数。（推荐，避免单继承限制，更符合面向对象设计）
3. 实现 Callable 接口： 实现 call() 方法，该方法可以有返回值并抛出异常。通常配合 FutureTask 和 Thread 使用。
4. 使用线程池 (ExecutorService)： 通过 Executors 工厂类创建线程池，提交 Runnable 或 Callable 任务。（生产环境强烈推荐，管理线程生命周期，复用线程，控制并发）