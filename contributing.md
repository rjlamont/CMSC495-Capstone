# Contributing to Our Project

Thank you for your interest in contributing to our educational hangman game and website project. This document provides detailed instructions on how to set up your development environment, make changes, and submit your contributions. We use Visual Studio Code (VS Code) for development and GitHub for version control and collaboration.

## Setting Up Your Development Environment

### 1. Install the Necessary Tools

Ensure you have the following installed:
- [Git](https://git-scm.com/downloads)
- [Visual Studio Code (VS Code)](https://code.visualstudio.com/)
- [Godot Engine](https://godotengine.org/download) (for game development contributors)

### 2. Fork the Repository

You can start by forking the project repository to your GitHub account. Visit the repository URL and click the "Fork" button at the top right corner.

### 3. Clone the Forked Repository

Open VS Code, and in the terminal, clone your forked repository using:

```bash
git clone https://github.com/YOUR_USERNAME/CMSC495-Capstone.git ```

Replace `YOUR_USERNAME` with your GitHub username.

### 4. Set Upstream Remote
To keep your fork synchronized with the main project set the original repository as an upstream remote:

```bash
git remote add upstream https://github.com/AwaywithCharles/CMSC495-Capstone.git ```

### 5. Create a New Branch

For each new feature or fix, create a new branch:

```bash
git checkout -b YOUR_BRANCH_NAME ```

Replace YOUR_BRANCH_NAME with a descriptive name for your branch.

### 6. Making Changes

Open the project in VS Code to make your changes.

Test your changes thoroughly.

Commit your changes with a descriptive message:

```bash
git add. Git commit -m "A descriptive message about your contribution." ```

### 7. Submitting Your Contributions

Push your branch to your fork:

```bash
git push origin YOUR_BRANCH_NAME```

Go to the GitHub page of your forked repository and click "Pull Request" to submit your changes to the main project.

Fill in the pull request template with a description of your changes and why they are necessary.

Submit your pull request.

### 8. Keeping Your Fork Up to Date

Regularly sync your fork with the main project:

```bash
git fetch upstream git checkout main git merge upstream/main ```

### 9. Additional Guidelines

Write clear and descriptive commit messages.

Follow the project's coding standards.

Update any documentation if necessary.