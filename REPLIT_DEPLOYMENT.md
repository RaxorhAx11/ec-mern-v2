# 🚀 Replit Deployment Guide for EC-MERN

## 📋 Prerequisites

- Replit account
- MongoDB Atlas cluster (for production database)
- GitHub repository with your code

## 🛠️ Deployment Steps

### Step 1: Import Project to Replit

1. **Go to [replit.com](https://replit.com)**
2. **Click "Create Repl"**
3. **Select "Import from GitHub"**
4. **Enter your repository URL**
5. **Click "Import from GitHub"**

### Step 2: Configure Environment Variables

1. **In your Repl, click the "Secrets" tab (🔒 icon)**
2. **Add the following environment variables:**

```env
# Server Configuration
NODE_ENV=production
PORT=5000

# MongoDB Configuration
MONGODB_URL=mongodb+srv://username:password@cluster.mongodb.net/ec-mern?retryWrites=true&w=majority

# Client URLs (for CORS)
CLIENT_BASE_URL=https://your-repl-url.replit.app

# JWT Configuration
JWT_SECRET=your-super-secret-jwt-key-for-production

# Cloudinary Configuration
CLOUDINARY_CLOUD_NAME=your-cloud-name
CLOUDINARY_API_KEY=your-api-key
CLOUDINARY_API_SECRET=your-api-secret

# PayPal Configuration
PAYPAL_CLIENT_ID=your-paypal-client-id
PAYPAL_CLIENT_SECRET=your-paypal-client-secret
```

### Step 3: Configure MongoDB Atlas

1. **Go to [MongoDB Atlas](https://cloud.mongodb.com)**
2. **Create a new cluster or use existing**
3. **Add IP Whitelist:**
   - Add `0.0.0.0/0` (allow all IPs)
   - Or add Replit's IP ranges
4. **Create Database User:**
   - Username: `your-username`
   - Password: `your-password`
5. **Get Connection String:**
   - Click "Connect" → "Connect your application"
   - Copy the connection string
   - Replace `<password>` with your actual password

### Step 4: Start the Server

1. **Click the "Run" button** in Replit
2. **Wait for dependencies to install**
3. **Check the console for:**
   ```
   Server is now running on port 5000
   Health check available at: http://localhost:5000/api/health
   MongoDB ATLAS connected
   ```

### Step 5: Test Your Deployment

1. **Check the Repl URL** (usually `https://your-repl-name.your-username.replit.app`)
2. **Test endpoints:**
   ```bash
   # Health check
   curl https://your-repl-url.replit.app/api/health
   
   # Should return:
   # {"status":"OK","message":"Server is running","timestamp":"..."}
   ```

## 🔧 Configuration Files

### `.replit` Configuration
```toml
modules = ["nodejs-18"]

[deployment]
run = ["sh", "-c", "cd server && npm install && npm start"]
healthcheckPath = "/api/health"
healthcheckTimeout = 10
restartPolicy = "on-failure"

[env]
PATH = "${PATH}:${PWD}/server/node_modules/.bin"

[ports]
0.0.0.0 = { external = true, protocol = "http" }

[[ports]]
localPort = 5000
externalPort = 80
```

### `replit.nix` Configuration
```nix
{ pkgs }: {
  deps = [
    pkgs.nodejs-18_x
    pkgs.nodePackages.npm
    pkgs.nodePackages.nodemon
  ];
}
```

## 🚨 Common Issues and Solutions

### Issue 1: Server Not Starting
**Symptoms:** Server fails to start or crashes
**Solutions:**
- Check environment variables are set correctly
- Verify MongoDB connection string
- Check console logs for specific errors

### Issue 2: MongoDB Connection Failed
**Symptoms:** "MongoDB connection failed" in logs
**Solutions:**
- Verify MongoDB Atlas IP whitelist includes `0.0.0.0/0`
- Check connection string format
- Verify database user credentials

### Issue 3: CORS Errors
**Symptoms:** Frontend can't connect to backend
**Solutions:**
- Update `CLIENT_BASE_URL` to your Repl URL
- Check CORS configuration in server.js

### Issue 4: Environment Variables Not Loading
**Symptoms:** Variables return undefined
**Solutions:**
- Ensure variables are set in Replit Secrets
- Check variable names match exactly
- Restart the Repl after adding variables

## 📊 Monitoring and Maintenance

### Health Monitoring
- **Health Check:** `https://your-repl-url.replit.app/api/health`
- **Status:** Should return 200 OK with server status

### Logs
- **Console Logs:** Available in Replit console
- **Error Tracking:** Check console for error messages
- **Performance:** Monitor response times

### Database Monitoring
- **MongoDB Atlas Dashboard:** Monitor connection status
- **Connection Pool:** Check for connection limits
- **Query Performance:** Monitor slow queries

## 🔄 Updating Your Deployment

### Code Updates
1. **Push changes to GitHub**
2. **In Replit, click "Sync"** to pull latest changes
3. **Restart the Repl** if needed

### Environment Variable Updates
1. **Update variables in Replit Secrets**
2. **Restart the Repl** to apply changes

### Database Updates
1. **Update MongoDB connection string if needed**
2. **Update environment variables**
3. **Restart the Repl**

## 🎯 Production Checklist

- [ ] MongoDB Atlas cluster configured
- [ ] Environment variables set in Replit Secrets
- [ ] CORS origins updated for production
- [ ] JWT secret changed for production
- [ ] All API endpoints tested
- [ ] Health check endpoint responding
- [ ] Error handling working
- [ ] Database connection stable

## 🆘 Troubleshooting

### Debug Commands
```bash
# Check if server is running
curl https://your-repl-url.replit.app/api/health

# Check environment variables
echo $MONGODB_URL
echo $JWT_SECRET

# Check server logs
# (Available in Replit console)
```

### Getting Help
- **Replit Documentation:** [docs.replit.com](https://docs.replit.com)
- **Replit Community:** [replit.com/talk](https://replit.com/talk)
- **MongoDB Atlas Support:** [support.mongodb.com](https://support.mongodb.com)

## 🎉 Success Indicators

Your deployment is successful when:
- ✅ Server starts without errors
- ✅ Health check returns 200 OK
- ✅ MongoDB connects successfully
- ✅ All API endpoints respond correctly
- ✅ CORS allows frontend connections
- ✅ Environment variables load properly

---

**Note:** Replit provides a free tier with some limitations. For production use, consider upgrading to a paid plan for better performance and reliability.
