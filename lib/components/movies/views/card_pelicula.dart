import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peliculas/components/movies/views/pantalla_creditos.dart';
import 'package:peliculas/components/movies/models/peliculas_model.dart';
import 'package:peliculas/components/movies/views/pantalla_imagen.dart';

class CardPeliculas extends StatelessWidget {
  const CardPeliculas({super.key, required this.pelicula});
  final PeliculasModel pelicula; // modelo

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Imagen superior
          GestureDetector(
            onTap: () {
              Get.to(
                PantallaImagen(
                  pathImagen:
                      'https://image.tmdb.org/t/p/w500${pelicula.posterPath}',
                  tituloPelicula: pelicula.title,
                ),
              );
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${pelicula.posterPath}',
                height: 180,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 80),
              ),
            ),
          ),

          // Contenido textual
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pelicula.title,
                  style: Theme.of(context).textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  pelicula.overview,
                  style: Theme.of(context).textTheme.bodyMedium
                      ?.copyWith(color: Colors.grey[700]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(() => PantallaCreditos(pelicula: pelicula));
                      },
                      child: Text(
                        'Ver actores',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text(
                        'Ver generos',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
