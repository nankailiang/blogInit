---
title: vue2生命周期函数
date: 2022-12-06
sidebar: auto
tags: 
 - JS
 - Vue
categories:
 - JS
---

## Vue2生命周期函数

Vue2提供了一系列的生命周期钩子函数，用于在不同的实例阶段执行特定的逻辑。包括初始化、渲染、更新和销毁等过程。

### 主要的生命周期函数

1. **beforeCreate**
   - 在实例初始化之后被调用。此时，`data`、`props`、`computed`、`methods` 等尚未初始化。

2. **created**
   - 实例创建完成后被调用。此时，实例已经完成了数据观测、属性和方法的注入以及事件/监听器的初始化，但 `$el` 尚未挂载。

3. **beforeMount**
   - 在挂载开始之前被调用，相关 render 函数首次被调用。

4. **mounted**
   - 实例的 `$el` 挂载到 DOM 上后被调用。如果根实例挂载的是文档内的元素，当 `mounted` 被调用时，`vm.$el` 也位于文档内。

5. **beforeUpdate**
   - 数据更新前被调用，发生在虚拟 DOM 打补丁之前。在此阶段可以访问现有的 DOM。

6. **updated**
   - 组件的 DOM 更新后被调用。当这个钩子被调用时，组件的 DOM 保证是更新后的状态。

7. **activated**
   - 当 `<keep-alive>` 包含的组件被激活时调用。

8. **deactivated**
   - 当 `<keep-alive>` 包含的组件被停用时调用。

9. **beforeDestroy**
   - 实例销毁之前调用。此时，实例仍然完全可用。

10. **destroyed**
    - Vue 实例销毁后调用。所有绑定的事件监听器被移除，所有子实例也被销毁。

11. **errorCaptured**
    - 当捕获来自子孙组件的错误时被调用。这个钩子会接收到错误对象、发生错误的组件实例以及错误来源信息。

这些钩子函数按照特定的顺序执行，允许在特定的生命周期点执行自定义逻辑，对调试和优化应用至关重要。   
**注意，`activated` 和 `deactivated` 钩子仅在使用 `<keep-alive>` 组件时可用。**