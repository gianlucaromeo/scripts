## Setup node.js and Express
Configuration for setting up a backend for the [Full Stack Open](https://fullstackopen.com/en/) course.
<br/>

### Setup project
```bash
# Setup npm package 
npm init

# Then, follow the commands the terminal asks for setting up the package

# Setup .gitignore
touch .gitignore
echo "node_modules" >> .gitignore
echo ".env" >> .gitignore

# Create index.js
touch index.js

# npm install express               # Express
# npm install morgan                # Logger
# npm install cors                  # Cross-origin requests and data transfers
# npm install static                # Static files
# npm install dotenv                # Environment variables
# npm install mongoose              # Application data modeling
# npm install cross-env             # Run some commands on Windows
# npm install express-async-errors  # Avoid try-catch for async operations
# npm install bcrypt                # Passwords algorithms
# 
# Or:
npm install express morgan cors static dotenv mongoose cross-env express-async-errors bcrypt


# npm install --save-dev nodemon                      # Avoid manual server restarts
# npm install --save-dev eslint @eslint/js            # ESlint
# npm install --save-dev @stylistic/eslint-plugin-js  # Style-related rules
# npm install --save-dev supertest                    # Testing
#
# Or:
npm install --save-dev nodemon eslint @stylistic/eslint-plugin-js supertest
```
<br/>

### Start ESlint configuration
```bash
npx eslint --init  # Initialize a default ESlint configuration

# Answers 👇
# use: syntax
# moudles type: commonjs
# framework: none
# typescript or javascript: javascript
# code runs on: node
# install them now: yes
# package manager: npm

npx eslint index.js  # Inspect index.js with ESlint
```
<br/>

### Modify "scripts" to shorten some commands
```json
"scripts": {
   "start": "cross-env NODE_ENV=production node index.js",
   "dev": "cross-env NODE_ENV=development nodemon index.js",
   "test": "cross-env NODE_ENV=test node --test",
   "lint": "eslint .",
   "build:ui": "rm -rf dist && cd ../frontend && npm run build && cp -r dist ../backend",
   "deploy:full": "npm run build:ui && git add . && git commit -m uibuild && git push"
},
```
<br/>

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
<br/>

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
<br/>

### Good node.js structure
Example of a notes app:
```bash
├── index.js
├── app.js
├── dist
│   └── ...
├── controllers
│   └── notes.js
├── models
│   └── note.js
├── package-lock.json
├── package.json
├── utils
│   ├── config.js
│   ├── logger.js
│   └── middleware.js  
```
<br/>

### Testing - useful commands
```shell
npm test -- --test-only
npm test -- tests/your_file.test.js
npm test -- --test-name-pattern="the name of your test"
```
