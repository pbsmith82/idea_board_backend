# Heroku Deployment Guide

## Backend Deployment

### Prerequisites
- Heroku CLI installed
- Git repository initialized

### Steps

1. **Login to Heroku**
   ```bash
   heroku login
   ```

2. **Create Heroku App**
   ```bash
   cd idea_board_backend
   heroku create your-app-name-backend
   ```

3. **Add PostgreSQL Addon**
   ```bash
   heroku addons:create heroku-postgresql:mini
   ```

4. **Set Environment Variables** (if needed)
   ```bash
   heroku config:set FRONTEND_URL=https://your-frontend-app.herokuapp.com
   ```

5. **Deploy**
   ```bash
   git add .
   git commit -m "Prepare for Heroku deployment"
   git push heroku master
   ```

6. **Run Migrations**
   ```bash
   heroku run rails db:migrate
   ```

7. **Seed Database** (optional)
   ```bash
   heroku run rails db:seed
   ```

8. **Get Backend URL**
   ```bash
   heroku info
   # Note the web URL (e.g., https://your-app-name-backend.herokuapp.com)
   ```

## Frontend Deployment

### Steps

1. **Create Heroku App**
   ```bash
   cd idea_board_frontend
   heroku create your-app-name-frontend
   ```

2. **Set Environment Variable for API URL**
   ```bash
   heroku config:set REACT_APP_API_URL=https://your-app-name-backend.herokuapp.com
   ```

3. **Deploy**
   ```bash
   git add .
   git commit -m "Prepare for Heroku deployment"
   git push heroku master
   ```

4. **Update Backend CORS** (if needed)
   ```bash
   cd ../idea_board_backend
   heroku config:set FRONTEND_URL=https://your-app-name-frontend.herokuapp.com
   ```

## Environment Variables

### Backend
- `DATABASE_URL` - Automatically set by Heroku PostgreSQL addon
- `FRONTEND_URL` - Your frontend Heroku URL (for CORS)
- `RAILS_ENV` - Set to `production` automatically

### Frontend
- `REACT_APP_API_URL` - Your backend Heroku URL (e.g., `https://your-backend.herokuapp.com`)

## Troubleshooting

- **Database Issues**: Run `heroku run rails db:migrate` if migrations fail
- **CORS Errors**: Ensure `FRONTEND_URL` is set correctly in backend
- **Build Failures**: Check Heroku logs with `heroku logs --tail`

