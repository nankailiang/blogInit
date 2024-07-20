---
title: charAt和charCodeAt
date: 2021-11-15
sidebar: auto
tags: 
 - JS
categories:
 - JS
---

## charAt和charCodeAt  
charAt和charCodeAt长的非常相似，但是功能却不太一样，charAt返回指定位置的字符，而charCodeAt返回指定位置的字符的Unicode编码，个人感觉用来判断字母顺序啥的还是挺不错的（A-Z是65-90，a-z是97-122）
```javascript
    let str = "abc123"
    str.charAt(1) // "b"
    str.charCodeAt(1) // "97"
```
