import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerMobcar extends Drawer {
  const DrawerMobcar({
    Key? key,
    Widget? child,
  }) : super(key: key, child: child);

  void _onMenuItemSelected(Widget value) {
    Get.to(() => value);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
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
          const ListTile(
            title: Text('Itens do menu'),
          ),
          
        ],
      ),
    );
  }
}
