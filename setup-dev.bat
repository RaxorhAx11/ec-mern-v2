@echo off
echo 🚀 Setting up EC-MERN Development Environment
echo ==============================================

REM Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed. Please install Node.js v16 or higher.
    pause
    exit /b 1
)

echo ✅ Node.js version: 
node --version

REM Check if npm is installed
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ npm is not installed. Please install npm.
    pause
    exit /b 1
)

echo ✅ npm version: 
npm --version

REM Server setup
echo.
echo 📦 Setting up Server...
cd server

REM Install dependencies
echo Installing server dependencies...
call npm install

REM Create .env file if it doesn't exist
if not exist .env (
    echo Creating server .env file...
    copy env.example .env
    echo ⚠️  Please edit server/.env with your configuration
) else (
    echo ✅ Server .env file already exists
)

cd ..

REM Client setup
echo.
echo 📦 Setting up Client...
cd client

REM Install dependencies
echo Installing client dependencies...
call npm install

REM Create .env file if it doesn't exist
if not exist .env (
    echo Creating client .env file...
    copy env.example .env
    echo ⚠️  Please edit client/.env with your configuration
) else (
    echo ✅ Client .env file already exists
)

cd ..

echo.
echo 🎉 Setup Complete!
echo.
echo Next steps:
echo 1. Edit server/.env with your MongoDB URL and other credentials
echo 2. Edit client/.env with your backend URL
echo 3. Start the server: cd server ^&^& npm run dev
echo 4. Start the client: cd client ^&^& npm run dev
echo.
echo 📚 For detailed instructions, see README.md
pause

