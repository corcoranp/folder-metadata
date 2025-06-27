.PHONY: help install install-dev test lint format type-check clean build upload docs

help:  ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

install:  ## Install package
	pip install -e .

install-dev:  ## Install package with development dependencies
	pip install -e ".[dev,test]"
	pre-commit install

test:  ## Run tests
	pytest

test-cov:  ## Run tests with coverage
	pytest --cov=fm --cov-report=html --cov-report=term-missing

lint:  ## Run linting
	flake8 fm/ tests/

format:  ## Format code
	black fm/ tests/

format-check:  ## Check code formatting
	black --check fm/ tests/

type-check:  ## Run type checking
	mypy fm/

quality:  ## Run all quality checks
	black --check fm/ tests/
	flake8 fm/ tests/
	mypy fm/
	pytest

clean:  ## Clean build artifacts
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info/
	find . -type d -name __pycache__ -delete
	find . -type f -name "*.pyc" -delete

build:  ## Build package
	python -m build

upload-test:  ## Upload to TestPyPI
	twine upload --repository testpypi dist/*

upload:  ## Upload to PyPI
	twine upload dist/*

docs:  ## Generate documentation
	@echo "Documentation generation not yet implemented"

release:  ## Create a new release (run with VERSION=x.y.z)
	@if [ -z "$(VERSION)" ]; then \
		echo "Usage: make release VERSION=x.y.z"; \
		exit 1; \
	fi
	@echo "Creating release $(VERSION)"
	@sed -i '' 's/__version__ = ".*"/__version__ = "$(VERSION)"/' fm/__version__.py
	@sed -i '' 's/version = ".*"/version = "$(VERSION)"/' pyproject.toml
	@git add fm/__version__.py pyproject.toml
	@git commit -m "chore: bump version to $(VERSION)"
	@git tag -a v$(VERSION) -m "Release v$(VERSION)"
	@echo "Release $(VERSION) created. Push with: git push origin main --tags"
