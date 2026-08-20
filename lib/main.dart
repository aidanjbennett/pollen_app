import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pollen_app/views/home_screen.dart';
import 'package:pollen_app/views/settings_screen.dart';

import 'viewmodels/home_view_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pollen App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
