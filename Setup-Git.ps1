# 1. Initialize the repository
git init

# 2. Create a .gitignore file to exclude node_modules and system files
$ignoreContent = @"
# Dependencies
node_modules/

# OS generated files
.DS_Store
Thumbs.db

# Log files
npm-debug.log*
yarn-debug.log*
yarn-error.log*
"@
Set-Content -Path ".gitignore" -Value $ignoreContent

# 3. Rename the default branch to 'main' (modern standard)
git branch -M main

# 4. Stage all files
git add .

# 5. Commit the current state
git commit -m "Initial commit: Setup HTML and Tailwind CSS configuration"

Write-Host "Git repository initialized and initial commit complete!" -ForegroundColor Green