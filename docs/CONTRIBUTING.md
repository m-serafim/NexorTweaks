# Contributing Guide

Thank you for your interest in contributing to C-TweaksPs1!

## How to Contribute

### Reporting Issues

1. Check if the issue already exists in the GitHub Issues
2. Provide a clear description of the problem
3. Include steps to reproduce
4. Include your environment details (Windows version, .NET version)

### Submitting Changes

1. Fork the repository
2. Create a new branch for your feature or bug fix
3. Make your changes
4. Test your changes thoroughly
5. Ensure all validation scripts pass
6. Submit a pull request

## Development Guidelines

### Code Style

- Follow existing code patterns
- Use meaningful variable and method names
- Add XML documentation comments to public APIs
- Keep methods focused and concise

### Testing

Before submitting changes:

1. Build the project successfully:
   ```bash
   dotnet build
   ```

2. Validate JSON configuration:
   ```bash
   # On Windows:
   .\scripts\validate-json.ps1
   
   # On Linux/Mac:
   ./scripts/validate-json.sh
   ```

3. Test configuration loading:
   ```bash
   # (if test infrastructure exists)
   ```

### JSON Configuration

When modifying `config/tweaks.json`:

- Always validate JSON syntax before committing
- Use proper indentation (2 spaces)
- Ensure all commas are in place
- Test that configuration loads successfully

### Commit Messages

- Use clear, descriptive commit messages
- Start with a verb (Add, Fix, Update, Remove, etc.)
- Keep the first line under 72 characters
- Add details in the body if needed

## Questions?

Open an issue with the "question" label for any clarifications.
