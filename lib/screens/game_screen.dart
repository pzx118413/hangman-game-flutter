import 'package:flutter/material.dart';
import '../data/word_data.dart';
import '../sound_manager.dart';
import 'win_screen.dart';
import 'lose_screen.dart';

class GameScreen extends StatefulWidget {
  final String category;

  const GameScreen({super.key, required this.category});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late String word;
  late List<String> guessedLetters;
  int lives = 6;
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    word = WordData.getRandomWord(widget.category);
    guessedLetters = [];
  }

  void guessLetter(String letter) {
    if (gameOver || guessedLetters.contains(letter) || lives <= 0) return;

    setState(() {
      guessedLetters.add(letter);
      if (!word.contains(letter)) {
        lives--;
      }
    });

    checkGameState();
  }

  String get maskedWord {
    return word
        .split('')
        .map((letter) => guessedLetters.contains(letter) ? letter : '_')
        .join(' ');
  }

  void checkGameState() {
    // win
    if (!maskedWord.contains('_')) {
      gameOver = true;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const WinScreen()),
      );
      return;
    }

    // lose
    if (lives <= 0) {
      gameOver = true;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoseScreen()),
      );
    }
  }

  /// BUILDS THE HANGMAN USING PARTS
  Widget buildHangman() {
    int wrongGuesses = 6 - lives;

    return SizedBox(
      width: 260,
      height: 300,
      child: Stack(
        children: [
          // HANGING PLACE (BACKGROUND)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/hanging.png',
              width: 240,
              fit: BoxFit.contain,
            ),
          ),

          // HEAD
          if (wrongGuesses >= 1)
            Positioned(
              top: 70,
              left: 120,
              child: Image.asset('assets/images/Ellipse2.png'),
            ),

          // BODY
          if (wrongGuesses >= 2)
            Positioned(
              top: 110,
              left: 130,
              child: Image.asset('assets/images/Line7.png'),
            ),

          // LEFT ARM
          if (wrongGuesses >= 3)
            Positioned(
              top: 120,
              left: 110,
              child: Image.asset('assets/images/Line8.png'),
            ),

          // RIGHT ARM
          if (wrongGuesses >= 4)
            Positioned(
              top: 120,
              left: 145,
              child: Image.asset('assets/images/Line9.png'),
            ),

          // LEFT LEG
          if (wrongGuesses >= 5)
            Positioned(
              top: 170,
              left: 120,
              child: Image.asset('assets/images/Line10.png'),
            ),

          // RIGHT LEG
          if (wrongGuesses >= 6)
            Positioned(
              top: 170,
              left: 145,
              child: Image.asset('assets/images/Line11.png'),
            ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Text(
              widget.category,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            buildHangman(),

            const SizedBox(height: 30),

            Text(
              maskedWord,
              style: const TextStyle(
                fontSize: 28,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 30),

            // LETTER BUTTONS
            Expanded(
              child: GridView.count(
                crossAxisCount: 7,
                padding: const EdgeInsets.all(16),
                children: List.generate(26, (index) {
                  final letter =
                  String.fromCharCode(65 + index).toLowerCase();

                  final alreadyGuessed =
                  guessedLetters.contains(letter);

                  final disabled = alreadyGuessed || gameOver;

                  return GestureDetector(
                    onTap: disabled ? null : () => guessLetter(letter),
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: disabled ? Colors.grey : Colors.blue,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          letter.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
