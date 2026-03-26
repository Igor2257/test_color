part of '../pages/random_background_screen.dart';

class ColorValuesDisplayWidget extends StatelessWidget {
  const ColorValuesDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ColorHexValueTextWidget(),
        ColorRgbValueTextWidget(),
      ],
    );
  }
}
