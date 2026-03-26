import 'package:test_color/features/random_background/domain/entities/background_color_entity.dart';
import 'package:test_color/features/random_background/domain/entities/color_lock_entity.dart';
import 'package:test_color/features/random_background/domain/repositories/color_repository.dart';

class ChangeBgColorUseCase {
  final ColorRepository repository;

  const ChangeBgColorUseCase(this.repository);

  BackgroundColorEntity execute({
    required BackgroundColorEntity current,
    required ColorLockEntity locks,
  }) {
    final randomColor = repository.getRandomColor();

    return BackgroundColorEntity(
      r: locks.r ? current.r : randomColor.r,
      g: locks.g ? current.g : randomColor.g,
      b: locks.b ? current.b : randomColor.b,
      opacity: current.opacity,
    );
  }
}
