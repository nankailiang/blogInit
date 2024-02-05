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

## _.debounce(func, [wait=0], [options=])
创建一个 debounced（防抖动）函数，该函数会从上一次被调用后，延迟 wait 毫秒后调用 func 方法。 debounced（防抖动）函数提供一个 cancel 方法取消延迟的函数调用以及 flush 方法立即调用。 可以提供一个 options（选项） 对象决定如何调用 func 方法，options.leading 与|或 options.trailing 决定延迟前后如何触发（注：是 先调用后等待 还是 先等待后调用）。 func 调用时会传入最后一次提供给 debounced（防抖动）函数 的参数。 后续调用的 debounced（防抖动）函数返回是最后一次 func 调用的结果。   
注意: 如果 leading 和 trailing 选项为 true, 则 func 允许 trailing 方式调用的条件为: 在 wait 期间多次调用防抖方法。
如果 wait 为 0 并且 leading 为 false, func调用将被推迟到下一个点，类似setTimeout为0的超时。   
- func (Function): 要防抖动的函数。
- [wait=0] (number): 需要延迟的毫秒数。
- [options=] (Object): 选项对象。
- [options.leading=false] (boolean): 指定在延迟开始前调用。
- [options.maxWait] (number): 设置 func 允许被延迟的最大值。
- [options.trailing=true] (boolean): 指定在延迟结束后调用。
```javascript
    // 避免窗口在变动时出现昂贵的计算开销。
    jQuery(window).on('resize', _.debounce(calculateLayout, 150));
    
    // 当点击时 `sendMail` 随后就被调用。
    jQuery(element).on('click', _.debounce(sendMail, 300, {
    'leading': true,
    'trailing': false
    }));
    
    // 确保 `batchLog` 调用1次之后，1秒内会被触发。
    var debounced = _.debounce(batchLog, 250, { 'maxWait': 1000 });
    var source = new EventSource('/stream');
    jQuery(source).on('message', debounced);
    
    // 取消一个 trailing 的防抖动调用
    jQuery(window).on('popstate', debounced.cancel);
```

## _.throttle(func, [wait=0], [options=])
创建一个节流函数，在 wait 秒内最多执行 func 一次的函数。 该函数提供一个 cancel 方法取消延迟的函数调用以及 flush 方法立即调用。 可以提供一个 options 对象决定如何调用 func 方法， options.leading 与|或 options.trailing 决定 wait 前后如何触发。 func 会传入最后一次传入的参数给这个函数。 随后调用的函数返回是最后一次 func 调用的结果。   
注意: 如果 leading 和 trailing 都设定为 true 则 func 允许 trailing 方式调用的条件为: 在 wait 期间多次调用。
如果 wait 为 0 并且 leading 为 false, func调用将被推迟到下一个点，类似setTimeout为0的超时。  
- func (Function): 要节流的函数。
- [wait=0] (number): 需要节流的毫秒。
- [options=] (Object): 选项对象。
- [options.leading=true] (boolean): 指定调用在节流开始前。
- [options.trailing=true] (boolean): 指定调用在节流结束后。
```javascript
    // 避免在滚动时过分的更新定位
    jQuery(window).on('scroll', _.throttle(updatePosition, 100));
    
    // 点击后就调用 `renewToken`，但5分钟内超过1次。
    var throttled = _.throttle(renewToken, 300000, { 'trailing': false });
    jQuery(element).on('click', throttled);
    
    // 取消一个 trailing 的节流调用。
    jQuery(window).on('popstate', throttled.cancel);
```