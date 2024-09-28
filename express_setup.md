## Setup node.js and Express

### Setup project
```bash
# Setup npm package 
npm init

# Then, follow the commands the terminal asks for setting up the package

# Create index.js
touch index.js

npm install express  # Express
npm install --save-dev nodemon  # Avoid manual server restarts
npm install morgan  # Logger
npm install cors  # CORS
npm install static  # Static files
npm install dotenv  # Environment variables. Don't forget to add ".env" to your .gitignore
```

### Modify "scripts" to shorten some commands:
```json
"scripts": {
   "start": "node index.js",
   "dev": "nodemon index.js",
   "test": "echo \"Error: no test specified\" && exit 1",
   "build:ui": "rm -rf dist && cd ../frontend && npm run build && cp -r dist ../backend",
   "deploy:full": "npm run build:ui && git add . && git commit -m uibuild && git push"
},
```

### Start server and push changes
```bash
# Start server:
npm run dev

# Build your frontend for production:
# npm run build:ui
#
# Or, both build and deploy.
# If configured with Render, it automatically deploys the changes.
npm run deploy:full
```
