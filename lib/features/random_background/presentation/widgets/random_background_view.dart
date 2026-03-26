part of '../pages/random_background_screen.dart';

class RandomBackgroundView extends StatelessWidget {
  const RandomBackgroundView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          InteractiveBackgroundWidget(
            child: HelloThereTextWidget(),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LockItemWidget(label: 'R'),
                  LockItemWidget(label: 'G'),
                  LockItemWidget(label: 'B'),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                HistoryListWidget(),
                SizedBox(height: 16),
                ColorInfoPanel(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
