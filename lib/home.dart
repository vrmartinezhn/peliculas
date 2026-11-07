import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peliculas/components/movies/views/peliculas_view.dart';
import 'package:peliculas/components/movies/views/series_view.dart';
import 'package:peliculas/components/shared/menu_lateral.dart';
import 'package:peliculas/components/shared/navigation_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  // inyectar el controlador
  final NavigationController navigationController = Get.put(NavigationController());

  final List<Widget> vistas = [PeliculasTendenciasView(), SeriesListasView(), Center()];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(),
        drawer: MenuLateral(),
        body: vistas[navigationController.opcionSeleccionada.value], // se mostrara la lista
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          currentIndex: navigationController.opcionSeleccionada.value,
          items: [
            BottomNavigationBarItem(label: 'Peliculas', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'Series', icon: Icon(Icons.tv)),
            BottomNavigationBarItem(label: 'Otra cosa', icon: Icon(Icons.abc)),
          ],
          onTap: navigationController.cambiarPagina,
        ),
      )
    );
  }
}