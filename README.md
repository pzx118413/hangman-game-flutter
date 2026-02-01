# 🎮 Hangman Game (Flutter)

A mobile Hangman game built with **Flutter**, featuring custom UI, sound effects, background music, categories, and classic hangman gameplay.

---

## 📱 Features

- 🎨 **Custom-designed UI** based on wireframes
- 🧠 **Multiple categories**
  - Animals
  - Fruits
  - Countries
  - Sports
  - Technology
- ☠️ **Progressive hangman drawing** (body parts per wrong guess)
- 🎵 **Background music** (made in FL Studio)
- 🔊 **Sound effects**
  - Win sound
  - Lose sound
- ⚙️ **Settings screen**
  - Toggle music ON/OFF
  - Toggle sound effects ON/OFF
- 🟢 **Win screen**
- 🔴 **Lose screen**
- 📱 Fully playable on mobile devices

---

## 🛠️ Tech Stack

- **Flutter** (Dart)
- **audioplayers** package for music & sound effects
- Custom image assets (PNG)
- Custom audio assets (MP3)

---

## 📂 Project Structure
lib/
│
├── main.dart
├── sound_manager.dart
│
├── data/
│ └── word_data.dart
│
├── screens/
│ ├── start_screen.dart
│ ├── category_screen.dart
│ ├── game_screen.dart
│ ├── settings_screen.dart
│ ├── win_screen.dart
│ └── lose_screen.dart
│
assets/
├── images/
│ ├── hanging.png
│ ├── hangman body parts (Line1–Line11, Ellipse2)
│ ├── UI buttons and backgrounds
│
├── audio/
│ └── background.mp3
│
└── sounds/
├── correct-472358.mp3
└── misery-474083.mp3

