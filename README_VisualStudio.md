# X++ Model Context Protocol SDK - Visual Studio Setup

This directory contains the complete Visual Studio project structure for the X++ Model Context Protocol SDK, designed for Microsoft Dynamics 365 Finance & Supply Chain Management.

## Project Structure

### Visual Studio Files
- `XPPModelContextProtocolSDK.sln` - Solution file for Visual Studio
- `XPPModelContextProtocolSDK.rnrproj` - D365 X++ project file
- `Descriptor/XPPModelContextProtocolSDK.xml` - Model descriptor for D365

### Source Code Directories
- `MCPContracts/` - Core data contracts and enums
- `MCPClient/` - Client implementation classes
- `MCPServer/` - Server implementation (future expansion)
- `MCPExtensions/` - Extension and utility classes
- `Documentation/` - Technical documentation

## Setup Instructions

### Prerequisites
1. **Visual Studio 2019 or later** with D365 Finance & Operations development tools installed
2. **D365 Finance & SCM development environment** (Local VM, Cloud-hosted, or Unified Development Environment)
3. **Package Local Directory** configured in Visual Studio

### Installation Steps

1. **Clone or Download**
   ```bash
   git clone https://github.com/Frosendo01/X-SDK.git
   ```

2. **Import into D365 Development Environment**
   
   **Option A: Using Visual Studio (Recommended)**
   - Open Visual Studio as Administrator
   - Open the solution file: `XPPModelContextProtocolSDK.sln`
   - Build the project (`Ctrl+Shift+B`)
   
   **Option B: Manual Import**
   - Copy the entire `ModelContextProtocolSDK` folder to your PackagesLocalDirectory
   - Restart Visual Studio and Application Object Server (AOS)
   - Create a new project and add references to the model

3. **Configure Model in Visual Studio**
   - In Visual Studio, go to `Dynamics 365` → `Model Management` → `Create Model`
   - Or use the existing model defined in the project file
   - Ensure the model is set to the `usr` layer

4. **Build and Deploy**
   - Build the solution in Visual Studio
   - Deploy to your development environment
   - Sync the database if needed

## Usage Examples

### Basic MCP Client Usage

```xpp
// Example 1: Initialize MCP Client
MCPClient client = MCPClientFactory::createClient("https://your-mcp-server.com/api");
client.initialize();

// Example 2: List Available Tools
container tools = client.listTools();
Info::info(strFmt("Found %1 tools available", conLen(tools)));

// Example 3: Call a Tool
MCPJsonRpcRequest request = new MCPJsonRpcRequest();
request.setMethod("your_tool_name");
request.setParameters(["param1", "param2"]);

MCPJsonRpcResponse response = client.callTool(request);
if (response && response.getResult())
{
    Info::info(strFmt("Tool response: %1", response.getResult()));
}
```

### Demo and Testing

```xpp
// Run the built-in demo
MCPClientDemo demo = new MCPClientDemo();
demo.runBasicDemo();
```

## Model Dependencies

This model depends on the following D365 standard modules:
- `ApplicationPlatform` - Core X++ platform functionality
- `System.Net` assemblies via .NET interop
- `System.Text.Json` for JSON serialization

## Configuration

### HTTP Client Settings
- Default timeout: 30 seconds
- Content-Type: application/json
- User-Agent: D365-MCP-Client/1.0

### Authentication
The SDK supports Bearer token authentication. Configure in your client code:

```xpp
MCPClient client = MCPClientFactory::createClientWithAuth(
    "https://your-server.com/api", 
    "your-bearer-token"
);
```

## Development Notes

### Adding New Features
1. Create new classes in the appropriate directory
2. Update the `.rnrproj` file to include new files
3. Rebuild the project
4. Test thoroughly in development environment

### Best Practices
- Always use try-catch blocks when calling external services
- Implement proper logging using the `MCPLoggingLevel` enum
- Follow D365 X++ coding standards and naming conventions
- Test with various MCP server implementations

## Troubleshooting

### Common Issues

1. **Build Errors**
   - Ensure all dependencies are available
   - Check that .NET Framework 4.6+ is installed
   - Verify model is in the correct layer (`usr`)

2. **Runtime Errors**
   - Check network connectivity to MCP servers
   - Verify authentication tokens are valid
   - Review AOS event logs for detailed error messages

3. **Performance Issues**
   - Consider implementing async patterns for large operations
   - Use batch processing for multiple tool calls
   - Monitor HTTP timeout settings

### Getting Help
- Check the main documentation in `/Documentation/`
- Review error logs in D365 Event Viewer
- Test with the provided demo classes
- Submit issues to the GitHub repository

## Version History

- **v1.0.0** - Initial release with core MCP client functionality
- Includes: Basic client, JSON handling, HTTP communication, error management

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contributing

Contributions are welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly in D365 environment
5. Submit a pull request with detailed description

## Support

For support and questions:
- GitHub Issues: https://github.com/Frosendo01/X-SDK/issues
- Documentation: Review the `/Documentation/` folder
- Community: Share experiences with other D365 developers

---

**Note**: This SDK is designed for integration scenarios and should be thoroughly tested in non-production environments before deployment to production systems. 