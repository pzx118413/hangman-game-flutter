import 'sound_manager.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'screens/settings_screen.dart';
import 'screens/category_screen.dart';


void main() {
  runApp(const HangmanApp());
}

class HangmanApp extends StatelessWidget {
  const HangmanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hangman Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const StartScreen(),
    );
  }
}

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  @override
  void initState() {
    super.initState();
    SoundManager.playMusic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double height = constraints.maxHeight;

            return Stack(
              children: [
                // Bottom green shape (BACKGROUND)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/Subtract.png',
                    height: height * 0.35,
                    fit: BoxFit.cover,
                  ),
                ),

                // Big hangman emerging from green shape
                Positioned(
                  bottom: 180,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      'assets/images/frontscreendrawing.png',
                      height: 360,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Buttons on green shape
                Positioned(
                  bottom: 70,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      // PLAY button
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CategoryScreen(),
                            ),
                          );
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Property1=Default.png',
                              height: 50,
                            ),
                            const Text(
                              'PLAY',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),


                      const SizedBox(height: 12),

                      // QUIT button
                      GestureDetector(
                        onTap: () {
                          SystemNavigator.pop();
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Property1=Quit.png',
                              height: 50,
                            ),
                            const Text(
                              'QUIT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),



                    ],
                  ),
                ),

                // Title + settings (TOP LAYER)
                Column(
                  children: [
                    const SizedBox(height: 20),

                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SettingsScreen(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/images/Component1.png',
                            height: 28,
                          ),
                        ),

                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'HANGMAN GAME',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
