# Triolingo

Triolingo is a cross-platform mobile application designed to enhance English language learning. Built with **Flutter**, it focuses on vocabulary acquisition through interactive methods like flashcards, multiple-choice questions, and word typing exercises. It also offers a competitive ranking system to motivate users and allows the creation and sharing of personalized vocabulary lists.

---

## Features

### Core Functionalities:
- **Account Management:** Register, login, reset/change passwords, and update personal information.
- **Vocabulary Management:** 
  - Create and organize custom vocabulary lists under topics and folders.
  - Set visibility (private or public) for personalized content sharing.
  - **Show All:** View a complete list of topics, folders, and vocabulary in one unified interface for easy access and management.
- **Learning Modes:**
  - Flashcards for interactive learning.
  - Multiple-choice questions and word typing with scoring and leaderboards.
- **Community Features:**
  - View and participate in public topics.
  - Compete in rankings based on scores and completion time.

### Technologies Used:
- **Frontend:** Flutter
- **Backend Services:** Firebase (Firestore, Authentication, Realtime Database, and Cloud Storage)
- **Libraries:**
  - UI Enhancements: `flutter_slidable`, `cupertino_icons`, `responsive_framework`
  - Interactive Content: `flip_card`, `flutter_tts`, `step_progress_indicator`
  - Utilities: `firebase_auth`, `cached_network_image`, `image_picker`

---

## Other Functionality

Triolingo includes a feature designed to enhance usability:
- **Unified View:** Allows users to see all topics, folders, and vocabulary in a single interface.
- **Search & Filter:** Quickly find specific vocabulary or topics using built-in filters.
- **Comprehensive Insights:** Provides a summary of learning progress, including not-yet-learned, learned, and memorized vocabulary.

This feature ensures efficient navigation and management, making it easier for users to track their learning journey.

---

## Getting Started

### Prerequisites:
- Flutter SDK installed on your system.
- A Firebase project set up with authentication and database configured.

### Installation:
1. Clone the repository:
   ```bash
   git clone https://github.com/phanluonghuy/Triolingo-Flutter.git
   cd Triolingo-Flutter
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Configure Firebase:
   - Add your `google-services.json` for Android and `GoogleService-Info.plist` for iOS.
   - Update the Firebase configuration in the project.

4. Run the app:
   ```bash
   flutter run
   ```

---

## Future Development

Triolingo aims to become a comprehensive English learning platform by adding:
- Grammar lessons, listening, and speaking practice.
- Vocabulary illustrations.
- Support for dark mode.
- Cloud storage for syncing across devices.
- Machine learning for personalized learning experiences.

---

## Some Images from the App

Here are screenshots showcasing the features and design of the Triolingo app:

<img src="https://github.com/user-attachments/assets/dcbc65cd-ff85-4379-809c-83e91546c0fd" alt="Picture6" width="200px">
<img src="https://github.com/user-attachments/assets/9c028395-feb0-4618-b45d-be4b57f3cf4a" alt="Picture5" width="200px">
<img src="https://github.com/user-attachments/assets/0e9bcd0d-8bd3-4f67-bd90-64117464de23" alt="Picture4" width="200px">
<img src="https://github.com/user-attachments/assets/9e7ec5bb-9340-455b-98b7-b4ee577eb136" alt="Picture3" width="200px">
<img src="https://github.com/user-attachments/assets/49fb1641-80e1-44fb-8b66-4bb95b6af9f8" alt="Picture2" width="200px">
<img src="https://github.com/user-attachments/assets/7d7b24cc-b427-466e-beed-2bbd52f81f3d" alt="Picture1" width="200px">
<img src="https://github.com/user-attachments/assets/a596b93c-d673-45d5-834a-4d8f6ac9baab" alt="Picture7" width="200px">
<img src="https://github.com/user-attachments/assets/9480fa8d-38bc-4f8e-8357-b3dded836482" alt="Picture8" width="200px">

