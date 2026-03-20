---
title: String、StringBuffer、StringBuilder 的区别
date: 2024-04-01
sidebar: auto
tags: 
 - Java
categories:
 - Java
---

## 底层实现
- 均基于char数组（JDK9后为byte数组）
- String是final修饰的不可变数组
- StringBuffer和StringBuilder是可变数组

## 线程安全性
- String不可变天然安全
- StringBuffer加synchronized修饰线程安全
- StringBuilder无同步机制非线程安全

## 效率
- String拼接创建新对象效率最低
- StringBuilder效率最高
- StringBuffer次之

## 适用场景
- String适用于常量拼接
- StringBuffer适用于多线程变量拼接
- StringBuilder适用于单线程变量拼接
- 