import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Primer ventana')),
      body: Center(
        child: Column(
          children: [
            Text('Un husky blanco'),
            Image.asset('assets/img/husky1.jpg', height: 300, width: 300),
            Text('Otro husky'),
            Image.asset('assets/img/husky2.jpg', height: 300, width: 300),
          ],
        ),
      ),
    );
  }
}
