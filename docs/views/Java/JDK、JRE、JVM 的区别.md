---
title: JDK、JRE、JVM 的区别
date: 2023-01-08
sidebar: auto
tags: 
 - Java
categories:
 - Java
---

JDK（Java Development Kit）是Java开发工具包，包含JRE+开发工具（javac、javadoc等），用于开发、编译、运行Java程序。

JRE（Java Runtime Environment）是Java运行时环境，包含JVM+核心类库，用于运行已编译的Java程序。

JVM（Java Virtual Machine）是Java虚拟机，负责将字节码文件（.class）解释/编译为本地机器指令，实现跨平台特性。

## 关系
- JDK包含JRE
- JRE包含JVM
