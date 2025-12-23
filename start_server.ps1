# IENG Industries Rails Server Startup Script
# This script starts the Rails development server on Windows

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  IENG Industries Server Startup" -ForegroundColor Magenta
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Set Ruby path
$env:PATH = "C:\Ruby32-x64\bin;" + $env:PATH

# Change to project directory
$projectPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $projectPath

Write-Host "Project Path: $projectPath" -ForegroundColor Green
Write-Host ""

# Check if Bundler is installed
Write-Host "Checking dependencies..." -ForegroundColor Yellow
bundle check
if ($LASTEXITCODE -ne 0) {
    Write-Host "Installing gems..." -ForegroundColor Yellow
    bundle install
}

Write-Host ""
Write-Host "Starting Rails server..." -ForegroundColor Green
Write-Host "The website will be available at http://localhost:3000" -ForegroundColor Cyan
Write-Host ""
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
Write-Host ""

# Start the Rails server
bundle exec rails s -b 0.0.0.0 -p 3000
