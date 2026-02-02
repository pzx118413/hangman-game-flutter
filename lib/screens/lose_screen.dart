import 'package:flutter/material.dart';
import '../sound_manager.dart';

class LoseScreen extends StatefulWidget {
  const LoseScreen({super.key});

  @override
  State<LoseScreen> createState() => _LoseScreenState();
}
class _LoseScreenState extends State<LoseScreen> {
  @override
  void initState() {
    super.initState();
    SoundManager.playLose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade400,
      body: Stack(
        children: [
          // YOU LOST
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/deadface.png',
                  height: 120,
                ),
                const SizedBox(height: 20),
                const Text(
                  'YOU LOST!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // TRY AGAIN
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Property1=Default.png',
                        height: 50,
                      ),
                      const Text(
                        'TRY AGAIN',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.popUntil(context, (r) => r.isFirst);
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
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
