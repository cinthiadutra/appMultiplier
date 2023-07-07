import 'package:app_multiplier/views/widget/appbar_mobcar.dart';
import 'package:app_multiplier/views/widget/drawer_mobcar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarMobcar(),
      endDrawer: const DrawerMobcar(),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/blackBackground.jpg',
                  ))),
        ),
        Positioned(
            bottom: 10,
            top: MediaQuery.of(context).size.height - 100,
            left: 50,
            child: const Text(
              '© 2020. All rights reserved to Mobcar',
              style: TextStyle(color: Colors.blue),
            ))
      ]),
    );
  }
}
