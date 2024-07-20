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
    var object = { 'a': [{ 'b': { 'c': 3 } }] }
 
    _.get(object, 'a[0].b.c')
    // => 3
 
    _.get(object, ['a', '0', 'b', 'c'])
    // => 3
 
    _.get(object, 'a.b.c', 'default')
    // => 'default'
```

## _.set(object, path, value)
设置 object对象中对应 path 属性路径上的值，如果path不存在，则创建。 缺少的索引属性会创建为数组，而缺少的属性会创建为对象。 使用_.setWith 定制path创建。   
Note: 这个方法会改变 object。
- object (Object): 要修改的对象。
- path (Array|string): 要设置的对象路径。
- value (*): 要设置的值。
```javascript
    var object = { 'a': [{ 'b': { 'c': 3 } }] }
 
    _.set(object, 'a[0].b.c', 4)
    console.log(object.a[0].b.c)
    // => 4
    
    _.set(object, ['x', '0', 'y', 'z'], 5)
    console.log(object.x[0].y.z)
    // => 5
```

## _.cloneDeep(value)
这个方法类似_.clone，除了它会递归拷贝 value。（注：也叫深拷贝）。
- value (*): 要深拷贝的值。
```javascript
    var objects = [{ 'a': 1 }, { 'b': 2 }]
 
    var deep = _.cloneDeep(objects)
    console.log(deep[0] === objects[0])
    // => false
```

## _.uniq(array)
创建一个去重后的array数组副本。使用了SameValueZero 做等值比较。只有第一次出现的元素才会被保留。
- array (Array): 要检查的数组。
```javascript
    _.uniq([2, 1, 2])
    // => [2, 1]
```

## __.uniqBy(array, [iteratee=_.identity])
这个方法类似_.uniq ，除了它接受一个 iteratee （迭代函数），调用每一个数组（array）的每个元素以产生唯一性计算的标准。iteratee 调用时会传入一个参数：(value)。
- array (Array): 要检查的数组。
- [iteratee=_.identity] (Array|Function|Object|string): 迭代函数，调用每个元素。
```javascript
    _.uniqBy([2.1, 1.2, 2.3], Math.floor)
    // => [2.1, 1.2]
    
    // The `_.property` iteratee shorthand.
    _.uniqBy([{ 'x': 1 }, { 'x': 2 }, { 'x': 1 }], 'x')
    // => [{ 'x': 1 }, { 'x': 2 }]
```

## __.sortBy(collection, [iteratees=[_.identity]])
创建一个元素数组。 以 iteratee 处理的结果升序排序。 这个方法执行稳定排序，也就是说相同元素会保持原始排序。 iteratees 调用1个参数： (value)。
- collection (Array|Object): 用来迭代的集合。
- [iteratees=[_.identity]] (...(Array|Array[]|Function|Function[]|Object|Object[]|string|string[])): 这个函数决定排序。
```javascript
    var users = [
        { 'user': 'fred',   'age': 48 },
        { 'user': 'barney', 'age': 36 },
        { 'user': 'fred',   'age': 40 },
        { 'user': 'barney', 'age': 34 }
    ]
    
    _.sortBy(users, function(o) { return o.user })
    // => objects for [['barney', 36], ['barney', 34], ['fred', 48], ['fred', 40]]
    
    _.sortBy(users, ['user', 'age'])
    // => objects for [['barney', 34], ['barney', 36], ['fred', 40], ['fred', 48]]
    
    _.sortBy(users, 'user', function(o) {
        return Math.floor(o.age / 10)
    })
    // => objects for [['barney', 36], ['barney', 34], ['fred', 48], ['fred', 40]]
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
    ]
 
    // 以 `user` 升序排序 再  `age` 以降序排序。
    _.orderBy(users, ['user', 'age'], ['asc', 'desc'])
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
    jQuery(window).on('resize', _.debounce(calculateLayout, 150))
    
    // 当点击时 `sendMail` 随后就被调用。
    jQuery(element).on('click', _.debounce(sendMail, 300, {
    'leading': true,
    'trailing': false
    }))
    
    // 确保 `batchLog` 调用1次之后，1秒内会被触发。
    var debounced = _.debounce(batchLog, 250, { 'maxWait': 1000 })
    var source = new EventSource('/stream')
    jQuery(source).on('message', debounced)
    
    // 取消一个 trailing 的防抖动调用
    jQuery(window).on('popstate', debounced.cancel)
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
    jQuery(window).on('scroll', _.throttle(updatePosition, 100))
    
    // 点击后就调用 `renewToken`，但5分钟内超过1次。
    var throttled = _.throttle(renewToken, 300000, { 'trailing': false })
    jQuery(element).on('click', throttled)
    
    // 取消一个 trailing 的节流调用。
    jQuery(window).on('popstate', throttled.cancel)
```

## _.omit(object, [props])
这个方法一个对象，这个对象由忽略属性之外的object自身和继承的可枚举属性组成。（注：可以理解为删除object对象的属性）。
- object (Object): 来源对象。
- [props] (...(string|string[])): 要被忽略的属性。（注：单独指定或指定在数组中。）
```javascript
    var object = { 'a': 1, 'b': '2', 'c': 3 }
 
    _.omit(object, ['a', 'c'])
    // => { 'b': '2' }
```

## _.merge(object, [sources])
递归合并 sources 来源对象自身和继承的可枚举属性到 object 目标对象。如果目标值存在，被解析为undefined的sources 来源对象属性将被跳过。数组和普通对象会递归合并，其他对象和值会被直接分配覆盖。源对象从从左到右分配。后续的来源对象属性会覆盖之前分配的属性。
- object (Object): 目标对象。
- [sources] (...Object): 来源对象。
```javascript
    var object = {
        'a': [{ 'b': 2 }, { 'd': 4 }]
    }
    
    var other = {
        'a': [{ 'c': 3 }, { 'e': 5 }]
    }
    
    _.merge(object, other)
    // => { 'a': [{ 'b': 2, 'c': 3 }, { 'd': 4, 'e': 5 }] }
```

## _.isEqual(value, other)
执行深比较来确定两者的值是否相等。   
**注意: **这个方法支持比较 arrays, array buffers, booleans, date objects, error objects, maps, numbers, Object objects, regexes, sets, strings, symbols, 以及 typed arrays. Object 对象值比较自身的属性，不包括继承的和可枚举的属性。 不支持函数和DOM节点比较。
- value (*): 用来比较的值。
- other (*): 另一个用来比较的值。
```javascript
    var object = { 'a': 1 }
    var other = { 'a': 1 }
    
    _.isEqual(object, other)
    // => true
    
    object === other
    // => false
```

## _.chunk(array, [size=1])
将数组（array）拆分成多个 size 长度的区块，并将这些区块组成一个新数组。 如果array 无法被分割成全部等长的区块，那么最后剩余的元素将组成一个区块。
- array (Array): 需要处理的数组
- [size=1] (number): 每个数组区块的长度
```javascript
    _.chunk(['a', 'b', 'c', 'd'], 2)
    // => [['a', 'b'], ['c', 'd']]
    
    _.chunk(['a', 'b', 'c', 'd'], 3)
    // => [['a', 'b', 'c'], ['d']]
```