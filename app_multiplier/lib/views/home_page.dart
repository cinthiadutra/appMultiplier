import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/iconMob.jpeg',
          scale: 2.0,
        ),
      ),
      endDrawer: const EndDrawerButton(),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/blackBackground.jpg',
                ))),
      ),
    );
  }
}
