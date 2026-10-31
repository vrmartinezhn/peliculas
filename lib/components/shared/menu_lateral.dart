import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Text('Peliculas')),
          ListTile(
            leading: Icon(Icons.movie),
            title: Text('Peliculas'),
          ),
          ListTile(
            leading: Icon(Icons.tv),
            title: Text('Series'),
          ),
          ListTile(
            leading: Icon(Icons.abc),
            title: Text('Otra cosa'),
          )
        ],
      ),
    );
  }
}