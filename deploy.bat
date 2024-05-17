@echo off

:: 生成静态文件
echo Building static files...
call npm run docs:build
if %errorlevel% neq 0 (
    echo Error: Failed to generate static files.
    pause
    exit /b 1
)

:: 进入生成的文件夹
echo Entering generated directory...
cd docs\.vuepress\dist
if %errorlevel% neq 0 (
    echo Error: Failed to enter generated directory.
    pause
    exit /b 1
)

:: 如果是发布到自定义域名
:: echo 'www.example.com' > CNAME

:: 初始化 git 仓库
echo Initializing git repository...
git init
if %errorlevel% neq 0 (
    echo Error: Failed to initialize git repository.
    pause
    exit /b 1
)
git add .
if %errorlevel% neq 0 (
    echo Error: Failed to add files to git repository.
    pause
    exit /b 1
)
git commit -m "deploy"
if %errorlevel% neq 0 (
    echo Error: Failed to commit changes.
    pause
    exit /b 1
)

:: 如果发布到 https://<USERNAME>.github.io
echo Pushing changes to GitHub Pages...
git push -f git@github.com:nankailiang/nankailiang.github.io.git master
if %errorlevel% neq 0 (
    echo Error: Failed to push changes to GitHub Pages repository.
    pause
    exit /b 1
)

:: 如果发布到 https://<USERNAME>.github.io/<REPO>
:: git push -f git@github.com:<USERNAME>/<REPO>.git master

:: 返回原始目录
cd ..
if %errorlevel% neq 0 (
    echo Error: Failed to return to original directory.
    pause
    exit /b 1
)

echo Deployment successful. Press any key to close this window...
pause > nul
