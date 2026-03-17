---
title: start() 和 run() 方法的区别
date: 2025-02-15
sidebar: auto
tags: 
 - Java
categories:
 - Java
---

## start() 和 run() 方法的区别

### start() 方法
- **作用**：用于启动线程，使线程进入就绪状态，等待CPU调度，调度后执行run()方法
- **特点**：启动新线程，只能调用一次（多次调用抛IllegalThreadStateException）

### run() 方法
- **作用**：线程的任务执行方法，仅普通方法调用，无线程启动效果
- **特点**：不启动新线程（在当前线程执行），可多次调用

## 执行时机
- start()调用后线程就绪，等待调度
- run()在调度后执行