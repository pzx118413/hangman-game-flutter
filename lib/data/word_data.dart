import 'dart:math';

class WordData {
  static final Map<String, List<String>> categories = {
    'ANIMALS': [
      'elephant',
      'giraffe',
      'kangaroo',
      'dolphin',
      'penguin',
      'tiger',
      'rabbit',
      'hamster',
      'cheetah',
      'tortoise',
    ],
    'FRUITS': [
      'apple',
      'banana',
      'orange',
      'mango',
      'papaya',
      'pineapple',
      'grape',
      'peach',
      'cherry',
      'lemon',
    ],
    'COUNTRIES': [
      'canada',
      'brazil',
      'germany',
      'france',
      'italy',
      'spain',
      'japan',
      'india',
      'egypt',
      'mexico',
    ],
    'SPORTS': [
      'football',
      'cricket',
      'tennis',
      'basketball',
      'volleyball',
      'badminton',
      'hockey',
      'baseball',
      'cycling',
      'swimming',
    ],
    'TECHNOLOGY': [
      'computer',
      'keyboard',
      'monitor',
      'internet',
      'software',
      'hardware',
      'database',
      'network',
      'android',
      'programming',
    ],
  };

  static String getRandomWord(String category) {
    final words = categories[category]!;
    final random = Random();
    return words[random.nextInt(words.length)];
  }
}
