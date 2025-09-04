#!/bin/bash

echo "🚀 Starting EC-MERN Server on Replit"
echo "====================================="

# Check if we're in the right directory
if [ ! -f "server/package.json" ]; then
    echo "❌ Error: server/package.json not found"
    echo "Please make sure you're in the project root directory"
    exit 1
fi

# Navigate to server directory
cd server

# Install dependencies if node_modules doesn't exist
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install
fi

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo "⚠️  Warning: .env file not found"
    echo "Make sure to set environment variables in Replit Secrets"
fi

# Start the server
echo "🎯 Starting server..."
npm start
