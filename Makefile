# Makefile for X++ Model Context Protocol SDK
# For Microsoft Dynamics 365 Finance & Supply Chain Management

.PHONY: help build clean deploy sync test docs

# Default target
help:
	@echo "X++ Model Context Protocol SDK Build Commands"
	@echo "=============================================="
	@echo ""
	@echo "Available targets:"
	@echo "  build    - Build the X++ project in Visual Studio"
	@echo "  clean    - Clean build artifacts"
	@echo "  deploy   - Deploy to development environment"
	@echo "  sync     - Synchronize database"
	@echo "  test     - Run demo and test classes"
	@echo "  docs     - Generate documentation"
	@echo "  install  - Install to PackagesLocalDirectory"
	@echo "  help     - Show this help message"
	@echo ""
	@echo "Prerequisites:"
	@echo "  - Visual Studio with D365 development tools"
	@echo "  - D365 development environment running"
	@echo "  - PowerShell for automation scripts"

# Build the project
build:
	@echo "Building X++ Model Context Protocol SDK..."
	@powershell -Command "& { \
		$$vs = Get-Process -Name 'devenv' -ErrorAction SilentlyContinue; \
		if ($$vs) { \
			Write-Host 'Visual Studio is running. Please build manually or close VS first.'; \
			exit 1; \
		} else { \
			Write-Host 'Use Visual Studio to build: Open XPPModelContextProtocolSDK.sln and press Ctrl+Shift+B'; \
		} \
	}"

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	@powershell -Command "& { \
		Remove-Item -Path 'bin' -Recurse -Force -ErrorAction SilentlyContinue; \
		Remove-Item -Path 'obj' -Recurse -Force -ErrorAction SilentlyContinue; \
		Remove-Item -Path '*.log' -Force -ErrorAction SilentlyContinue; \
		Write-Host 'Build artifacts cleaned.'; \
	}"

# Deploy to development environment
deploy:
	@echo "Deploying to D365 development environment..."
	@echo "Manual step: Use Visual Studio to deploy the model"
	@echo "1. Build the project (Ctrl+Shift+B)"
	@echo "2. Deploy to environment (depends on your D365 setup)"

# Synchronize database
sync:
	@echo "Database synchronization..."
	@echo "Manual step: Run database sync in D365"
	@echo "1. Go to D365 client"
	@echo "2. System Administration > Setup > Database > Synchronize"

# Run tests and demos
test:
	@echo "Running MCP SDK tests and demos..."
	@echo "Manual step: Execute demo classes in D365"
	@echo "1. Open D365 client"
	@echo "2. Navigate to a job or form"
	@echo "3. Execute: MCPClientDemo::new().runBasicDemo();"

# Generate documentation
docs:
	@echo "Documentation is available in:"
	@echo "  - README_VisualStudio.md (Setup guide)"
	@echo "  - Documentation/ folder (Technical docs)"
	@echo "  - CHANGELOG.md (Version history)"

# Install to PackagesLocalDirectory
install:
	@echo "Installing X++ MCP SDK..."
	@echo "Manual step: Copy to PackagesLocalDirectory"
	@echo "1. Copy ModelContextProtocolSDK folder to your PackagesLocalDirectory"
	@echo "2. Restart Visual Studio and AOS"
	@echo "3. Create new project and reference the model"

# Quick status check
status:
	@echo "X++ Model Context Protocol SDK Status"
	@echo "======================================"
	@echo "Project files:"
	@powershell -Command "& { \
		if (Test-Path 'XPPModelContextProtocolSDK.sln') { Write-Host '✓ Solution file exists' } else { Write-Host '✗ Solution file missing' }; \
		if (Test-Path 'XPPModelContextProtocolSDK.rnrproj') { Write-Host '✓ Project file exists' } else { Write-Host '✗ Project file missing' }; \
		if (Test-Path 'Descriptor/XPPModelContextProtocolSDK.xml') { Write-Host '✓ Model descriptor exists' } else { Write-Host '✗ Model descriptor missing' }; \
		$$xppFiles = Get-ChildItem -Path '.' -Filter '*.xpp' -Recurse; \
		Write-Host \"✓ $$($xppFiles.Count) X++ source files found\"; \
	}" 