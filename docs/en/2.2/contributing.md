# Contribution Guide

There are several ways to contribute to NovoSGA:

## Reporting Problems

- Access the Issues section of the repository.
- Check if the problem has already been reported to avoid duplication.
- Provide as much information as possible about the problem, including:
    - NovoSGA version
    - Operating system and PHP version
    - Steps to reproduce the problem
    - Logs and screenshots, if possible


## Suggestions for Improvements and Features

If you have ideas for new features or improvements, open a suggestion Issue with a detailed description. Discuss your idea with the community for alignment before starting development.


## Answering questions

Help other users by answering questions about using or installing the system.

- [Discussion forum](https://discuss.novosga.org/)
- [Telegram group](https://t.me/novosga)

## Documentation

Did you miss any important system information, or a lack of clarity in the NovoSGA documentation? Help make our documentation clearer and more comprehensive.

At the end of each page there is a link to edit it. If you want to request a new section, just open a new Pull Request for the repository below:

https://github.com/novosga/novosga.github.io/

All documentation is in the `/docs` path.


## Development

### Prerequisites

To get started, make sure you have the following prerequisites:

- **Git**: for version control
- **Composer**: to manage PHP dependencies
- **PHP**: check the version defined in the `composer.json` file

### Contribution Process

#### 1. Fork the repository

Click "Fork" on the [NovoSGA](https://github.com/novosga/novosga) page to create a copy of the repository in your GitHub account.

#### 2. Clone the Forked repository

Clone the repository to your local machine using the following command:

```bash
git clone https://github.com/your-user/novosga.git
cd novosga
```

#### 3. Create a branch

Use branches for each change or improvement. The branch name should be descriptive of what is being done:

```bash
git checkout -b my-contribution
```

#### 4. Install dependencies

Make sure all dependencies are installed.

```bash
composer install
```

#### 5. Implement the changes

Make the necessary changes to the code and write tests that cover the added features or corrected bugs. Make sure the code is clean, documented, and follows clean code practices.

#### 6. Run tests and code analysis

Before submitting your changes, run all tests to ensure everything is working correctly.

```bash
./vendor/bin/phpunit
./vendor/bin/phpcs
./vendor/bin/phpstan --memory-limit=1g
```

#### 7. Commit the changes

Write clear and concise commit messages. Use the following pattern for commit messages:

- `feat:` For new features
- `fix:` For bug fixes
- `docs:` For documentation changes
- `style:` Formatting and style adjustments
- `refactor:` Code refactoring
- `test:` Addition or modification of tests

```bash
git commit -m "fix: fixed bug in user authentication"
```

#### 8. Send your changes

Send your changes to your GitHub repository:

```bash
git push origin my-contribution
```

#### 9. Create a Pull Request

On GitHub, go to your forked repository and click New Pull Request. Clearly describe the change and include references to any related issues.

> Example description: "This PR resolves problem #123 and implements the login functionality via OAuth authentication.

### Code standards

To maintain consistent code, follow these style standards:

- Use PSR-12 as the standard for PHP formatting.
- Name variables and methods clearly and descriptively.
- Avoid code duplication.
- Add documentation for complex classes, methods, and functions.

### Pull Request Review

The NovoSGA maintainers will review your Pull Request and may suggest changes. Remember:

- Be receptive to feedback.
- Be willing to discuss your implementation.
