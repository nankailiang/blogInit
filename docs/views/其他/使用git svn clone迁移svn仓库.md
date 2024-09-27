---
title: 使用git svn clone迁移svn仓库
date: 2024-09-04
sidebar: auto
tags: 
 - git
categories:
 - 其他
---

clone命令可以指定很多参数，主要用到这些，你也可以使用git svn help查看完整的参数列表。
```git
$ git svn clone https://172.16.0.241:8443/svn/xxx/ -r 76896:HEAD --no-metadata --authors-file=svnuser.text --trunk=svnproject --branches=svnbranch yourGitProject
```
1. r指定起止版本号。
2. no-metadata阻止git导出SVN包含的一些无用信息。
3. authors-file必须指定svn帐号在git中的映射。
4. trunk指定导出仓库的主干项目路径。
5. branches指定svn的分支项目路径。
**注意**：clone命令需要管理员权限，否则会遇到下面的异常：
```git
couldn't truncate file .... at line 1393. 
```
你要做的就是右键使用管理员身份运行CMD，然后使用fatch继续执行导出。
```git
$ git svn fatch -r 76896:HEAD --authors-file=svnuser.text
```
当然这并不是唯一的坑，你还有可能会遇到下边的错误：
```git
 0 [main] perl 24432 cygwin_exception::open_stackdumpfile: Dumping stack trace to perl.exe.stackdump
 fatal: malformed index info 100644 362f1c18ceed5d593eb021432545685283a93 
```
要解决这个问题，请打开隐藏项目找到.git/config文件，文件大概长这个样子:
```git
[core]
	repositoryformatversion = 0
	filemode = false
	bare = false
	logallrefupdates = true
	symlinks = false
	ignorecase = true
	hideDotFiles = dotGitOnly
	longpaths = true
[svn-remote "svn"]
...
```
重要的就是longpaths = true这一句，然后fatch继续。
fetch之后通过git log你会发现看不到新的log，这是因为fetch之后并不会自动将代码合并到当前master,我们查看一下所有的分支
```git
$ git branch -a

* master
  remotes/origin/trunk
```
可以看到有一个远程分支，这个就是SVN产生的分支，查看一下log
```git
$ git log remotes/origin/trunk
```
LOG中显示了SVN最新的提交日志，我们需要手动合并到master上,然后查看日志包含了最新的提交。
```git
$ git merge remotes/origin/trunk
$ git log
```
到此迁移已经完成，接下来添加GIT远程地址，放心将代码push到GIT服务器吧。
