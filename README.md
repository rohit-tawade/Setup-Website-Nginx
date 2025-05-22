# Setup-Website-Nginx

This repository contains the source code and configuration files for a website deployed using the Nginx web server.

## Project Structure

- **assets/** — Static assets such as PDFs, favicon, and other resources.
- **deploy/** — Deployment scripts to help automate installation and setup.
- **images/** — Website images used in the project.
- **scripts/** — JavaScript files for website interactivity.
- **styles/** — CSS files for styling the website.
- **index.html** — Main HTML page of the website.
- **nginx.conf** — Nginx configuration file for serving the website.

## Deployment Instructions

1. **Clone this repository to your server or local machine:**

   ```bash
   git clone https://github.com/rohit-tawade/Setup-Website-Nginx.git
   cd Setup-Website-Nginx
   ```

2. **Run the deployment/install script to set up the website:**

   ```bash
   sudo bash deploy/install.sh
   ```

   > This script will copy all necessary files to the Nginx web root (usually `/usr/share/nginx/html/`) and configure Nginx as needed.

3. **Restart the Nginx service to apply changes:**

   ```bash
   sudo systemctl restart nginx
   ```

## Notes

* The repository uses a `.gitignore` file to exclude environment-specific or sensitive files.
* The default branch is `main`.
* Make sure you have sufficient permissions to execute the installation and restart services.

## Author

**Rohit Tawade**  
GitHub: [rohit-tawade](https://github.com/rohit-tawade)

