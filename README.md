# EC-MERN E-commerce Application

A full-stack MERN (MongoDB, Express.js, React, Node.js) e-commerce application with admin panel, user authentication, shopping cart, and payment integration.

## Features

- 🛍️ **E-commerce Platform**: Product catalog, shopping cart, checkout
- 👤 **User Authentication**: Register, login, logout with JWT
- 🛒 **Shopping Cart**: Add/remove items, quantity management
- 💳 **Payment Integration**: PayPal payment processing
- 📱 **Admin Panel**: Product management, order tracking
- 🔍 **Search & Filter**: Advanced product search and filtering
- 📍 **Address Management**: Multiple shipping addresses
- ⭐ **Reviews & Ratings**: Product reviews and star ratings
- 🖼️ **Image Upload**: Cloudinary integration for product images

## Tech Stack

### Frontend
- React 18 with Vite
- Redux Toolkit for state management
- React Router for navigation
- Tailwind CSS for styling
- Radix UI components
- Axios for API calls

### Backend
- Node.js with Express
- MongoDB with Mongoose
- JWT for authentication
- Cookie-parser for session management
- CORS for cross-origin requests
- Multer for file uploads
- PayPal SDK for payments
- Cloudinary for image storage

## Prerequisites

- Node.js (v16 or higher)
- MongoDB (local or MongoDB Atlas)
- npm or yarn package manager

## Local Development Setup

### 1. Clone the Repository
```bash
git clone <repository-url>
cd ec-MERN
```

### 2. Server Setup
```bash
cd server

# Install dependencies
npm install

# Copy environment template
cp env.example .env

# Edit .env file with your configuration
# - Set MONGODB_URL (local or Atlas)
# - Set JWT_SECRET
# - Set Cloudinary credentials
# - Set PayPal credentials
# - Set CLIENT_BASE_URL=http://localhost:5173

# Start development server
npm run dev
```

### 3. Client Setup
```bash
cd client

# Install dependencies
npm install

# Copy environment template
cp env.example .env

# Edit .env file with your configuration
# - Set VITE_MAIN_BACKEND_URL=http://localhost:5000
# - Set VITE_BACKEND_URL=http://localhost:5000
# - Set VITE_BACKEND_AUTH_URL=http://localhost:5000/api/auth

# Start development server
npm run dev
```

### 4. Database Setup
- Install MongoDB locally or create a MongoDB Atlas cluster
- Update the `MONGODB_URL` in your server `.env` file
- The application will automatically create collections on first run

## Environment Variables

### Server (.env)
```env
PORT=5000
NODE_ENV=development
MONGODB_URL=mongodb://localhost:27017/ec-mern
CLIENT_BASE_URL=http://localhost:5173
JWT_SECRET=your-secret-key
CLOUDINARY_CLOUD_NAME=your-cloud-name
CLOUDINARY_API_KEY=your-api-key
CLOUDINARY_API_SECRET=your-api-secret
PAYPAL_CLIENT_ID=your-paypal-client-id
PAYPAL_CLIENT_SECRET=your-paypal-client-secret
```

### Client (.env)
```env
VITE_MAIN_BACKEND_URL=http://localhost:5000
VITE_BACKEND_URL=http://localhost:5000
VITE_BACKEND_AUTH_URL=http://localhost:5000/api/auth
```

## Replit Deployment

### 1. Import to Replit
1. Go to [replit.com](https://replit.com)
2. Click "Create Repl"
3. Select "Import from GitHub"
4. Enter your repository URL
5. Click "Import from GitHub"

### 2. Configure Environment Variables
1. In your Repl, click the "Secrets" tab (🔒 icon)
2. Add all required environment variables:
   - Copy from `server/env.production.example`
   - Update with your production values
   - Set `CLIENT_BASE_URL` to your Repl URL

### 3. Start the Server
1. Click the "Run" button in Replit
2. Wait for dependencies to install
3. Check console for successful startup

### 4. Environment Variables for Production

#### Backend (Replit Secrets)
```env
NODE_ENV=production
PORT=5000
MONGODB_URL=mongodb+srv://username:password@cluster.mongodb.net/ec-mern
CLIENT_BASE_URL=https://your-repl-url.replit.app
JWT_SECRET=your-production-secret
CLOUDINARY_CLOUD_NAME=your-cloud-name
CLOUDINARY_API_KEY=your-api-key
CLOUDINARY_API_SECRET=your-api-secret
PAYPAL_CLIENT_ID=your-paypal-client-id
PAYPAL_CLIENT_SECRET=your-paypal-client-secret
```

### 5. Frontend Deployment (Optional)
For frontend deployment, you can:
1. Deploy to Vercel, Netlify, or GitHub Pages
2. Update environment variables to point to your Replit backend
3. Or serve the frontend from the same Replit instance

## API Endpoints

### Authentication
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `POST /api/auth/logout` - User logout
- `GET /api/auth/check-auth` - Check authentication status

### Products
- `GET /api/shop/products/get` - Get all products with filters
- `GET /api/shop/products/get/:id` - Get product details
- `POST /api/admin/products/add` - Add new product (admin)
- `PUT /api/admin/products/update/:id` - Update product (admin)
- `DELETE /api/admin/products/delete/:id` - Delete product (admin)

### Cart
- `GET /api/shop/cart/get` - Get user cart
- `POST /api/shop/cart/add` - Add item to cart
- `PUT /api/shop/cart/update` - Update cart item
- `DELETE /api/shop/cart/delete/:id` - Remove item from cart

### Orders
- `GET /api/shop/order/get` - Get user orders
- `POST /api/shop/order/add` - Create new order
- `GET /api/admin/orders/get` - Get all orders (admin)

### Health Check
- `GET /api/health` - Server health status

## Project Structure

```
ec-MERN/
├── client/                 # React frontend
│   ├── src/
│   │   ├── components/     # Reusable components
│   │   ├── pages/         # Page components
│   │   ├── store/         # Redux store and slices
│   │   └── config/        # Configuration files
│   └── public/            # Static assets
├── server/                # Node.js backend
│   ├── controllers/       # Route controllers
│   ├── models/           # MongoDB models
│   ├── routes/           # API routes
│   ├── helpers/          # Utility functions
│   └── server.js         # Main server file
└── README.md
```

## Troubleshooting

### Common Issues

1. **CORS Errors**: Ensure `CLIENT_BASE_URL` is correctly set in server `.env`
2. **MongoDB Connection**: Check if MongoDB is running and connection string is correct
3. **Environment Variables**: Make sure all required environment variables are set
4. **Port Conflicts**: Change ports in `.env` files if needed

### Development Commands

```bash
# Server
cd server
npm run dev    # Start development server
npm start      # Start production server

# Client
cd client
npm run dev    # Start development server
npm run build  # Build for production
npm run preview # Preview production build
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the ISC License.

