import 'package:flutter/material.dart';
import 'package:test_color/domain/di/injection_container.dart';
import 'package:test_color/features/random_background/presentation/pages/random_background_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  InjectionContainer().init();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RandomBackgroundScreen(),
    ),
  );
}
