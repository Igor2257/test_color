part of '../pages/random_background_screen.dart';

class InteractiveBackgroundWidget extends StatelessWidget {
  final Widget child;

  const InteractiveBackgroundWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = context.select((RandomColorCubit c) => c.state.color);
    final bgColor = Color.fromRGBO(color.r, color.g, color.b, color.opacity);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.read<RandomColorCubit>().changeColor(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        color: bgColor,
        curve: Curves.easeInOut,
        child: child,
      ),
    );
  }
}
