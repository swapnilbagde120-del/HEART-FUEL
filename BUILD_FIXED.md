# HEART FUEL v1.3.1 — Build/Run Checklist

## Android
1. Install JDK 17 and Android SDK 35.
2. Open the project in Android Studio and let Gradle sync.
3. If using terminal: `./gradlew :app:assembleDebug`.
4. Emulator: default API URL is `http://10.0.2.2:8080/v1`.
5. Physical phone: use `-PAPI_BASE_URL=http://<PC-LAN-IP>:8080/v1`.

## Backend
1. Copy `backend/.env.example` to `backend/.env`.
2. Set `JWT_SECRET` and `OTP_PEPPER` to long random values.
3. Add Twilio credentials for real SMS OTP.
4. Run `cd backend && docker compose up -d`.
5. Check `http://localhost:8080/health`.

## Important
This archive is source code; it does not contain a prebuilt APK. A prebuilt APK requires a successful Android/Gradle build on a machine or CI runner with the Android/Gradle dependencies available.
