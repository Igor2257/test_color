part of '../pages/random_background_screen.dart';

class OpacitySlider extends StatelessWidget {
  const OpacitySlider({super.key});

  @override
  Widget build(BuildContext context) {
    final opacity = context.select(
      (RandomColorCubit c) => c.state.color.opacity,
    );
    final contentColor = context.select(
          (RandomColorCubit c) => c.state.contentColor,
    );

    return Row(
      children: [
        Icon(Icons.opacity, color: contentColor),
        Expanded(
          child: Slider(
            value: opacity,
            activeColor: contentColor,
            onChanged: (val) =>
                context.read<RandomColorCubit>().updateOpacity(val),
          ),
        ),
        Text(
          '${(opacity * 100).toInt()}%',
          style: TextStyle(color: contentColor),
        ),
      ],
    );
  }
}
