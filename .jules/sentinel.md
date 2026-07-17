## 2024-07-17 - [Outdated CI Distribution in Travis CI]
**Vulnerability:** Found `dist: bionic` in `.travis.yml` which relies on Ubuntu 18.04 LTS. This OS is End-Of-Life (EOL), meaning it no longer receives critical security patches or updates.
**Learning:** Legacy CI pipeline configurations can often slip past standard vulnerability scans but represent significant risks by building, testing, and sometimes deploying applications using unpatched, vulnerable environments.
**Prevention:** Regularly audit CI/CD configuration files (like `.travis.yml`, GitHub Actions workflows) to ensure supported operating system versions are used (e.g., `jammy` for Ubuntu 22.04 LTS). Integrate infrastructure-as-code linting and incorporate CI/CD configurations into dependency update processes.
