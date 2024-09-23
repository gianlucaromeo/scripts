npm init

# Then follow commands they ask

# Then modify "scripts" and add "start":
"scripts": {
    "start": "node index.js",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  
 # Then create an "index.js" file
 node index.js  # Execute index.js // or "npm start"
 
 # Install Express
 npm install express
 
 # To avoid restarting the server manually:
 npm install --save-dev nodemon
 node_modules/.bin/nodemon index.js
 
 # Add to scripts: "dev": "nodemon index.js",
 
 # morgan: middleware for http request logger
 npm install morgan
 
 # Then in our code: var morgan = require('morgan')
 
 npm install cors
 
 npm install static
 
 
 npm run build  # Build production front-end VITE
 
 cp -r dist ../backend  # copy dist generated folder from FE into BE
