# VELA

**Catch every thought. Push every action.**

VELA is an idea for an AI layer on your phone: you share a thought, link, voice note or screenshot to VELA from any app, it works out what you meant, and it sends the action to the right place, such as Google Calendar, Gmail or Notion. It is designed for East Africa, with KES pricing and M-Pesa in mind.

This monorepo holds the marketing site and an early prototype of the Android/iOS app.

| | |
|---|---|
| Website | [velaxyz.vercel.app](https://velaxyz.vercel.app) |
| App | Prototype, version 0.1.0 (APK under [Releases](https://github.com/ken-muritu/vela/releases)) |
| Standalone landing page | [ken-muritu/velanoah](https://github.com/ken-muritu/velanoah) |

## Status

**The app is a UI prototype, not the finished product.** What's built:

- Screens for onboarding, home, capture, integrations and settings, with VELA's own theme and animations.
- The Android manifest registers VELA as a share target for text and images, so it appears in the share sheet.
- Onboarding completion is saved on the device.

Not built yet:

- Reading shared content: the `receive_sharing_intent` package is a dependency, but the app doesn't call it yet.
- Intent detection is a keyword match (`_mockResult` in `capture_screen.dart`), not an AI model.
- The home feed shows sample items, and integrations are on/off toggles. Nothing is sent to Calendar, Gmail or Notion, and nothing is stored.

## Repository layout

### `website/`: marketing site and waitlist

- Next.js 16, React, Tailwind CSS v4, Framer Motion
- Sections: hero, problem, features, how it works, pricing, APK download, waitlist
- `POST /api/waitlist` validates the email and stores it in a `waitlist.json` file. That works locally, but serverless hosts such as Vercel don't keep files between requests, so a real deployment needs a database behind this route.

```bash
cd website
npm install
npm run dev
```

### `mobile_app/`: Flutter app

- Flutter 3.41 / Dart 3.11, `go_router`, `receive_sharing_intent`, `shared_preferences`, `flutter_animate`
- Android package `app.getvela.vela`. Release builds are signed with the debug key for now.

```bash
cd mobile_app
flutter pub get
flutter run
```

### CI

`.github/workflows/flutter-build.yml` runs `flutter analyze`, then builds a release APK and an app bundle on pushes and pull requests to `main`, and uploads both as workflow artifacts.

## Licence

Copyright © 2026 Kennedy Muritu. All rights reserved. The code is public to read, not to reuse. See [LICENSE](LICENSE).
