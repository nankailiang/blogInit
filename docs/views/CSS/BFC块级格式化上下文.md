---
title: BFC块级格式化上下文
date: 2021-12-07
sidebar: auto
tags: 
 - CSS
categories:
 - CSS
---

## BFC (Block Formatting Context)

BFC，即块级格式化上下文。BFC的主要功能是创建一个隔离的渲染区域，其中内部元素的布局不会受到外部或相邻元素的影响。它能解决一些常见的布局问题，如浮动元素的包含和边距塌陷。

### BFC的特点
- 一个隔离的容器，其中的内部元素不会影响外部的元素。
- 容器能自动适应并包含浮动的子元素，不会影响其自身的高度。
- 可以防止边距塌陷，即使在父子元素间也是如此。
- 明确了浮动元素与非浮动元素之间的布局关系。

### 如何触发BFC
1. 将`float`属性设置为`left`或`right`。
2. 将`position`属性设置为`absolute`或`fixed`。
3. 将`overflow`属性设置为`hidden`、`auto`或`scroll`。
4. 将`display`属性设置为`inline-block`、`table-cell`、`table-caption`、`flex`、`inline-flex`或`grid`。
5. 使用标准的块级元素，如`div`、`p`、`h1`至`h6`、`ul`、`ol`、`li`等，它们默认生成BFC，但通常无需额外设置。
6. 使用`display: flow-root`，这是专为创建BFC而设的属性值。

#### 示例代码
```css
.bfc-element {
  /* 通过将overflow设置为非visible值来触发BFC */
  overflow: auto;

  /* 或者使用其他方式 */
  /* float: left; */
  /* position: absolute; */
  /* display: flex; */
}
```