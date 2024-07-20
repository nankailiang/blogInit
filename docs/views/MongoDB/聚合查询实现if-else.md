---
title: 聚合查询实现if-else
date: 2022-07-08
sidebar: auto
tags: 
 - MongoDB
categories:
 - MongoDB
---

在 MongoDB 中，可以使用聚合管道（Aggregation Pipeline）的 $cond 操作符来实现类似于 if-else 逻辑的条件处理。$cond 可以根据条件来选择不同的分支，并返回相应的结果。  
以下是一个简单的示例，展示了如何在 MongoDB 中使用 $cond 来模拟 if-else 逻辑：  
假设有一个 students 集合，包含了学生的成绩信息：
```javascript
db.students.insertMany([
  { name: "Alice", score: 85 },
  { name: "Bob", score: 70 },
  { name: "Charlie", score: 95 },
  // 更多文档...
])
```
现在，假设我们想根据学生成绩判断其表现，可以使用 $cond 操作符来实现：
```javascript
db.students.aggregate([
  {
    $project: {
      name: 1,
      score: 1,
      performance: {
        $cond: {
          if: { $gte: ["$score", 90] }, // 如果分数大于等于90
          then: "优秀",
          else: {
            $cond: {
              if: { $gte: ["$score", 80] }, // 如果分数大于等于80
              then: "良好",
              else: {
                $cond: {
                  if: { $gte: ["$score", 60] }, // 如果分数大于等于60
                  then: "及格",
                  else: "不及格"
                }
              }
            }
          }
        }
      }
    }
  }
])
```
在上面的示例中，使用了嵌套的 $cond 操作符来模拟多个条件判断。这段代码使用 $project 阶段创建了一个名为 performance 的新字段，根据学生成绩分数不同的范围给出不同的评价。