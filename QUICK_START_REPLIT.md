# ⚡ Quick Start Guide for Replit Deployment

## 🚀 5-Minute Setup

### Step 1: Import to Replit
1. Go to [replit.com](https://replit.com)
2. Click **"Create Repl"**
3. Select **"Import from GitHub"**
4. Paste your repository URL
5. Click **"Import from GitHub"**

### Step 2: Set Environment Variables
1. Click the **🔒 Secrets** tab in your Repl
2. Add these variables (replace with your values):

```
NODE_ENV=production
PORT=5000
MONGODB_URL=mongodb+srv://username:password@cluster.mongodb.net/ec-mern
CLIENT_BASE_URL=https://your-repl-name.your-username.replit.app
JWT_SECRET=your-secret-key-here
CLOUDINARY_CLOUD_NAME=your-cloud-name
CLOUDINARY_API_KEY=your-api-key
CLOUDINARY_API_SECRET=your-api-secret
PAYPAL_CLIENT_ID=your-paypal-client-id
PAYPAL_CLIENT_SECRET=your-paypal-client-secret
```

### Step 3: Run the Server
1. Click the **▶️ Run** button
2. Wait for installation to complete
3. Check console for: `Server is now running on port 5000`

### Step 4: Test Your API
Visit: `https://your-repl-name.your-username.replit.app/api/health`

Should return:
```json
{
  "status": "OK",
  "message": "Server is running",
  "timestamp": "..."
}
```

## 🔧 MongoDB Atlas Setup

### Quick MongoDB Setup:
1. Go to [MongoDB Atlas](https://cloud.mongodb.com)
2. Create a free cluster
3. Create a database user
4. Add IP whitelist: `0.0.0.0/0` (allow all)
5. Get connection string and update `MONGODB_URL`

## 🎯 Success Checklist

- [ ] Repl imported successfully
- [ ] Environment variables set in Secrets
- [ ] Server starts without errors
- [ ] Health check returns 200 OK
- [ ] MongoDB connects successfully

## 🆘 Common Issues

### Server won't start?
- Check environment variables in Secrets
- Verify MongoDB connection string
- Check console logs for errors

### 404 errors?
- Make sure you're using the correct Repl URL
- Check that the server is actually running

### CORS errors?
- Update `CLIENT_BASE_URL` to your Repl URL
- Check CORS configuration

## 📞 Need Help?

- **Full Guide:** See `REPLIT_DEPLOYMENT.md`
- **Replit Docs:** [docs.replit.com](https://docs.replit.com)
- **MongoDB Atlas:** [cloud.mongodb.com](https://cloud.mongodb.com)

---

**That's it! Your server should be running on Replit in under 5 minutes! 🎉**
