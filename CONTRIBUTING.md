# Contributing to Folder Metadata

Thank you for your interest in contributing to `fm`! This document provides guidelines and information for contributors.

## Development Setup

### Prerequisites
- Python 3.8 or higher
- Git

### Setup Instructions

1. **Fork and Clone**
   ```bash
   git clone https://github.com/yourusername/folder-metadata.git
   cd folder-metadata
   ```

2. **Create Virtual Environment**
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install Development Dependencies**
   ```bash
   pip install -e ".[dev,test]"
   ```

4. **Install Pre-commit Hooks**
   ```bash
   pre-commit install
   ```

## Development Workflow

### Code Style
- We use [Black](https://black.readthedocs.io/) for code formatting
- [Flake8](https://flake8.pycqa.org/) for linting
- [MyPy](https://mypy.readthedocs.io/) for type checking

Run quality checks:
```bash
black fm/ tests/
flake8 fm/ tests/
mypy fm/
```

### Testing
- Write tests for all new functionality
- Ensure all tests pass before submitting PR
- Aim for high test coverage

Run tests:
```bash
pytest
pytest --cov=fm  # with coverage
```

### Commit Messages
Follow [Conventional Commits](https://www.conventionalcommits.org/):
- `feat:` for new features
- `fix:` for bug fixes
- `docs:` for documentation changes
- `test:` for test additions/changes
- `refactor:` for code refactoring

### Pull Request Process

1. **Create Feature Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make Changes**
   - Write code following our style guidelines
   - Add tests for new functionality
   - Update documentation if needed

3. **Run Quality Checks**
   ```bash
   pre-commit run --all-files
   pytest
   ```

4. **Commit and Push**
   ```bash
   git add .
   git commit -m "feat: add new feature description"
   git push origin feature/your-feature-name
   ```

5. **Create Pull Request**
   - Use a descriptive title
   - Explain what changes were made and why
   - Reference any related issues

## Code Organization

```
fm/
├── __init__.py          # Package initialization
├── cli.py              # CLI interface and command registration
├── main.py             # Entry point
├── commands/           # Individual command implementations
│   ├── init.py         # Initialize folder metadata
│   ├── validate.py     # Validate repository structure
│   ├── list.py         # List folders by type
│   └── ...
└── utils/              # Shared utilities
    ├── model.py        # Data models and types
    ├── io.py           # File I/O operations
    ├── scanner.py      # Repository scanning logic
    └── validator.py    # Validation logic
```

## Adding New Commands

1. **Create Command Module**
   ```python
   # fm/commands/newcommand.py
   import typer
   from rich.console import Console

   console = Console()

   def new_command_cmd(
       arg: str = typer.Argument(..., help="Description")
   ):
       """Command description."""
       # Implementation
   ```

2. **Register Command**
   ```python
   # fm/cli.py
   from fm.commands.newcommand import new_command_cmd
   
   app.command(name="new-command")(new_command_cmd)
   ```

3. **Add Tests**
   ```python
   # tests/test_newcommand.py
   def test_new_command():
       # Test implementation
   ```

## Release Process

1. **Update Version**
   - Update `fm/__version__.py`
   - Update `pyproject.toml`

2. **Update Changelog**
   - Document new features, fixes, and breaking changes

3. **Create Release**
   ```bash
   git tag v1.2.3
   git push origin v1.2.3
   ```

## Getting Help

- Open an issue for bugs or feature requests
- Join discussions in GitHub Discussions
- Check existing issues and PRs before creating new ones

## Code of Conduct

- Be respectful and inclusive
- Focus on constructive feedback
- Help others learn and grow
- Follow the project's technical standards
