---
title: JDBC操作步骤
date: 2022-07-22
sidebar: auto
tags: 
 - Java
categories:
 - Java
---

基本步骤主要包括加载驱动、建立连接、创建语句对象、执行SQL语句以及处理结果。以下是详细的步骤说明：  
## 加载JDBC驱动
在尝试连接数据库之前，需要先加载相应的JDBC驱动程序。尽管在新版的JDBC中，这一步通常是可选的，因为驱动可以自动加载，但了解如何手动加载驱动是有帮助的。
Class.forName("com.mysql.cj.jdbc.Driver"); // 例如MySQL的驱动类名
## 建立数据库连接
使用DriverManager.getConnection()方法建立与数据库的连接。需提供数据库的URL、用户名和密码。
String url = "jdbc:mysql://localhost:3306/yourDatabaseName"; // 数据库的URL
String user = "yourUsername";
String password = "yourPassword";
Connection conn = DriverManager.getConnection(url, user, password);
## 创建Statement对象
连接成功后，可通过Connection对象创建一个Statement声明对象，用于发送SQL语句到数据库。
Statement stmt = conn.createStatement();
## 执行SQL语句
### 查询操作
对于查询操作，使用executeQuery()方法并接收返回的ResultSet对象。
ResultSet rs = stmt.executeQuery("SELECT * FROM yourTable");
### 更新操作
对于更新、插入或删除操作，用executeUpdate()方法。
int rowsAffected = stmt.executeUpdate("INSERT INTO yourTable VALUES(1, 'value')");
## 处理结果
### 查询操作
如果是查询操作，从ResultSet对象中读取数据。
while(rs.next()){
    // 根据列的数据类型选择合适的方法获取数据
    int id = rs.getInt("id");
    String value = rs.getString("columnName");
    // 处理数据...
}
## 关闭资源
操作完成后，应该按照相反的顺序关闭ResultSet、Statement和Connection对象，以释放资源。
rs.close();
stmt.close();
conn.close();
## 注意事项
实践推荐使用try-with-resources语句来自动管理资源，这样可以确保即使发生异常也能正确地关闭资源。
