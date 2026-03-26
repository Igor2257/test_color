part of '../pages/random_background_screen.dart';

class ColorInfoPanel extends StatelessWidget {
  const ColorInfoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.select((RandomColorCubit c) => c.state.color.isDark);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.black26 : Colors.white24,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ColorValuesDisplayWidget(),
          SizedBox(height: 16),
          OpacitySlider(),
        ],
      ),
    );
  }
}
