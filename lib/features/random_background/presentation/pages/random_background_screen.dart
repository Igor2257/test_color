import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_color/domain/di/injection_container.dart';
import 'package:test_color/features/random_background/domain/entities/background_color_entity.dart';
import 'package:test_color/features/random_background/presentation/bloc/random_color_cubit.dart';

part '../widgets/channel_lock_widget.dart';
part '../widgets/color_hex_value_text_widget.dart';
part '../widgets/color_info_panel.dart';
part '../widgets/color_rgb_value_text_widget.dart';
part '../widgets/color_values_display_widget.dart';
part '../widgets/hello_there_text_widget.dart';
part '../widgets/history_list_widget.dart';
part '../widgets/interactive_background_widget.dart';
part '../widgets/lock_item_widget.dart';
part '../widgets/opacity_slider_widget.dart';
part '../widgets/random_background_view.dart';

class RandomBackgroundScreen extends StatelessWidget {
  const RandomBackgroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<RandomColorCubit>(),
      child: const RandomBackgroundView(),
    );
  }
}
