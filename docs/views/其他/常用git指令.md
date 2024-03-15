---
title: 常用git指令
date: 2022-01-04
sidebar: auto
tags: 
 - git
categories:
 - 其他
---

## 初始化和克隆仓库
- git init :用于在一个目录中创建一个新的Git仓库。
- git clone [url] :从远程仓库复制一份完整的项目到本地，同时自动创建一个指向远程仓库的追踪分支。

## 文件操作
- git add [file/folder] :将指定文件或目录下的所有修改添加到暂存区。
- git add . :将当前目录下所有文件的改动（包括新建、修改、删除）添加到暂存区。
- git status :显示工作目录中文件的状态，包括未追踪的文件、待暂存的改动以及与远程分支差异等。

## 提交与历史管理
- git commit -m "commit message" :将暂存区的改动以指定的提交消息提交到本地仓库。
- git commit --amend :强制覆盖提交（不建议常规使用）,主要用于修改上一次提交的内容或提交信息。
- git log :显示详细的提交历史记录。

## 分支操作
- git branch [branch-name] :创建新的本地分支。
- git checkout [branch-name] :切换到指定的分支。
- git merge [branch-name] :将指定分支的更改合并到当前所在分支。
  
## 远程交互
- git fetch [remote-name] :获取远程仓库的所有分支及提交，但不改变当前工作区或HEAD指针。
- git pull [remote-name] [branch-name] :将远程分支的最新提交下载到本地并尝试自动合并。
- git push [remote-name] [branch-name] :将本地分支的提交推送到远程仓库对应的分支。
