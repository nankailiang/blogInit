---
title: this 和 super 的作用
date: 2024-12-01
sidebar: auto
tags: 
 - Java
categories:
 - Java
---

## this 的作用
- 指向当前对象
- 用于访问当前对象的成员变量、方法
- 调用当前对象的其他构造方法（this()）

## super 的作用
- 指向父类对象
- 用于访问父类的成员变量、方法
- 调用父类的构造方法（super()）

## super() 必须放在构造方法第一行吗
super() 必须放在子类构造方法的第一行，因为子类构造前必须先初始化父类（隐式调用super()无参构造，若父类无无参构造，必须显式调用super(参数)）。

this() 和 super() 不能同时存在于构造方法中（均需占第一行）。
