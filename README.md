# HEART FUEL API

Node.js + Express + PostgreSQL backend for blood inventory and emergency coordination.

## Run

1. Copy `.env.example` to `.env` and set real secrets.
2. Apply `../schema.sql` to PostgreSQL.
3. Install dependencies and start:

```bash
npm install
npm start
```

Required environment variables:
- `DATABASE_URL`
- `JWT_SECRET` — long random secret
- `OTP_PEPPER` — different long random secret

Optional:
- `STOCK_FRESH_HOURS` (default `24`)
- Twilio variables for real OTP SMS
- `PGSSL=true` when your managed PostgreSQL requires TLS
- `TRUST_PROXY=true` only when the app is behind a correctly configured trusted reverse proxy

The server intentionally fails fast if the database, JWT secret, or OTP pepper is missing.
