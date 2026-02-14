# VoiceMint

VoiceMint is a powerful iOS utility designed for **Text-to-Speech (TTS)** and **Optical Character Recognition (OCR)**. It enables users to convert manual text input, images, and PDF documents into high-quality audio files, enhancing productivity and accessibility.

## �� Features

- **Text-to-Speech (TTS)**: Instant conversion of manual text into natural-sounding speech.
- **OCR (Image to Text)**: Extract text from photos or camera captures using the Vision framework.
- **PDF reader**: Import and listen to PDF documents effortlessly.
- **Audio Export**: Render speech directly to `.wav` files for offline listening.
- **History Management**: Automatically save and manage your converted audio clips.
- **Customizable Playback**: Adjustable speech rate and pitch to suit user preferences.

## �� Code Structure & Architecture

The project follows a clean **MVC (Model-View-Controller)** pattern, ensuring a separation of concerns between data management, user interface, and business logic.

### Directory Organization

```text
VoiceMint/
├── VoiceMint/
│   ├── Controllers/         # ViewControllers (Home, History, Settings, etc.)
│   ├── Models/              # CoreData models and Swift data structures
│   ├── Views/               # Storyboards, XIBs, and custom UI components
│   ├── Helpers/             # Utility extensions and helper classes
│   └── Resources/           # Assets, fonts, and property lists
├── Pods/                    # External dependencies
└── VoiceMint.xcworkspace    # Main workspace file
```

### Key Components

- **Controllers**:
  - `HomeVC`: Central hub for text input, image selection, and PDF importing.
  - `HistoryVC`: Manages saved audio records stored in CoreData.
  - `SettingsVC`: Handles user preferences like language and speech dynamics.
- **Logic & Services**:
  - `SpeechToFileRenderer`: A high-level wrapper around `AVSpeechSynthesizer` for rendering speech to files.
  - `Vision API`: Utilized for high-accuracy text recognition in images.
- **Data Persistence**:
  - `CoreData`: Used to store converted text, file URLs, and metadata (`VoiceData.xcdatamodel`).

## �� Tech Stack

- **Platform**: iOS 15.0+
- **Language**: Swift
- **UI Framework**: UIKit
- **Frameworks**:
  - `AVFoundation` (Audio processing & TTS)
  - `Vision` (OCR/Text Recognition)
  - `PDFKit` (Document handling)
  - `CoreData` (Local storage)
- **Dependency Manager**: CocoaPods

## ⚙️ Installation & Setup

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd VoiceMint
   ```

2. **Install Dependencies**: Ensure you have CocoaPods installed, then run:
   ```bash
   pod install
   ```

3. **Open Workspace**: Always open `VoiceMint.xcworkspace` to work on the project.

4. **Run**: Select a simulator or physical device and press `Cmd + R` in Xcode.

---
