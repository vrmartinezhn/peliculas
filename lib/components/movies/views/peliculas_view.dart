import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peliculas/components/movies/controllers/peliculas_controller.dart';
import 'package:peliculas/components/movies/views/card_pelicula.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PeliculasTendenciasView extends StatelessWidget {
  PeliculasTendenciasView({super.key});

  // inyectando el controlador de peliculas
  final _peliculasTendenciasController = Get.put<PeliculasController>(
    PeliculasController(),
  );
  // inyectando el controlador

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas'),
      ),
      body: Obx(
        () => _peliculasTendenciasController.cargando
            ? Skeletonizer(
                enabled: true,
                child: Center(
                  child: Text(
                    'Cargando...',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              )
            : GetBuilder(
                init: _peliculasTendenciasController,
                builder: (PeliculasController controller) {
                  return ListView.builder(
                    itemCount: controller.listaPeliculas.length,
                    padding: const EdgeInsets.all(12),
                    itemBuilder: (context, index) {
                      final pelicula = controller.listaPeliculas[index];
                      return CardPeliculas(pelicula: pelicula);
                    },
                  );
                },
              ),
      ),
    );
  }
}
