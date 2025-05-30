# islami

A Flutter application providing Islamic resources and utilities, including Quran reading, Hadith collection, digital Sebha (prayer beads), Islamic radio streaming, and customizable settings (theme and language).

## Features

- **Quran:**  
  - Browse all Surahs (chapters) of the Quran.
  - View Surah details and content.

- **Hadith:**  
  - Access a collection of Hadiths.
  - Read Hadith details, loaded from local assets.

- **Sebha (Tasbeeh):**  
  - Digital prayer beads counter.
  - Rotate and count Tasbeeh, with automatic phrase switching.

- **Radio:**  
  - Stream Islamic radio stations.
  - Fetches radio data dynamically based on selected language.

- **Settings:**  
  - Switch between light and dark themes.
  - Change app language (English/Arabic).
  - Preferences are saved locally.

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Dart SDK (included with Flutter)
- A device or emulator (Android, iOS, Windows, macOS, Linux)

### Installation

1. **Clone the repository:**
   ```bash
   git clone <your-repo-url>
   cd islami
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

## Project Structure

- `lib/`
  - `main.dart` - App entry point, theme and localization setup.
  - `ui/` - UI components and screens.
  - `quran/` - Quran features and widgets.
  - `hadeth/` - Hadith features and widgets.
  - `sebha/` - Sebha (Tasbeeh) feature.
  - `radio/` - Radio streaming feature.
  - `settings/` - Settings and customization.
  - `providers/` - State management (theme, locale).
  - `models/` - Data models (e.g., radio).
- `assets/`
  - `images/` - App images and icons.
  - `files/` - Quran and Hadith text files.

## Dependencies

- `provider` - State management
- `google_fonts` - Custom fonts
- `shared_preferences` - Local storage for settings
- `http` - Network requests (for radio)
- `audioplayers` - Audio streaming
- `flutter_localizations`, `intl` - Localization support

## Localization

- Supports English and Arabic.
- Easily switch languages from the settings tab.

## Theming

- Light and dark themes available.
- Theme preference is saved and restored on app restart.

## Assets

- Quran and Hadith texts are stored in `assets/files/`.
- Images and icons are in `assets/images/`.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

*(Specify your license here, e.g., MIT, Apache 2.0, etc.)*
