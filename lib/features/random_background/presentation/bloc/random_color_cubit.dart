import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_color/core/services/clipboard_service.dart';
import 'package:test_color/features/random_background/domain/entities/background_color_entity.dart';
import 'package:test_color/features/random_background/domain/entities/color_lock_entity.dart';
import 'package:test_color/features/random_background/domain/usecases/change_bg_color_use_case.dart';

part 'random_color_state.dart';

class RandomColorCubit extends Cubit<RandomColorState> {
  final ChangeBgColorUseCase _getRandomColor;
  final ClipboardService _clipboard;

  RandomColorCubit(this._getRandomColor, this._clipboard)
    : super(
        RandomColorState.initial(),
      );

  void changeColor() {
    final newColor = _getRandomColor.execute(
      current: state.color,
      locks: state.locks,
    );

    final newHistory = [state.color, ...state.history].take(10).toList();
    emit(state.copyWith(color: newColor, history: newHistory));
  }

  void toggleLock(String channel) {
    switch (channel) {
      case 'R':
        emit(state.copyWith(locks: state.locks.copyWith(r: !state.locks.r)));
      case 'G':
        emit(state.copyWith(locks: state.locks.copyWith(g: !state.locks.g)));
      case 'B':
        emit(state.copyWith(locks: state.locks.copyWith(b: !state.locks.b)));
    }
  }

  void selectFromHistory(BackgroundColorEntity color) {
    emit(state.copyWith(color: color));
  }

  void updateOpacity(double newOpacity) {
    emit(state.copyWith(color: state.color.copyWith(opacity: newOpacity)));
  }

  Future<void> copyHexToClipboard() async {
    await _clipboard.copy(state.color.hexCode);
  }
  Future<void> copyRgbToClipboard() async {
    await _clipboard.copy(state.color.rgbCode);
  }
}
