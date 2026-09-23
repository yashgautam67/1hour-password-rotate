#!/usr/bin/env bash

set -euo pipefail

PASSWORD_LENGTH="${PASSWORD_LENGTH:-24}"
PRINT_PASSWORD="${PRINT_PASSWORD:-false}"
PASSWORD_OUTPUT_FILE="${PASSWORD_OUTPUT_FILE:-}"

if ! [[ "$PASSWORD_LENGTH" =~ ^[0-9]+$ ]] || [ "$PASSWORD_LENGTH" -lt 16 ]; then
  echo "PASSWORD_LENGTH must be a number >= 16" >&2
  exit 1
fi

generate_password() {
  local length="$1"
  tr -dc 'A-Za-z0-9@#%^*_-+=' < /dev/urandom | head -c "$length"
}

rotated_password="$(generate_password "$PASSWORD_LENGTH")"
rotated_at="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
password_hash="$(printf '%s' "$rotated_password" | sha256sum | awk '{print $1}')"

if [ -n "$PASSWORD_OUTPUT_FILE" ]; then
  umask 077
  printf '%s\n' "$rotated_password" > "$PASSWORD_OUTPUT_FILE"
fi

if [ "$PRINT_PASSWORD" = "true" ]; then
  echo "New password: $rotated_password"
fi

echo "Password rotation completed at: $rotated_at"
echo "Password fingerprint (sha256): $password_hash"
echo "Password length: $PASSWORD_LENGTH"
echo "Output file written: $([ -n "$PASSWORD_OUTPUT_FILE" ] && echo "yes" || echo "no")"
