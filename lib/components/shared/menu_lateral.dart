import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peliculas/components/shared/navigation_controller.dart';

class MenuLateral extends StatelessWidget {
  MenuLateral({super.key});
  // aca estamos leyendo el controlador
  // porque previamente ya esta inyectado
  final NavigationController navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Text('Menú')),
          ListTile(
            leading: Icon(Icons.movie),
            title: Text('Peliculas'),
            onTap: (){
              navigationController.cambiarPagina(0);
              Navigator.pop(context); //cierra el menú tras elegir una opcion
            },
          ),
          ListTile(
            leading: Icon(Icons.tv),
            title: Text('Series'),
            onTap: (){
              navigationController.cambiarPagina(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.abc),
            title: Text('Otra cosa'),
            onTap: (){
              navigationController.cambiarPagina(2);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}