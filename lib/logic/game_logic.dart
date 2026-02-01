/*
class HangmanGame {
  final String word;
  final int maxLives = 6;

  int lives = 6;
  final List<String> guessed = [];

  HangmanGame(this.word);

  void guess(String letter) {
    letter = letter.toUpperCase();
    if (guessed.contains(letter)) return;

    guessed.add(letter);
    if (!word.contains(letter)) {
      lives--;
    }
  }

  bool get hasWon =>
      word.split('').every((l) => guessed.contains(l));

  bool get hasLost => lives <= 0;

  String get displayWord {
    return word
        .split('')
        .map((l) => guessed.contains(l) ? "$l " : "_ ")
        .join();
  }
}

 */

