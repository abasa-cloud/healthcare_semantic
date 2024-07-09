from setuptools import setup, find_packages

setup(
    name="testing_package",
    version="0.1",
    packages=find_packages(),
    install_requires=[
        'dbt-core>=1.0.0',  # Core dbt package
        'dbt-snowflake>=1.0.0',  # dbt adapter for Snowflake
        'pandas>=1.3.0',  # Example dependency for data processing
        'numpy>=1.21.0',  # Example dependency for numerical operations
    ],
    author="test-hkkd",
    author_email="test.hkkd@gmail.com",
    description="Testing package",
    url="https://github.com/abasa-hkkd/healthcare_semantic.git",
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.8',
)
