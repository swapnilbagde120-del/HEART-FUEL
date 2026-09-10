# HEART FUEL API contract

Base path: `/v1` (HTTPS only in production).

## Auth
- `POST /auth/request-otp` — `{ phone }` E.164. OTP is sent by the configured SMS provider. Rate limited.
- `POST /auth/verify-otp` — `{ phone, otp }` -> short-lived Bearer access token. Max 5 verification attempts per challenge.

Required server secrets: `DATABASE_URL`, `JWT_SECRET`, `OTP_PEPPER`.

## Stock
- `GET /stock?blood_group=&component=` — fresh verified inventory only. Freshness is controlled by `STOCK_FRESH_HOURS` (default 24).
- `GET /stock/nearby?latitude=&longitude=&radius_km=&blood_group=&component=` — fresh verified inventory sorted by distance.

## Emergency requests (authenticated)
- `GET /emergency-requests` — request history for the signed-in requester.
- `GET /emergency-requests/{id}` — request details + audit events.
- `POST /emergency-requests` — `{ blood_group, component, units_needed, consent_location, latitude?, longitude? }`. With location consent, nearby fresh matching centres are found and notified; status becomes `MATCHED` when a match exists.
- `POST /emergency-requests/{id}/cancel` — requester can cancel `OPEN` or `MATCHED` requests. Audit event records the real previous status.

## Blood-centre workflow (authenticated centre owner)
- `GET /centre/requests` — open/matched requests relevant to the owner's verified centre.
- `POST /centre/requests/{id}/accept` — accepts an open/matched request and writes an audit event.

## Notifications (authenticated)
- `GET /notifications` — notifications for the signed-in user.
- `POST /notifications/{id}/read` — mark one notification read.

## Important production notes
- Blood-centre records and stock must be populated by a trusted/admin onboarding process.
- Stock is not considered usable unless the centre is verified and stock was verified recently.
- Location is optional and is stored only when the requester explicitly consents.
- This API does not claim clinical compatibility; it coordinates inventory and emergency requests.
