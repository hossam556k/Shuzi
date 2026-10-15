# Shuzi 数

A SwiftUI app that teaches **Chinese numbers from 1 to 99** through a short, fun quiz. Hear each number spoken aloud, see its characters and pinyin, and pick the right answer.

<!-- Add screenshots here, for example:
<p align="center">
  <img src="Screenshots/startup.png" width="250">
  <img src="Screenshots/game.png" width="250">
  <img src="Screenshots/game-over.png" width="250">
</p>
-->

## Features

- **Number quiz**: each round has 10 questions. A Chinese number appears, and you choose the correct value from four options.
- **Spoken pronunciation**: every number is read aloud in Chinese using `AVSpeechSynthesizer`. Tap the speaker button to hear it again.
- **Pinyin toggle**: show or hide the pinyin to test yourself. The app remembers your choice.
- **Live progress**: a progress bar tracks your question count and accuracy as you play.
- **Results screen**: see your score, percentage, and a rating from "Keep practicing" to "Outstanding", then play again or go home.
- **Daily Wisdom**: the home screen shows a random Chinese proverb with pinyin and English translation, loaded from an online API. Tap the proverb or translation to hear it. If the network fails, a built-in proverb is shown instead.
- **Adaptive layout**: larger text and spacing on iPad, with adjustments for visionOS.

## How It Works

1. Open the app and read the proverb of the day.
2. Tap **Start Learning**.
3. Listen to the number, read the characters, and pick the matching value.
4. After 10 questions, check your result and try to beat it.

## Built With

- **SwiftUI** with `NavigationStack` and `.sheet` presentation
- **MVVM** architecture using the `@Observable` macro
- **AVFoundation** (`AVSpeechSynthesizer`) for Chinese and English text-to-speech
- **async/await** with `URLSession` for fetching proverbs
- **Codable** for decoding the API response
- `@AppStorage` for saving user preferences

## Project Structure

```
Shuzi/
├── Model/
│   ├── Option.swift              # A number with its characters and pinyin
│   ├── GameData.swift            # Generates numbers 1–99 in Chinese and pinyin
│   └── ProverModel.swift         # Proverb data from the API
├── ViewModel/
│   ├── GameViewModel.swift       # Quiz logic, score and questions
│   └── StartupViewModel.swift    # Fetches the daily proverb
├── Speech/
│   └── SpeechManager.swift       # Text-to-speech in Chinese and English
├── Extenstion/
│   ├── Destination.swift         # Navigation routes
│   └── UiDevice.swift            # Platform checks
└── View/
    ├── Startup Views/            # Home screen, title, proverb card, start button
    └── Game View/                # Quiz grid, number display, progress, results
```

## Requirements

- iOS 26.5+
- Xcode 26.5+
- An internet connection for the daily proverb (optional)

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/hossam556k/Shuzi.git
   ```
2. Open `Shuzi.xcodeproj` in Xcode.
3. Choose a simulator or your iPhone and press **Run** (Cmd + R).

> For the best pronunciation, make sure a Chinese voice is installed on the device:
> **Settings > Accessibility > Spoken Content > Voices > Chinese**.

## API

Daily proverbs come from the [Chinese Proverbs API](https://chinese-proverbs.onrender.com/api/proverbs/random).

## Roadmap

- [ ] Show whether each answer was right or wrong before moving on
- [ ] Choose difficulty (1–10, 1–99, or larger numbers)
- [ ] Track best scores over time

## Author

**Hossam Osama** · [@hossam556k](https://github.com/hossam556k)
