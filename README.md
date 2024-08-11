# scripts
A collection of random scripts and utilities.

## List of scripts (unordered)
### ⏲️ flutter_extensions.dart
A collection of useful extensions for Flutter to enhance the development experience. For example:
- Type `20.0.horizontal` instead of `const EdgeInsets.symmetric(horizontal: 20.0)` to set horizontal padding.
- Convert a _camelCaseString_ to a _Spaced Title Case String_ with <br> `"somethingLikeThis".camelCaseToSpacedTitleCase; // output: "Something Like This"`.
- Access `YourProvider` with `context.yourProvider` instead of `Provider.of<YourProvider>(context, listen: false)`.

### 🧠 openai_to_firestore.py
A Python script template that utilizes your OpenAI account to generate a story using ChatGPT, following specific rules, and stores the result in your Firestore database.
