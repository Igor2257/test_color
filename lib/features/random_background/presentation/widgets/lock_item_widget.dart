part of '../pages/random_background_screen.dart';

class LockItemWidget extends StatelessWidget {
  final String label;

  const LockItemWidget({required this.label});

  @override
  Widget build(BuildContext context) {
    final isLocked = context.select((RandomColorCubit c) {
      if (label == 'R') return c.state.locks.r;
      if (label == 'G') return c.state.locks.g;
      return c.state.locks.b;
    });

    return ChannelLockWidget(label: label, isLocked: isLocked);
  }
}
