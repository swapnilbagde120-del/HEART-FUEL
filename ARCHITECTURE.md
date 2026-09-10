# HEART FUEL — Production Architecture

Clean Android starter for a blood-donation/blood-bank workflow.

Production integrations:
- OTP authentication and role-based access
- Verified hospitals, blood centers and donors
- PostgreSQL/Supabase or Firebase
- Realtime requests/status
- Google Maps or Mapbox routing
- FCM notifications
- Encrypted sensitive documents
- Audit logs, rate limiting and duplicate detection
- Authorized blood-stock source with last-verified timestamp

Safety:
- Do not invent live blood stock, locations, ETA or verification.
- Donation is not arbitrary consumer sale; show only official charges where applicable.
- Preserve traceability and unique identifiers.
- AI must not make clinical/transfusion decisions.
