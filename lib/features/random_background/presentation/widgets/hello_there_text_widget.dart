part of '../pages/random_background_screen.dart';

class HelloThereTextWidget extends StatelessWidget {
  const HelloThereTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.select((RandomColorCubit c) => c.state.color.isDark);
    final textColor = isDark ? Colors.white : Colors.black;

    return Center(
      child: Text(
        'Hello there',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
