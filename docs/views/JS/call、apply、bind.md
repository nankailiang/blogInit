---
title: call、apply、bind
date: 2023-02-07
sidebar: auto
tags: 
 - JS
categories:
 - JS
---

## JavaScript 中的 `call()`, `apply()`, 和 `bind()`

### 相同点

- **改变`this`的指向**：这三个方法都能让你显式地指定函数执行时`this`的值，这对于函数借调（borrowing）或在特定上下文中执行是非常有用的。
- **属于Function.prototype**：它们都是`Function.prototype`上的方法，因此所有函数都可以访问并使用这些方法。

### 不同点

1. **参数传递方式**：
   - `call()` 接受第一个参数作为`this`的值，随后的参数直接按顺序传递给函数。
   - `apply()` 同样接受第一个参数作为`this`的值，但它要求第二个参数是一个数组或类数组对象，其中的每一项都将作为单独的参数传递给函数。
   - `bind()` 创建一个新的函数，当这个新函数被调用时，它的`this`值将被设置为`bind()`的第一个参数，之后的参数将作为原函数的参数预先绑定。

2. **立即执行与延迟执行**：
   - `call()` 和 `apply()` 会立即执行函数。
   - `bind()` 返回一个新的函数，这个函数会在将来某个时刻被调用时才执行。

3. **返回值**：
   - `call()` 和 `apply()` 返回函数的执行结果。
   - `bind()` 返回一个新的函数。

### 示例

```javascript
// 假设有一个对象`obj`和一个函数`func`
const obj = {
  value: 10,
  logValue: function() {
    console.log(this.value)
  }
}

function func(x, y) {
  console.log(this.value + x + y)
}

// 使用 call()
obj.logValue.call({value: 20}) // 输出 20

// 使用 apply()
func.apply(null, [1, 2]) // 输出 13

// 使用 bind()
const boundFunc = func.bind({value: 100})
boundFunc(1, 2) // 输出 103
```