import 'package:flutter/material.dart';
import 'package:json_placeholder_workshop/providers/photos_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PhotosProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JSON Placeholder Workshop',
      // initialRoute: "home",
      routes: {
        // "home": (context) => const HomePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
