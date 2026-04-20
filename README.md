# Mostafa Mahmoud Portfolio (Flutter Web)

A production-ready, bilingual (English + Arabic), responsive personal portfolio website for a Mid-Level Flutter Developer.

## Folder/File Tree

```text
my-portfolio/
├── analysis_options.yaml
├── assets/
│   └── cv/
│       └── Mostafa_Mahmoud_Flutter_Developer.pdf
├── lib/
│   ├── app.dart
│   ├── main.dart
│   ├── data/
│   │   └── portfolio_data.dart
│   ├── l10n/
│   │   └── app_localizations.dart
│   ├── models/
│   │   └── portfolio_models.dart
│   ├── state/
│   │   └── app_settings_controller.dart
│   ├── ui/
│   │   ├── portfolio_page.dart
│   │   ├── sections/
│   │   │   ├── about_section.dart
│   │   │   ├── contact_section.dart
│   │   │   ├── experience_section.dart
│   │   │   ├── footer_section.dart
│   │   │   ├── hero_section.dart
│   │   │   ├── projects_section.dart
│   │   │   └── skills_section.dart
│   │   └── widgets/
│   │       ├── animated_reveal.dart
│   │       ├── portfolio_navbar.dart
│   │       └── section_wrapper.dart
│   └── utils/
│       ├── cv_actions.dart
│       ├── cv_actions_stub.dart
│       ├── cv_actions_web.dart
│       └── link_utils.dart
├── pubspec.yaml
├── test/
│   └── app_smoke_test.dart
└── web/
    └── index.html
```

## Features

- Single-page smooth scrolling layout with sticky navbar
- EN/AR language toggle with persisted selection (`SharedPreferences`)
- RTL support when Arabic is selected
- Light/Dark theme toggle with persistence
- Sections: Home, About, Skills, Projects, Experience, Contact, Footer
- CV support on Web:
  - View CV opens in new tab
  - Download CV downloads file
- Reusable section/widget architecture
- Subtle animations and project hover effect
- Contact form with validation

## Dependencies (Minimal)

- `shared_preferences`: persist language/theme toggle
- `url_launcher`: open social/project links
- `flutter_localizations`: localization support and RTL behavior

## Create / Run / Build Commands

### 1) Create project (if starting from scratch)

```bash
flutter create my-portfolio
cd my-portfolio
```

### 2) Run locally (web)

```bash
flutter pub get
flutter run -d chrome
```

### 3) Build web release

```bash
flutter build web --release
```

## CV Asset Configuration (`pubspec.yaml`)

```yaml
flutter:
  assets:
    - assets/cv/Mostafa_Mahmoud_Flutter_Developer.pdf
```

## Localization Content

Localization is centralized in:
- `lib/l10n/app_localizations.dart` (all visible text keys and EN/AR values)

Editable portfolio content is in:
- `lib/data/portfolio_data.dart` (skills, projects, experience, social links)

## Free Deployment Instructions

### A) GitHub Pages (Main)

1. Build web release:
   ```bash
   flutter build web --release --base-href /my-portfolio/
   ```
2. Copy `build/web` output to `gh-pages` branch (or use GitHub Action).
3. In GitHub repo settings:
   - Pages → Source: `gh-pages` branch root.
4. Open deployed URL:
   - `https://<username>.github.io/my-portfolio/`

### B) Netlify (Alternative)

1. Build:
   ```bash
   flutter build web --release
   ```
2. Drag-and-drop `build/web` into Netlify Deploys,
   or connect repo and set publish dir to `build/web`.
3. Add redirects file if needed for SPA routing.

### C) Vercel (Alternative)

1. Build:
   ```bash
   flutter build web --release
   ```
2. Import project in Vercel.
3. Set output directory to `build/web`.
4. Deploy.

## Ensure CV View/Download Works After Deployment

- Keep CV file at: `assets/cv/Mostafa_Mahmoud_Flutter_Developer.pdf`
- Keep this in `pubspec.yaml` assets.
- CV is served in web build from:
  `assets/assets/cv/Mostafa_Mahmoud_Flutter_Developer.pdf`
- Validate after deploy by clicking both:
  - **View CV** (opens new tab)
  - **Download CV** (downloads PDF)

## Notes

Replace placeholder links/content in `lib/data/portfolio_data.dart` with your real data.
