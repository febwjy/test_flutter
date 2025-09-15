import 'package:flutter/material.dart';
import 'package:test_flutter/injection_container.dart';
import 'package:test_flutter/presentation/view/login_view.dart';

void main() {
  setupInjector();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const LoginView(),
    );
  }
}
