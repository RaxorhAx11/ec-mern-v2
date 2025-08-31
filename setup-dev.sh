#!/bin/bash

echo "🚀 Setting up EC-MERN Development Environment"
echo "=============================================="

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js v16 or higher."
    exit 1
fi

echo "✅ Node.js version: $(node --version)"

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm."
    exit 1
fi

echo "✅ npm version: $(npm --version)"

# Server setup
echo ""
echo "📦 Setting up Server..."
cd server

# Install dependencies
echo "Installing server dependencies..."
npm install

# Create .env file if it doesn't exist
if [ ! -f .env ]; then
    echo "Creating server .env file..."
    cp env.example .env
    echo "⚠️  Please edit server/.env with your configuration"
else
    echo "✅ Server .env file already exists"
fi

cd ..

# Client setup
echo ""
echo "📦 Setting up Client..."
cd client

# Install dependencies
echo "Installing client dependencies..."
npm install

# Create .env file if it doesn't exist
if [ ! -f .env ]; then
    echo "Creating client .env file..."
    cp env.example .env
    echo "⚠️  Please edit client/.env with your configuration"
else
    echo "✅ Client .env file already exists"
fi

cd ..

echo ""
echo "🎉 Setup Complete!"
echo ""
echo "Next steps:"
echo "1. Edit server/.env with your MongoDB URL and other credentials"
echo "2. Edit client/.env with your backend URL"
echo "3. Start the server: cd server && npm run dev"
echo "4. Start the client: cd client && npm run dev"
echo ""
echo "📚 For detailed instructions, see README.md"

