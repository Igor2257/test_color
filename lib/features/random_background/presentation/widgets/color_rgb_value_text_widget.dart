part of '../pages/random_background_screen.dart';

class ColorRgbValueTextWidget extends StatelessWidget {
  const ColorRgbValueTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final rgb = context.select((RandomColorCubit c) => c.state.color.rgbCode);

    final contentColor = context.select(
      (RandomColorCubit c) => c.state.contentColor,
    );
    return InkWell(
      onTap: ()async{
        await context.read<RandomColorCubit>().copyHexToClipboard();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Copied $rgb to clipboard!'),
              duration: const Duration(seconds: 1),
            ),
          );
        }
      },
      child: Text(
        rgb,
        style: TextStyle(color: contentColor, fontSize: 14),
      ),
    );
  }
}
