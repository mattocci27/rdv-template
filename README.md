[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

# Reproducible R Project Template

This template is designed to streamline the setup of reproducible R projects, particularly for data analysis and research purposes.
It leverages the power of Docker, Quarto, and other tools to create a consistent and portable development environment, making it easier for teams to collaborate and for individuals to replicate results.
The Dockerfiles used in this template can be found at <https://github.com/mattocci27/r-containers>.

*Note: This README was written with the assistance of ChatGPT-4.*


## Features

- **Docker**:
Consistent and portable environments.

- **Quarto**:
Dynamic and reproducible reports.

- **VSCode Dev Container**:
Containerized development in Visual Studio Code.

- **Apptainer**:
Containerization in high-performance computing (HPC) environments.

- **`renv`** with cache:
Dependency management with a shared cache for faster builds.

- **`targets` package**:
Robust, maintainable, and scalable workflows.


## Getting Started

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/your-username/your-repo-name.git
    ```

2. **Setup Development Environment**:
    ```bash
    ./setup.sh
    ```
    The `setup.sh` script automates the configuration of the development environment for the R project.
    It sets up Docker containers, updates environment settings for renv, and builds an Apptainer image if applicable, ensuring a consistent and reproducible development setup.

3. **Start VSCode Dev Container**: Open the project in Visual Studio Code and start the development container.

4. **Run the Project**:
    ```bash
    ./run.sh
    ```

## Prerequisites

Before setting up the development environment, ensure that the following prerequisites are met:

### Docker Configuration

To avoid permission issues with the Docker container, it's essential to configure Docker to use the same user ID (UID) and group ID (GID) as your host user.
This ensures that files created within the container have the correct permissions on the host system.
Add the following lines to your `.bashrc` or `.zshrc` file:

```bash
export HOST_UID=$(id -u)
export HOST_GID=$(id -g)
```

These commands set environment variables `HOST_UID` and `HOST_GID` to your user's UID and GID, respectively.
These variables can then be used in the Docker configuration to set the container's user permissions.

### Renv Configuration

[`renv`](https://rstudio.github.io/renv/articles/renv.html) is a dependency management tool for R that helps you create reproducible environments for your R projects.
To use `renv` with this development environment, create a directory at `$HOME/renv` on your host system:

```bash
mkdir -p $HOME/renv
```

This directory will be used to store `renv` caches, which can be shared across multiple projects to save disk space and reduce the time required to install R packages.

### SSH Configuration

If you need to access private Git repositories or other services using SSH keys from within the dev container, you'll need to set up SSH key forwarding.
This allows the container to use your host's SSH keys without copying them into the container, which is more secure.

Follow the [SSH Setup Instructions](./templates/ssh_setup.md) to configure SSH key forwarding for the development environment.

By following these prerequisites, you'll ensure that the development environment is set up correctly and securely, with proper permissions and access to necessary tools and services.

## Project Structure

- `./_targets`: Metadata for the `targets` package.
- `./_targets.R`: Target pipeline definition.
- `./_targets_packages.R`: Required packages for the pipeline.
- `./apptainer.def`: Apptainer container definition file.
- `./data`: Processed data.
- `./data-raw`: Raw data.
- `./docs`: Documentation.
- `./figs`: Figures.
- `./ms`: Manuscript files, including Quarto markdown and bibliography.
- `./R`: R scripts for functions, package loading, and pipeline execution.
- `./report.qmd`: Quarto markdown file for the report.
- `./run.sh`: Bash script to run the pipeline.
- `./scripts`: Setup scripts for the development environment.
- `./setup.sh`: Environment setup script.
- `./stan`: Stan model files.
- `./templates`: Template files for devcontainer, Docker Compose, and SSH setup.
