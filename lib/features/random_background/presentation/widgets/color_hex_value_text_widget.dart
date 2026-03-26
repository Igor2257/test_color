part of '../pages/random_background_screen.dart';

class ColorHexValueTextWidget extends StatelessWidget {
  const ColorHexValueTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final hex = context.select((RandomColorCubit c) => c.state.color.hexCode);
    final contentColor = context.select(
      (RandomColorCubit c) => c.state.contentColor,
    );

    return InkWell(
      onTap: () async {
        await context.read<RandomColorCubit>().copyHexToClipboard();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Copied $hex to clipboard!'),
              duration: const Duration(seconds: 1),
            ),
          );
        }
      },
      child: Text(
        hex,
        style: TextStyle(
          color: contentColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
