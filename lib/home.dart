import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:peliculas/components/movies/views/peliculas_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PeliculasTendenciasView(),
    );
  }
}