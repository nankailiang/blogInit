---
title: MongoDB加减乘除
date: 2023-09-05
sidebar: auto
tags: 
 - MongoDB
categories:
 - MongoDB
---

## 基本介绍和用法
1. $add - 用于添加数值。
2. $subtract - 用于从一个数值中减去另一个数值。
3. $multiply - 用于将数值相乘。
4. $divide - 用于将一个数值除以另一个数值。
## 示例数据
```javascript
{
    "_id": ObjectId("64e57890f1f4b45b5d880800"),
    "productName": "Widget",
    "price": 50,
    "quantity": 10,
    "discount": 10,  
    "shippingCost": 5
}
```
## 加法 ($add)
```javascript
db.inventory.aggregate([
    {
        $project: {
            totalShippingCost: {
                $add: [
                    "$shippingCost",
                    5
                ]
            }
        }
    }
])
```
## 减法 ($subtract)
```javascript
db.inventory.aggregate([
    {
        $project: {
            netIncome: {
                $subtract: [
                    { $multiply: ["$price", "$quantity"] },
                    { $multiply: ["$price", "$quantity", { $divide: ["$discount", 100] }] }
                ]
            }
        }
    }
])
```
## 乘法 ($multiply)
```javascript
db.inventory.aggregate([
    {
        $project: {
            totalPrice: {
                $multiply: [
                    "$price",
                    "$quantity"
                ]
            }
        }
    }
])
```
## 除法 ($divide)
```javascript
db.inventory.aggregate([
    {
        $project: {
            averageCost: {
                $divide: [
                    { $add: ["$price", "$shippingCost"] },
                    "$quantity"
                ]
            }
        }
    }
])
```