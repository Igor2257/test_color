import 'dart:math' as math;

class BackgroundColorEntity {
  final int r;
  final int g;
  final int b;
  final double opacity;

  const BackgroundColorEntity({
    required this.r,
    required this.g,
    required this.b,
    this.opacity = 1.0,
  });

  BackgroundColorEntity copyWith({double? opacity}) {
    return BackgroundColorEntity(
      r: r,
      g: g,
      b: b,
      opacity: opacity ?? this.opacity,
    );
  }
}

extension AppColorFormatting on BackgroundColorEntity {
  String get hexCode {
    final a = (opacity * 255).toInt().toRadixString(16).padLeft(2, '0');
    final rStr = r.toRadixString(16).padLeft(2, '0');
    final gStr = g.toRadixString(16).padLeft(2, '0');
    final bStr = b.toRadixString(16).padLeft(2, '0');
    return '#$a$rStr$gStr$bStr'.toUpperCase();
  }

  String get rgbCode => 'RGB($r, $g, $b)';

  bool get isDark {
    // Формула яркости: 0.2126R + 0.7152G + 0.114B
    //https://habr.com/ru/articles/304210/
    final rLin = _toLinear(r);
    final gLin = _toLinear(g);
    final bLin = _toLinear(b);

    final luminance = 0.2126 * rLin + 0.7152 * gLin + 0.0722 * bLin;

    return luminance < 0.179;
  }

  double _toLinear(int channel) {
    final c = channel / 255.0;
    return c <= 0.04045
        ? c / 12.92
        : math.pow((c + 0.055) / 1.055, 2.4).toDouble();
  }
}
