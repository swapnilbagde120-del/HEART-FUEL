#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
ENV="$ROOT/backend/.env"
if [ ! -f "$ENV" ]; then
  cp "$ROOT/backend/.env.example" "$ENV"
  # Generate strong local-only secrets; leave SMS credentials blank until configured.
  JWT=$(python3 - <<'PY'
import secrets
print(secrets.token_urlsafe(48))
PY
)
  PEPPER=$(python3 - <<'PY'
import secrets
print(secrets.token_urlsafe(48))
PY
)
  sed -i "s#^JWT_SECRET=.*#JWT_SECRET=$JWT#; s#^OTP_PEPPER=.*#OTP_PEPPER=$PEPPER#" "$ENV"
  echo "Created backend/.env with fresh local secrets."
else
  echo "backend/.env already exists; leaving it unchanged."
fi

echo
echo "Next:"
echo "  1) Start backend: cd backend && docker compose up -d"
echo "  2) Health check:  curl http://localhost:8080/health"
echo "  3) Emulator build: ./gradlew :app:assembleDebug"
echo "  4) Physical phone: ./gradlew :app:assembleDebug -PAPI_BASE_URL=http://YOUR-PC-LAN-IP:8080/v1"
echo
echo "OTP requires Twilio values in backend/.env."
