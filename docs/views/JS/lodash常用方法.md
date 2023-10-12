---
title: lodash常用方法
date: 2021-12-28
sidebar: auto
tags: 
 - JS
categories:
 - JS
---

## _.get(object, path, [defaultValue])
根据 object对象的path路径获取值。 如果解析 value 是 undefined 会以 defaultValue 取代。
- object (Object): 要检索的对象。
- path (Array|string): 要获取属性的路径。
- [defaultValue] (*): 如果解析值是 undefined ，这值会被返回。
```javascript
    var object = { 'a': [{ 'b': { 'c': 3 } }] };
 
    _.get(object, 'a[0].b.c');
    // => 3
 
    _.get(object, ['a', '0', 'b', 'c']);
    // => 3
 
    _.get(object, 'a.b.c', 'default');
    // => 'default'
```

