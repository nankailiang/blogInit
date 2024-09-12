---
title: nvm常用命令
date: 2024-01-04
sidebar: auto
tags: 
 - nvm
categories:
 - 其他
---

nvm（Node Version Manager）是一个用于管理多个Node.js版本的工具，它允许用户在同一台机器上安装和切换不同版本的Node.js。以下是nvm的一些常用命令及其功能说明：

## 1. 安装与卸载
- 安装指定版本Node.js：**nvm install <version>**。例如，**nvm install 18.16.0**将安装Node.js的18.16.0版本。
- 安装最新版本的Node.js：**nvm install node**。
- 安装最新长期支持版本（LTS）：**nvm install --lts**。
- 卸载指定版本Node.js：**nvm uninstall <version>**。例如，**nvm uninstall 18.16.0**将卸载Node.js的18.16.0版本。

## 2. 切换版本
- 使用指定版本Node.js：**nvm use <version>**。例如，**nvm use 18.16.0**将切换到Node.js的18.16.0版本。
- 自动切换到长期支持版本：**nvm use --lts**。

## 3. 查看版本
- 查看已安装的Node.js版本：**nvm list**或**nvm ls**。这将列出所有已安装的Node.js版本。
- 查看可安装的Node.js版本：**nvm list available**或**nvm ls-remote**。这将列出所有可从网络下载的Node.js版本。
- 查看当前使用的Node.js版本：**nvm current**。
- 显示nvm版本：**nvm --version**或**nvm version**。
  
## 4. 别名管理
- 为指定版本设置别名：**nvm alias <name> <version>**。例如，**nvm alias default 18.16.0**将版本18.16.0设置为默认版本。
- 显示所有别名：**nvm alias**（不带参数）。
- 删除别名：**nvm unalias <name>**。

## 5. 其他命令
- 在特定版本下运行命令：**nvm exec <version> <command>**。例如，**nvm exec 18.16.0 node -v**将在18.16.0版本下运行node -v命令。
- 在特定版本下以新shell运行：**nvm run <version> <args>**。
- 重新全局安装指定版本的npm包：**nvm reinstall-packages <version>**。这在切换Node.js版本后重新安装全局npm包时很有用。
- 打开或关闭nvm自动切换：**nvm on**和**nvm off**。这些命令控制nvm是否自动切换Node.js版本。
- 查看或设置代理：**nvm proxy**。
- 设置和查看root路径：**nvm root [path]**。如果不带[path]参数，则仅显示当前nvm的root路径。
- 显示帮助信息：**nvm --help**或**nvm help**。