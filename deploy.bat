@echo off
:: 生成静态文件
call npm run docs:build || exit /b 1

:: 进入生成的文件夹
cd docs\.vuepress\dist || exit /b 1

:: 如果是发布到自定义域名
:: echo 'www.example.com' > CNAME

:: 初始化 git 仓库
git init || exit /b 1
git add . || exit /b 1
git commit -m "deploy" || exit /b 1

:: 如果发布到 https://<USERNAME>.github.io
git push -f git@github.com:nankailiang/nankailiang.github.io.git master || exit /b 1

:: 如果发布到 https://<USERNAME>.github.io/<REPO>
:: git push -f git@github.com:<USERNAME>/<REPO>.git master || exit /b 1

:: 返回原始目录
cd .. || exit /b 1

echo Deployment successful. Press any key to close this window...
pause > nul
