---
title: script标签defer和async
date: 2024-04-19
sidebar: auto
tags: 
 - HTML
categories:
 - HTML
---

将Javascript插入HTML的主要方法是使用script元素，外部引入——通过src属性指定外部JavaScript文件链接，内部嵌入——直接在HTML文档内使用script标签对引入   
script标签包含了两个特殊的属性：defer与asyn  
- async：属性可选。表示应该立即开始下载脚本，但不能阻止其他页面动作，比如下载资源或等待其他脚本加载。只对外部脚本有效。
- defer：属性可选。表示脚本可以延迟到文档完全被解析和显示之后再执行。只对外部脚本文件有效。在IE7及更早的版本中，对行内脚本也可以指定这个属性。   
如果没有 defer 和 async 属性，浏览器会立即加载并执行相应的外部脚本，“立即”指的是在渲染该script标签之下的（下面的、下文的、紧接着的、紧跟着的、后续的）文档元素之前，也就是说不等待载入后续的文档元素，读到脚本就加载并执行。这样就阻塞了后续文档的加载。

## 推迟执行脚本 defer（延迟、推迟）
HTML4.01为script元素定义了一个叫defer的属性。这个属性表示脚本在执行的时候不会改变页面的结构。也就是说，脚本会被延迟到整个页面都解析完毕后再运行。因此，在script元素上设置defer属性，相当于告诉浏览器立即下载，但延迟执行
```html
<!DOCTYPE html>
<html>
    <head>
        <title>Example HTML Page</title>
        <script defer src="example1.js"></script>
        <script defer src="example2.js"></script>
    </head>
    <body>
        <!-- 这里是页面内容 -->
    </body>
</html>
```
虽然这个例子中的script元素包含在页面的head中，但它们会在浏览器解析到结束的/html标签后才会执行。   
HTML5规范要求脚本应该按照它们出现的顺序执行，因此第一个推迟的脚本会在第二个推迟的脚本之前执行，而且两者都会在DOMContentLoaded事件之前执行。   
不过在实际当中，推迟执行的脚本不一定总会按顺序执行或者在 DOMContentLoaded事件之前执行，因此最好只包含一个这样的脚本。   
如前所述，defer属性只对外部脚本文件才有效。这是HTML5中明确规定的，因此支持HTML5的浏览器会忽略行内脚本的defer属性。IE4~7展示出的都是旧的行为，IE8及更高版本则支持 HTML5定义的行为。   
对defer属性的支持是从IE4、Firefox 3.5、Safari 5和Chrome 7开始的。其他所有浏览器则会忽略这个属性，按照通常的做法来处理脚本。考虑到这一点，还是把要推迟执行的脚本放在页面底部比较好。

## 异步执行脚本 async（异步）
HTML5为script元素定义了async属性。从改变脚本处理方式上看，async属性与defer类似。
当然，它们两者也都只适用于外部脚本，都会告诉浏览器立即开始下载。不过，与 defer 不同的是，标记为 async 的脚本并不保证能按照它们出现的次序执行，比如：
```html
<!DOCTYPE html>
<html>
    <head>
        <title>Example HTML Page</title>
        <script defer src="example1.js"></script>
        <script defer src="example2.js"></script>
    </head>
    <body>
        <!-- 这里是页面内容 -->
    </body>
</html>
```
在这个例子中，第二个脚本可能先于第一个脚本执行。因此，重点在于它们之间没有依赖关系。给脚本添加 async 属性的目的是告诉浏览器，不必等脚本下载和执行完后再加载页面，同样也不必等到该异步脚本下载和执行后再加载其他脚本。正因为如此，异步脚本不应该在加载期间修改 DOM。   
异步脚本保证会在页面的load事件前执行，但可能会在 DOMContentLoaded之前或之后。Firefox3.6、Safari 5和Chrome 7支持异步脚本。使用async也会告诉页面你不会使用document.write，不过好的 Web 开发实践根本就不推荐使用这个方法（document.write）。   

## load和DOMContentLoaded事件
MDN的解释：   
- load：应该仅用于检测一个完全加载的页面，当一个资源及其依赖资源已完成加载时，将触发load事件。意思是页面的html、css、js、图片等资源都已经加载完之后才会触发 load 事件。
- DOMContentLoaded：当初始的 HTML 文档被完全加载和解析完成之后，DOMContentLoaded 事件被触发，而无需等待样式表、图像和子框架的完成加载。