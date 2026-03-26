part of '../pages/random_background_screen.dart';

class HistoryListWidget extends StatelessWidget {
  const HistoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final history = context.select((RandomColorCubit c) => c.state.history);

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: history.length,
        itemBuilder: (context, index) {
          final color = history[index];
          return GestureDetector(
            onTap: () =>
                context.read<RandomColorCubit>().selectFromHistory(color),
            child: Container(
              width: 50,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: Color.fromRGBO(color.r, color.g, color.b, 1),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white24),
              ),
            ),
          );
        },
      ),
    );
  }
}
