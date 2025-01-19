import 'package:flutter/material.dart';
import 'package:healthy_recipies/controler/healthy_controller.dart';
import 'package:healthy_recipies/view/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HealthyController())],
      child: MaterialApp(
          title: 'Healthify Us',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
            useMaterial3: true,
          ),
          home: Splash()),
    );
  }
}
