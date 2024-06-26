@echo off

:: 先将远程仓库中的信息同步到本地仓库中
echo Syncing remote repository with local...
call git pull
if %errorlevel% neq 0 (
    echo Error: Failed to pull from remote repository.
    pause
    exit /b 1
)

:: 查看工作区代码相对于暂存区的差别
echo Checking status of working directory...
git status
if %errorlevel% neq 0 (
    echo Error: Failed to check status.
    pause
    exit /b 1
)

:: 将当前目录下修改的所有代码从工作区添加到暂存区
echo Adding changes to staging area...
git add .
if %errorlevel% neq 0 (
    echo Error: Failed to add changes to staging area.
    pause
    exit /b 1
)

:: 将缓存区内容添加到本地仓库
echo Committing changes to local repository...
git commit -m "add"
if %errorlevel% neq 0 (
    echo Error: Failed to commit changes.
    pause
    exit /b 1
)

:: 将本地版本库推送到远程服务器
echo Pushing changes to remote repository...
git push
if %errorlevel% neq 0 (
    echo Error: Failed to push changes to remote repository.
    pause
    exit /b 1
)

echo Upload successful. Press any key to close this window...
pause > nul
