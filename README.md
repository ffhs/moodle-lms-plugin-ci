# Moodle LMS Plugin CI – Prebuilt Docker Image for GitLab CI/CD🐘

[![GitHub](https://img.shields.io/badge/github-repo-blue?logo=github&label=Moodle%20LMS%20Plugin%20CI)](https://github.com/ffhs/moodle-lms-plugin-ci)
![PHP Versions](https://img.shields.io/badge/PHP-8.1%20%7C%208.2%20%7C%208.3%20%7C%208.4-blue)
![License](https://img.shields.io/badge/license-%20%20GNU%20GPLv3%20-red)

A prebuilt **Moodle Plugin CI** Docker image for faster and more consistent testing across Moodle versions.
Based on [`moodlehq/moodle-php-apache`](https://hub.docker.com/r/moodlehq/moodle-php-apache) and includes all dependencies for [moodle-plugin-ci](https://github.com/moodlehq/moodle-plugin-ci). Used for GitLab CI/CD.

---

## 🧩 Features

- PHP 8.1 to 8.4 builds available
- Includes Node.js 22, Composer, MariaDB & PostgreSQL clients
- Preinstalled [moodle-plugin-ci](https://github.com/moodlehq/moodle-plugin-ci) v4.5.9
- Optimized for GitLab CI or local development

---

## 🐳 Usage

Pull the prebuilt image for your desired PHP version:

```bash
# Example: PHP 8.4
docker pull ffhs/moodle-lms-plugin-ci:8.4
```

For **GitLab CI/CD** use [`.gitlab-ci.yml`](examples/.gitlab-ci.yml) inside the `example` folder