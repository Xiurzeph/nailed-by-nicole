# 1. Initialize npm and install Tailwind CSS 3.4
npm init -y
npm install -D tailwindcss@3.4 postcss autoprefixer

# 2. Create folder structure
New-Item -ItemType Directory -Path "src", "dist" -Force

# 3. Create the tailwind.config.js with your specific brand colors
$configContent = @"
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./*.html", "./src/**/*.{js,ts,jsx,tsx}"],
  theme: {
    extend: {
      colors: {
        brand: {
          green: '#228B22',
          gold: '#FFD700',
          dark: '#1a6b1a',
        }
      },
      fontFamily: {
        serif: ['Georgia', 'serif'],
      },
      animation: {
        fadeInUp: 'fadeInUp 1s ease-out forwards',
      },
      keyframes: {
        fadeInUp: {
          '0%': { opacity: '0', transform: 'translateY(20px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
      },
    },
  },
  plugins: [],
}
"@
Set-Content -Path "tailwind.config.js" -Value $configContent

# 4. Create the input CSS file
$cssContent = "@tailwind base;`n@tailwind components;`n@tailwind utilities;"
Set-Content -Path "src/input.css" -Value $cssContent

# 5. Add build scripts to package.json
$packageJson = Get-Content -Raw -Path "package.json" | ConvertFrom-Json
$packageJson.scripts | Add-Member -MemberType NoteProperty -Name "build" -Value "npx tailwindcss -i ./src/input.css -o ./dist/output.css --minify"
$packageJson.scripts | Add-Member -MemberType NoteProperty -Name "watch" -Value "npx tailwindcss -i ./src/input.css -o ./dist/output.css --watch"
$packageJson | ConvertTo-Json -Depth 10 | Set-Content -Path "package.json"

Write-Host "Setup complete! Run 'npm run watch' to start developing." -ForegroundColor Green