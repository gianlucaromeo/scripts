## Setup node.js and Express
Configuration for setting up a backend for the [Full Stack Open](https://fullstackopen.com/en/) course.

### Setup project
```bash
# Setup npm package 
npm init

# Then, follow the commands the terminal asks for setting up the package

# Create index.js
touch index.js

npm install express  # Express
npm install morgan  # Logger
npm install cors  # CORS
npm install static  # Static files
npm install dotenv  # Environment variables. Don't forget to add ".env" to your .gitignore
npm install mongoose  # Application data modeling

npm install --save-dev nodemon  # Avoid manual server restarts
npm install eslint @eslint/js --save-dev  # ESlint
npm install --save-dev @stylistic/eslint-plugin-js  # Style-related rules
```

### Start ESlint configuration
```bash
npx eslint --init  # Initialize a default ESlint configuration

# Answers 👇
# use: syntax
# moudles type: commonjs
# framework: none
# typescript or javascript: javascript
# code runs on: browser
# install them now: yes
# package manager: npm

npx eslint index.js  # Inspect index.js with ESlint
```

### Modify "scripts" to shorten some commands
```json
"scripts": {
   "start": "node index.js",
   "dev": "nodemon index.js",
   "test": "echo \"Error: no test specified\" && exit 1",
   "lint": "eslint .",
   "build:ui": "rm -rf dist && cd ../frontend && npm run build && cp -r dist ../backend",
   "deploy:full": "npm run build:ui && git add . && git commit -m uibuild && git push"
},
```

### Edit eslint.config.mjs
```javascript
import globals from "globals";
import stylisticJs from '@stylistic/eslint-plugin-js'
import js from '@eslint/js'

export default [
  js.configs.recommended,
  {
    files: ["**/*.js"],
    languageOptions: {
      sourceType: "commonjs",
      globals: {
        ...globals.node,
      },
      ecmaVersion: "latest",
    },
    plugins: {
      '@stylistic/js': stylisticJs
    },
    rules: {
      '@stylistic/js/indent': [
        'error',
        2
      ],
      '@stylistic/js/linebreak-style': [
        'error',
        'unix'
      ],
      '@stylistic/js/quotes': [
        'error',
        'single'
      ],
      '@stylistic/js/semi': [
        'error',
        'never'
      ],
      'eqeqeq': 'error',
      'no-trailing-spaces': 'error',
      'object-curly-spacing': [
        'error', 'always'
      ],
      'arrow-spacing': [
        'error', { 'before': true, 'after': true },
      ],
      'no-console': 'off',
    },
  },
  {
    ignores: ["dist/**", "build/**"],
  },
]
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
