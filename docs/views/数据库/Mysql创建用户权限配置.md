---
title: Mysql创建用户权限配置
date: 2025-01-16
sidebar: auto
tags: 
 - Mysql
categories:
 - 数据库
---

## 1. 登录 MySQL 管理员账户
使用具有 CREATE USER 和 GRANT 权限的账户（如 root）登录： 
```sql
mysql -u root -p
```

## 2. 创建新用户
创建一个新用户（例如用户名为 readonly_user，密码为 your_password）：
```sql
CREATE USER 'readonly_user'@'%' IDENTIFIED BY 'your_password';
```
**% 表示允许从任何主机连接，若需限制访问来源，可改为具体 IP 或 localhost。**

## 3. 授予只读权限
授予用户对指定数据库（例如 your_database）的特定表（例如 your_table）的 SELECT 权限：
```sql
GRANT SELECT ON `your_database`.`your_table` TO 'readonly_user'@'%';
```
- 使用反引号 ` 包裹数据库名和表名（避免名称含特殊字符时出错）。
- 仅授予 SELECT 权限，确保用户无法执行 INSERT、UPDATE、DELETE 等操作。

## 4. 刷新权限
使新权限立即生效：
```sql
FLUSH PRIVILEGES;
```