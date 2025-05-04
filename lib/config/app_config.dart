import 'package:flutter/material.dart';

class AppConfig {
  static const String appName = "Solana Earphone";

  // Theme configuration
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
      cardTheme: CardTheme(elevation: 2, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    );
  }

  // Route names
  static const String initialRoute = '/signin';
  static const String signInRoute = '/signin';
  static const String signUpRoute = '/signup';
  static const String homeRoute = '/home';

  // Navigation bar items
  static const List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.headphones), label: 'My Device'),
    BottomNavigationBarItem(icon: Icon(Icons.smart_toy), label: 'Agent'),
    BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Discover'),
    BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
  ];
}
