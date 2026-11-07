import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:peliculas/components/movies/models/series_model.dart';

class CardSeries extends StatelessWidget {
  const CardSeries({super.key, required this.serie});
  final SeriesModel serie; // modelo

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
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${serie.posterPath}',
              height: 180,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 80),
            ),
          ),

          // Contenido textual
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  serie.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                const SizedBox(height: 8),

                Text(
                  serie.overview,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    
                    TextButton(
                      onPressed: null, 
                      child: Text(
                        'Ver actores',
                        style: TextStyle(color: Colors.blue),
                      )
                    ),

                    TextButton(
                      onPressed: null, 
                      child: Text(
                        'Ver generos',
                        style: TextStyle(color: Colors.blue),
                      )
                    )
                    
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}