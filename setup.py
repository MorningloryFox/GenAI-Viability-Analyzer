#!/usr/bin/env python
"""Setup script for GenAI Viability Analyzer."""

from setuptools import setup, find_packages

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

with open("requirements.txt", "r", encoding="utf-8") as fh:
    requirements = [line.strip() for line in fh if line.strip() and not line.startswith("#")]

setup(
    name="genai-viability-analyzer",
    version="1.0.0",
    author="Your Name",
    author_email="your.email@example.com",
    description="Professional framework for GenAI project viability analysis",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/yourusername/GenAI-Viability-Analyzer",
    project_urls={
        "Bug Tracker": "https://github.com/yourusername/GenAI-Viability-Analyzer/issues",
        "Documentation": "https://github.com/yourusername/GenAI-Viability-Analyzer/tree/main/docs",
        "Source Code": "https://github.com/yourusername/GenAI-Viability-Analyzer",
    },
    packages=find_packages(where="src"),
    package_dir={"": "src"},
    classifiers=[
        "Development Status :: 4 - Beta",
        "Environment :: Console",
        "Intended Audience :: Developers",
        "Intended Audience :: Business and Finance",
        "License :: OSI Approved :: MIT License",
        "Natural Language :: Portuguese (Brazilian)",
        "Operating System :: OS Independent",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Programming Language :: Python :: 3.12",
        "Topic :: Office/Business",
        "Topic :: Scientific/Engineering :: Artificial Intelligence",
    ],
    python_requires=">=3.10",
    install_requires=requirements,
    entry_points={
        "console_scripts": [
            "genai-analyzer=analyzer.cli:main",
        ],
    },
    include_package_data=True,
    zip_safe=False,
)
