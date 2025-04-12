import 'package:flutter/material.dart';

import 'components/main_screen.dart';
import 'components/signin.dart';
import 'components/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solana Earphone',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
      initialRoute: '/signin',
      routes: {'/signin': (context) => const SignInPage(), '/signup': (context) => const SignUpPage(), '/home': (context) => const MainScreen()},
    );
  }
}
