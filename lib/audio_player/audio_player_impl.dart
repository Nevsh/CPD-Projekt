import 'package:audioplayers/audioplayers.dart';

import 'audio_player_interface.dart';

class AudioPlayerImpl implements AudioPlayerInterface {
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void play(String path) {
    audioPlayer.play(AssetSource(path));
  }
}
