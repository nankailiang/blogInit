---
title: flex常用属性
date: 2022-05-16
sidebar: auto
tags: 
 - CSS
categories:
 - CSS
---

## 父容器
### justify-content 项目在主轴上的对齐方式  
- flex-start | flex-end | center | space-between | space-around
- space-between 子容器沿主轴均匀分布，位于首尾两端的子容器与父容器相切。
- space-around  子容器沿主轴均匀分布，位于首尾两端的子容器到父容器的距离是子容器间距的一半。  
### align-items 定义项目在侧轴上如何对齐  
- flex-start | flex-end | center | baseline | stretch;
- baseline: 项目的第一行文字的基线对齐。
- stretch（默认值）：如果项目未设置高度或设为auto，将占满整个容器的高度。

## 子容器
### align-self   单个项目对齐方式
- align-self:   auto | flex-start | flex-end | center | baseline | stretch;
### flex：前面三个属性的简写 是flex-grow  flex-shrink flex-basis的简写
- flex-grow 放大比例 根据所设置的比例分配盒子所剩余的空间
- flex-shrink 缩小比例 设置元素的收缩比例   多出盒子的部分，按照比例的大小砍掉相应的大小，即比例越大，被砍的越大，默认值是1
- flex-basis  伸缩基准值 项目占据主轴的空间
- flex-basis 该属性设置元素的宽度或高度，当然width也可以用来设置元素宽度，如果元素上同时出现了width 和flex-basis那么flex-basis会覆盖width的值  
flex: 0 1 auto； 默认主轴是row,那么不会去放大比例，如果所有的子元素宽度和大于父元素宽度时，就会按照比例的大小去砍掉相应的大小。

## 轴
### flex-direction 决定主轴的方向 即项目的排列方向
- row | row-reverse | column | column-reverse