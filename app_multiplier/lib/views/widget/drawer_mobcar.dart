import 'package:flutter/material.dart';

class DrawerMobcar extends Drawer {
  const DrawerMobcar({
    Key? key,
    Widget? child,
  }) : super(key: key, child: child);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Home Page',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Itens do menu'),
          ),
        ],
      ),
    );
  }
}
