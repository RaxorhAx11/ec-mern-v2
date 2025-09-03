# Troubleshooting 404 NOT_FOUND Error on Vercel

## Error Description
```
404: NOT_FOUND Code: NOT_FOUND ID: bom1::kvsgt-1756617485585-e662d3940480
```

## Root Causes and Solutions

### 1. Incorrect Vercel Configuration

**Problem**: `vercel.json` is not properly configured for server deployment.

**Solution**: Ensure your `server/vercel.json` contains:
```json
{
  "version": 2,
  "builds": [
    {
      "src": "server.js",
      "use": "@vercel/node"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "server.js"
    }
  ],
  "env": {
    "NODE_ENV": "production"
  }
}
```

### 2. Wrong Root Directory

**Problem**: Vercel is looking in the wrong directory for your server files.

**Solution**: 
1. Go to your Vercel project dashboard
2. Navigate to Settings > General
3. Set **Root Directory** to `server`
4. Redeploy the project

### 3. Missing Dependencies

**Problem**: Required dependencies are not installed.

**Solution**:
1. Ensure `package.json` is in the server directory
2. Check that all dependencies are listed in `package.json`
3. Verify `node_modules` is not in `.gitignore` (Vercel will install dependencies)

### 4. Server Export Issues

**Problem**: Server is not properly exported for Vercel's serverless environment.

**Solution**: Ensure your `server.js` ends with:
```javascript
// For Vercel deployment, export the app instead of using app.listen()
if (process.env.NODE_ENV !== 'production') {
  app.listen(PORT, () => console.log(`Server is now running on port ${PORT}`));
}

module.exports = app;
```

### 5. Environment Variables Missing

**Problem**: Required environment variables are not set in Vercel.

**Solution**:
1. Go to Vercel project dashboard
2. Navigate to Settings > Environment Variables
3. Add all required variables:
   - `NODE_ENV=production`
   - `MONGODB_URL=your-mongodb-connection-string`
   - `CLIENT_BASE_URL=your-frontend-url`
   - `JWT_SECRET=your-secret`
   - Other required variables

## Step-by-Step Fix

### Step 1: Verify File Structure
```
server/
├── server.js              ✅ Must exist
├── package.json           ✅ Must exist
├── vercel.json           ✅ Must exist
├── routes/               ✅ Must exist
├── controllers/          ✅ Must exist
└── models/              ✅ Must exist
```

### Step 2: Check Vercel Configuration
1. Go to [vercel.com](https://vercel.com)
2. Select your project
3. Go to Settings > General
4. Verify Root Directory is set to `server`
5. Verify Framework Preset is set to `Node.js`

### Step 3: Redeploy
1. Push your changes to GitHub
2. Vercel will automatically redeploy
3. Check the deployment logs for errors

### Step 4: Test Endpoints
After successful deployment, test:
```bash
# Health check
curl https://your-app.vercel.app/api/health

# Should return:
# {"status":"OK","message":"Server is running","timestamp":"..."}
```

## Common Deployment Issues

### Issue 1: Build Fails
**Symptoms**: Build fails in Vercel logs
**Solution**: Check `package.json` for correct dependencies and scripts

### Issue 2: Runtime Errors
**Symptoms**: 500 errors after deployment
**Solution**: Check Vercel function logs for specific error messages

### Issue 3: CORS Errors
**Symptoms**: Frontend can't connect to backend
**Solution**: Update `CLIENT_BASE_URL` environment variable

### Issue 4: MongoDB Connection Fails
**Symptoms**: Database-related errors
**Solution**: 
1. Check MongoDB Atlas IP whitelist (add `0.0.0.0/0`)
2. Verify connection string format
3. Check environment variables

## Verification Checklist

- [ ] `vercel.json` is in the server directory
- [ ] `server.js` exports the app correctly
- [ ] `package.json` has all required dependencies
- [ ] Root directory is set to `server` in Vercel
- [ ] All environment variables are set
- [ ] MongoDB Atlas is accessible
- [ ] Health check endpoint responds
- [ ] No hardcoded localhost references

## Debugging Commands

### Local Testing
```bash
cd server
npm install
npm run test-server
curl http://localhost:5000/api/health
```

### Vercel CLI Testing
```bash
npm i -g vercel
cd server
vercel --prod
```

## Getting Help

If the issue persists:
1. Check Vercel function logs in the dashboard
2. Test endpoints individually
3. Verify all files are in the correct location
4. Check GitHub repository structure
5. Contact Vercel support if needed
