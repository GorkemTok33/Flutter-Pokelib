import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:palette_generator/palette_generator.dart';

class DominatColorFinder {
  late int timeOut;

  Future<Color?> getDominatColor(String source, {timeOut = 15}) async {
    Color? dominatColor;
    this.timeOut = timeOut;
    try {
      await PaletteGenerator.fromImageProvider(
              CachedNetworkImageProvider(source),
              timeout: Duration(seconds: this.timeOut))
          .then((value) {
        if (value.dominantColor != null) {
          dominatColor = value.dominantColor!.color;
        }
        if (kDebugMode) {
          print("Dominat Color: $dominatColor");
        }
      });
    } catch (e) {
      debugPrintStack();
    }
    return dominatColor;
  }
}
