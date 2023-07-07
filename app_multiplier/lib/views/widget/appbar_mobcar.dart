import 'package:flutter/material.dart';

class AppbarMobcar extends AppBar {
  AppbarMobcar({
    super.key,
    Color backgroundColor = Colors.black,
    List<Widget> actions = const [],
  }) : super(
            title: Image.asset(
              'assets/images/iconMob.jpeg',
              scale: 2.0,
            ),
            backgroundColor: backgroundColor,
            iconTheme: const IconThemeData(
              color: Colors.blue,
            ),
            actions: [
              PopupMenuButton<String>(
                icon: const Icon(Icons.menu_open_rounded),
                position: PopupMenuPosition.under,
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'item1',
                      child: Text('Item 1'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'item2',
                      child: Text('Item 2'),
                    ),
                  ];
                },
                onSelected: ((value) {}),
              ),
            ]);
}
