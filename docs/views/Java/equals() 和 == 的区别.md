---
title: equals() 和 == 的区别
date: 2024-03-01
sidebar: auto
tags: 
 - Java
categories:
 - Java
---

## == 运算符
是 Java 的原生运算符，作用分两种情况：
对基本数据类型（如 int、double、char 等）：比较的是值是否相等；
对引用数据类型（如 String、自定义类、数组等）：比较的是内存地址是否相等（即是否指向同一个对象）。

## equals() 方法
是Object类中定义的方法（所有 Java 类都继承自 Object），默认实现和==对引用类型的逻辑一致（比较地址），但可被重写（如 String、Integer 等常用类都重写了该方法），重写后通常用于比较对象的内容 / 属性是否相等。
