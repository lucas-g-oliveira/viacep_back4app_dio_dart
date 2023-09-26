import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Salvador de CEPs',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
      body: const Center(
        child: Column(),
      ),
    );
  }
}
