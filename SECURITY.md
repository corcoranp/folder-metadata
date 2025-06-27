# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 0.1.x   | :white_check_mark: |

## Reporting a Vulnerability

If you discover a security vulnerability, please send an email to [security@yourcompany.com](mailto:security@yourcompany.com). All security vulnerabilities will be promptly addressed.

Please include the following information in your report:

- Description of the vulnerability
- Steps to reproduce the issue
- Potential impact
- Any suggested fixes

We will acknowledge your email within 48 hours and provide a detailed response within 7 days indicating the next steps in handling your report.

## Security Best Practices

When using `fm`, please follow these security guidelines:

1. **File Permissions**: Ensure metadata files have appropriate permissions
2. **Input Validation**: Be cautious with user-provided paths and inputs
3. **Dependency Updates**: Keep dependencies up to date
4. **Code Review**: Review all changes before merging

## Known Security Considerations

- The tool reads and writes files in the filesystem - ensure proper permissions
- YAML parsing could be vulnerable to malicious input - we use safe loading
- Path traversal protection is implemented for file operations
