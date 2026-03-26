part of 'random_color_cubit.dart';

@immutable
class RandomColorState {
  final BackgroundColorEntity color;
  final List<BackgroundColorEntity> history;
  final ColorLockEntity locks;

  late final bool isDark = color.isDark;
  late final Color contentColor = isDark ? Colors.white : Colors.black;

  RandomColorState({
    required this.color,
    this.history = const [],
    this.locks = const ColorLockEntity(),
  });

  factory RandomColorState.initial() {
    return RandomColorState(
      color: const BackgroundColorEntity(r: 255, g: 255, b: 255),
    );
  }

  RandomColorState copyWith({
    BackgroundColorEntity? color,
    List<BackgroundColorEntity>? history,
    ColorLockEntity? locks,
  }) {
    return RandomColorState(
      color: color ?? this.color,
      history: history ?? this.history,
      locks: locks ?? this.locks,
    );
  }
}
