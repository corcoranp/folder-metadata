"""Test configuration and fixtures."""

import pytest
from pathlib import Path
import tempfile
import shutil
from typing import Generator


@pytest.fixture
def temp_dir() -> Generator[Path, None, None]:
    """Create a temporary directory for testing."""
    temp_path = Path(tempfile.mkdtemp())
    try:
        yield temp_path
    finally:
        shutil.rmtree(temp_path, ignore_errors=True)


@pytest.fixture
def sample_repo_structure(temp_dir: Path) -> Path:
    """Create a sample repository structure for testing."""
    # Create repository root
    repo_file = temp_dir / ".folder.repo"
    repo_file.write_text("type: repo\nname: test-repo\ndescription: Test repository")

    # Create platform
    platform_dir = temp_dir / "backend"
    platform_dir.mkdir()
    platform_file = platform_dir / ".folder.platform"
    platform_file.write_text(
        "type: platform\nname: backend\ndescription: Backend platform"
    )

    # Create project
    project_dir = platform_dir / "api-service"
    project_dir.mkdir()
    project_file = project_dir / ".folder.project"
    project_file.write_text(
        """type: project
name: api-service
language: python
version: 1.0.0
owner: backend-team
team: platform
lifecycle: production
tags: [api, microservice]
"""
    )

    return temp_dir
