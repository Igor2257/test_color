import 'package:test_color/features/random_background/domain/entities/background_color_entity.dart';

abstract interface class ColorRepository {
  BackgroundColorEntity getRandomColor();
}
