part of '../pages/random_background_screen.dart';

class ChannelLockWidget extends StatelessWidget {
  final String label;
  final bool isLocked;

  const ChannelLockWidget({
    required this.label,
    required this.isLocked,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.select((RandomColorCubit c) => c.state.isDark);
    final color = isDark ? Colors.white : Colors.black;

    return Column(
      children: [
        Text(
          label,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: Icon(isLocked ? Icons.lock : Icons.lock_open, color: color),
          onPressed: () => context.read<RandomColorCubit>().toggleLock(label),
        ),
      ],
    );
  }
}
