import 'package:flutter/material.dart';
import 'package:json_placeholder_workshop/pages/pages.dart';
import 'package:json_placeholder_workshop/providers/providers.dart';
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
        ),
        ChangeNotifierProvider(
          create: (context) => UsersProvider(),
          lazy: false,
        ),
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
      initialRoute: "home",
      routes: {
        "home": (context) => const HomePage(),
        "photoDetail": (context) => const PhotoDetailPage(),
        "users": (context) => const UsersPage(),
        "userDetail": (context) => const UserDetailPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}
