## 2024-07-18 - [Gitleaks Workflow]
**Vulnerability:** Missing automated secret scanning.
**Learning:** This repo is designed to rotate passwords/keys frequently but lacked automated, consistent mechanisms to detect accidentally checked in credentials or hardcoded secrets. Relying on humans to catch these via PR reviews alone is dangerous.
**Prevention:** Gitleaks workflow added to `.github/workflows/gitleaks.yml`. Going forward, this tool should catch any newly introduced hardcoded secrets in PRs before they are merged.