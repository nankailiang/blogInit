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

## __.orderBy(collection, [iteratees=[_.identity]], [orders])
此方法类似于 _.sortBy，除了它允许指定 iteratee（迭代函数）结果如何排序。 如果没指定 orders（排序），所有值以升序排序。 否则，指定为"desc" 降序，或者指定为 "asc" 升序，排序对应值。
- collection (Array|Object): 用来迭代的集合。
- [iteratees=[_.identity]] (Array[]|Function[]|Object[]|string[]): 排序的迭代函数。
- [orders] (string[]): iteratees迭代函数的排序顺序。
```javascript
    var users = [
        { 'user': 'fred',   'age': 48 },
        { 'user': 'barney', 'age': 34 },
        { 'user': 'fred',   'age': 40 },
        { 'user': 'barney', 'age': 36 }
    ];
 
    // 以 `user` 升序排序 再  `age` 以降序排序。
    _.orderBy(users, ['user', 'age'], ['asc', 'desc']);
    // => objects for [{'barney', 36}, {'barney', 34}, {'fred', 48}, {'fred', 40}]
```
