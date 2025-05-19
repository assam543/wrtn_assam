@echo off
REM Gitのユーザー情報が設定されているか確認
git config user.name >nul 2>&1
IF ERRORLEVEL 1 (
    echo [ERROR] Git user configuration is missing.
    echo Please set it using the following commands:
    echo git config --global user.name "Your Name"
    echo git config --global user.email "you@example.com"
    exit /b 1
)

REM リポジトリのルートディレクトリへ移動
cd /d %~dp0

REM すべての変更をステージング
echo Staging all changes...
git add .

REM コミットメッセージの指定
set /p commit_message="Enter commit message: "
if "%commit_message%"=="" (
    set commit_message="Update files"
)

REM コミットの実行
echo Committing changes...
git commit -m "%commit_message%"

REM プッシュの実行
echo Pushing to remote repository...
git push origin main

REM 完了メッセージ
echo.
echo [INFO] Successfully pushed to the repository.
pause
exit
