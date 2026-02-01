import 'package:flutter/material.dart';
import 'game_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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

          // CENTER PANEL
          Center(
            child: Image.asset(
              'assets/images/InnerRectangleChooseCategory.png',
              width: 330,
            ),
          ),

          // TITLE
          Positioned(
            top: 140,
            left: 0,
            right: 0,
            child: const Center(
              child: Text(
                'CHOOSE CATEGORY',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          // CATEGORY BUTTONS
          Positioned(
            top: 210,
            left: 0,
            right: 0,
            child: Column(
              children: [
                _categoryButton(
                  image: 'assets/images/Property1=Brown.png',
                  label: 'ANIMALS',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GameScreen(category: 'ANIMALS'),
                      ),
                    );
                  },

                ),
                const SizedBox(height: 12),
                _categoryButton(
                  image: 'assets/images/Property1=Orange.png',
                  label: 'FRUITS',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GameScreen(category: 'FRUITS'),
                      ),
                    );
                  },

                ),
                const SizedBox(height: 12),
                _categoryButton(
                  image: 'assets/images/Property1=Yellow.png',
                  label: 'COUNTRIES',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GameScreen(category: 'COUNTRIES'),
                      ),
                    );
                  },

                ),
                const SizedBox(height: 12),
                _categoryButton(
                  image: 'assets/images/Property1=Blue.png',
                  label: 'SPORTS',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GameScreen(category: 'SPORTS'),
                      ),
                    );
                  },

                ),
                const SizedBox(height: 12),
                _categoryButton(
                  image: 'assets/images/Property1=Purple.png',
                  label: 'TECHNOLOGY',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GameScreen(category: 'TECHNOLOGY'),
                      ),
                    );
                  },

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Reusable category button
  static Widget _categoryButton({
    required String image,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            image,
            height: 45,
          ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
