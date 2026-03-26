import 'dart:math';

import 'package:test_color/features/random_background/domain/entities/background_color_entity.dart';
import 'package:test_color/features/random_background/domain/repositories/color_repository.dart';

class ColorRepositoryImpl implements ColorRepository {
  final Random _random = Random();

  @override
  BackgroundColorEntity getRandomColor() {
    return BackgroundColorEntity(
      r: _random.nextInt(256),
      g: _random.nextInt(256),
      b: _random.nextInt(256),
    );
  }
}
