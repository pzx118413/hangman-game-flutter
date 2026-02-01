import 'package:audioplayers/audioplayers.dart';

class SoundManager {
  // MUSIC
  static final AudioPlayer _musicPlayer = AudioPlayer();
  static bool musicOn = true;

  // SOUND EFFECTS
  static final AudioPlayer _sfxPlayer = AudioPlayer();
  static bool sfxOn = true;

  // Music done by Z.Musielak in FL Studio (fun fact)
  static Future<void> playMusic() async {
    if (!musicOn) return;

    await _musicPlayer.setReleaseMode(ReleaseMode.loop);
    await _musicPlayer.play(
      AssetSource('audio/hangmanmusic.mp3'),
      volume: 0.6,
    );
  }

  static Future<void> stopMusic() async {
    await _musicPlayer.stop();
  }

  static void toggleMusic() {
    musicOn = !musicOn;
    if (musicOn) {
      playMusic();
    } else {
      stopMusic();
    }
  }

  // Sound effects from pixabay
  static void toggleSfx() {
    sfxOn = !sfxOn;
  }

  static Future<void> playWin() async {
    if (!sfxOn) return;
    await _sfxPlayer.play(
      AssetSource('sounds/correct-472358.mp3'),
      volume: 1.0,
    );
  }

  static Future<void> playLose() async {
    if (!sfxOn) return;
    await _sfxPlayer.play(
      AssetSource('sounds/misery-474083.mp3'),
      volume: 1.0,
    );
  }
}
