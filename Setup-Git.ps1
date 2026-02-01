# 1. Initialize Git
git init

# 2. Create .gitignore (Crucial: ignore node_modules, but keep dist/output.css for this workflow)
$ignoreContent = @"
# Dependencies
node_modules/
.DS_Store
Thumbs.db

# Logs
npm-debug.log*
yarn-debug.log*
"@
Set-Content -Path ".gitignore" -Value $ignoreContent

# 3. Rename branch to main
git branch -M main

# 4. Stage all files (index.html, tailwind.config.js, src/, dist/, package.json)
git add .

# 5. Commit
git commit -m "Initial commit: Tailwind 3.4 setup with minified build"

Write-Host "Success! Repository initialized and version 1.0 saved." -ForegroundColor Green