import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peliculas/components/movies/controllers/creditos_controller.dart';
import 'package:peliculas/components/movies/models/peliculas_model.dart';
import 'package:peliculas/components/movies/views/pantalla_peliculas_actor.dart';

class PantallaCreditos extends StatelessWidget {
  const PantallaCreditos({super.key, required this.pelicula});

  final PeliculasModel pelicula;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Actores de ${pelicula.title}')),
      body: GetBuilder<CreditosController>(
        init: CreditosController(movieId: pelicula.id),
        builder: (controller) {
          if (controller.cargando) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.listaCreditos.isEmpty) {
            return const Center(
              child: Text('No se encontraron actores para esta película.'),
            );
          }

          return ListView.builder(
            itemCount: controller.listaCreditos.length,
            itemBuilder: (context, index) {
              final actor = controller.listaCreditos[index];
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(actor.name),
                subtitle: actor.character == null
                    ? null
                    : Text(actor.character!),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
                onTap: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => PantallaPeliculasActor(
                        nombreActor: actor.name,
                        actorId: actor.id,
                        )
                    )
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
