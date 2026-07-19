## 2024-05-19 - [Automated Secret Scanning]
**Vulnerability:** Lack of automated secret scanning in CI pipeline for a password-rotation focused repo.
**Learning:** Repositories dealing with passwords/secrets need proactive defenses against accidental commits, as manual reviews are error-prone.
**Prevention:** Added Gitleaks GitHub Action to run on push and PR to ensure no secrets are accidentally committed.
