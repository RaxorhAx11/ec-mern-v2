# Vercel Server Deployment Guide

## Prerequisites
- Vercel account
- MongoDB Atlas cluster (for production database)
- Environment variables configured

## Deployment Steps

### 1. Prepare Your Repository
Make sure your server folder contains:
- `server.js` (main server file)
- `package.json` (with all dependencies)
- `vercel.json` (Vercel configuration)
- All route files and controllers

### 2. Deploy to Vercel

#### Option A: Using Vercel CLI
```bash
# Install Vercel CLI
npm i -g vercel

# Navigate to server directory
cd server

# Deploy
vercel

# Follow the prompts:
# - Set up and deploy: Yes
# - Which scope: Select your account
# - Link to existing project: No
# - Project name: ec-mern-server (or your preferred name)
# - Directory: ./ (current directory)
```

#### Option B: Using Vercel Dashboard
1. Go to [vercel.com](https://vercel.com)
2. Click "New Project"
3. Import your GitHub repository
4. Set the **Root Directory** to `server`
5. Set the **Framework Preset** to `Node.js`
6. Click "Deploy"

### 3. Configure Environment Variables

In your Vercel project dashboard, go to Settings > Environment Variables and add:

```env
NODE_ENV=production
PORT=3000
MONGODB_URL=mongodb+srv://username:password@cluster.mongodb.net/ec-mern
CLIENT_BASE_URL=https://your-frontend-app.vercel.app
JWT_SECRET=your-production-secret-key
CLOUDINARY_CLOUD_NAME=your-cloud-name
CLOUDINARY_API_KEY=your-api-key
CLOUDINARY_API_SECRET=your-api-secret
PAYPAL_CLIENT_ID=your-paypal-client-id
PAYPAL_CLIENT_SECRET=your-paypal-client-secret
```

### 4. Test Your Deployment

After deployment, test your endpoints:

```bash
# Health check
curl https://your-app.vercel.app/api/health

# Test other endpoints
curl https://your-app.vercel.app/api/auth/check-auth
```

## Common Issues and Solutions

### 1. 404 NOT_FOUND Error
- **Cause**: Incorrect Vercel configuration
- **Solution**: Ensure `vercel.json` is in the server directory and properly configured

### 2. MongoDB Connection Issues
- **Cause**: IP whitelist or connection string issues
- **Solution**: 
  - Add `0.0.0.0/0` to MongoDB Atlas IP whitelist
  - Verify connection string format
  - Check environment variables

### 3. CORS Errors
- **Cause**: Frontend URL not in allowed origins
- **Solution**: Update `CLIENT_BASE_URL` environment variable

### 4. Environment Variables Not Loading
- **Cause**: Variables not set in Vercel dashboard
- **Solution**: Add all required variables in Vercel project settings

## File Structure for Deployment

```
server/
├── server.js              # Main server file
├── package.json           # Dependencies
├── vercel.json           # Vercel configuration
├── .env                  # Local environment (not deployed)
├── env.example           # Environment template
├── routes/               # API routes
├── controllers/          # Route controllers
├── models/              # MongoDB models
└── helpers/             # Utility functions
```

## Production Checklist

- [ ] MongoDB Atlas cluster configured
- [ ] Environment variables set in Vercel
- [ ] CORS origins updated for production
- [ ] JWT secret changed for production
- [ ] All API endpoints tested
- [ ] Error handling working
- [ ] Health check endpoint responding

## Monitoring

After deployment, monitor:
- Vercel function logs
- MongoDB connection status
- API response times
- Error rates

## Troubleshooting

If you encounter issues:

1. Check Vercel function logs in the dashboard
2. Verify environment variables are set correctly
3. Test endpoints individually
4. Check MongoDB Atlas connection
5. Review server.js for any hardcoded localhost references
