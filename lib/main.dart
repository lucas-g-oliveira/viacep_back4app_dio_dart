import 'package:flutter/material.dart';
import 'package:viacep_back4app_dio_dart/pages/home_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salvador de CEPs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange.shade600),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
