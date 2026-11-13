import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peliculas/components/movies/controllers/peliculas_actor_controller.dart';

class PantallaPeliculasActor extends StatelessWidget {
  
  const PantallaPeliculasActor({
    super.key,
    required this.nombreActor,
    required this.actorId,
  });

  final String nombreActor;
  final int actorId;

  @override
  Widget build(BuildContext context) {    
    return Scaffold(

      appBar: AppBar(
        title: Text('Películas de $nombreActor'),
      ),

      body: GetBuilder<PeliculasActorController>(
        init: PeliculasActorController(personId: actorId),

        builder: (controller) {

          if (controller.cargando) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.listaPeliculas.isEmpty) {
            return const Center(
              child: Text(
                'No se encontraron películas para este actor.',
              ),
            );
          }

          return ListView.builder(

            itemCount: controller.listaPeliculas.length,

            itemBuilder: (context, index) {

              final pelicula =
                  controller.listaPeliculas[index];

              final anio = pelicula.releaseDate != null &&
                      pelicula.releaseDate!.length >= 4
                  ? pelicula.releaseDate!.substring(0, 4)
                  : 'Año desconocido';

              return ListTile(

                leading: const Icon(
                  Icons.movie,
                  size: 40,
                ),

                title: Text(pelicula.title),

                subtitle: Text(
                  '$anio · ${pelicula.character ?? "Personaje desconocido"}',
                ),

              );
            },
          );
        },
      ),
    );
  }
}