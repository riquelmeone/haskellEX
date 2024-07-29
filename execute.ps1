# Exit immediately if a command exits with a non-zero status
$ErrorActionPreference = "Stop"

# Clean the build artifacts
Write-Host "Cleaning the project..."
cabal clean

# Build the project
Write-Host "Building the project..."
cabal build

# Run the project
Write-Host "Running the project..."
cabal run
