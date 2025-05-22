#!/bin/bash

# install.sh
# Author: Rohit Santram Tawade
# Description: Deploy portfolio project to Nginx with updated config

set -e  # Exit on any error

# Variables
REPO_URL="https://github.com/rohit-tawade/portfolio-rohit.git"
CLONE_DIR="/usr/share/nginx/html"   # Clone directly into html dir
PROJECT_FOLDER="portfolio-rohit"
FULL_PATH="$CLONE_DIR/$PROJECT_FOLDER"
NGINX_CONF_SRC="$FULL_PATH/nginx/nginx.conf"
NGINX_CONF_DEST="/etc/nginx/nginx.conf"

echo "=============================="
echo "🚀 Starting Deployment Script"
echo "=============================="

# Step 1: Remove existing folder if exists
echo "🧹 Removing old project directory if it exists..."
sudo rm -rf "$FULL_PATH"

# Step 2: Clone the GitHub repository
echo "🔄 Cloning repository into $CLONE_DIR..."
cd "$CLONE_DIR"
sudo git clone "$REPO_URL"

# Step 3: Backup existing Nginx config
if [ -f "$NGINX_CONF_DEST" ]; then
    echo "🔐 Backing up existing Nginx config..."
    sudo cp "$NGINX_CONF_DEST" "${NGINX_CONF_DEST}.bck"
fi

# Step 4: Copy new Nginx config
echo "📄 Copying new Nginx config from repo..."
sudo cp "$NGINX_CONF_SRC" "$NGINX_CONF_DEST"

# Step 5: Test new Nginx config
echo "🧪 Testing Nginx configuration..."
sudo nginx -t

# Step 6: Reload Nginx service
echo "🔁 Reloading Nginx..."
sudo systemctl reload nginx

echo "✅ Deployment complete!"
echo "➡️ Project location: $FULL_PATH"
echo "⚙️ Nginx config: $NGINX_CONF_DEST"

