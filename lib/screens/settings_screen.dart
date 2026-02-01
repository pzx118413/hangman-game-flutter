import 'package:flutter/material.dart';
import '../sound_manager.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // BACKGROUND
          Positioned.fill(
            child: Image.asset(
              'assets/images/BackgroundChooseCategory.png',
              fit: BoxFit.cover,
            ),
          ),

          // SETTINGS PANEL IMAGE
          Center(
            child: Image.asset(
              'assets/images/InnerRectangleSettings.png',
              width: 320,
            ),
          ),

          // TITLE
          Positioned(
            top: 140,
            left: 0,
            right: 0,
            child: const Center(
              child: Text(
                'SETTINGS',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          // MUSIC TOGGLE
          Positioned(
            top: 230,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const Text(
                  'MUSIC',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      SoundManager.toggleMusic();
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      SoundManager.musicOn ? 'ON' : 'OFF',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // SOUND EFFECTS TOGGLE
          Positioned(
            top: 320,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const Text(
                  'SOUND EFFECTS',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      SoundManager.toggleSfx();
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      SoundManager.sfxOn ? 'ON' : 'OFF',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // BUTTONS (REPLAY / QUIT)
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // REPLAY
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
                        'REPLAY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // QUIT
                GestureDetector(
                  onTap: () {
                    SoundManager.stopMusic();
                    Navigator.popUntil(context, (route) => route.isFirst);
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
        ],
      ),
    );
  }
}
