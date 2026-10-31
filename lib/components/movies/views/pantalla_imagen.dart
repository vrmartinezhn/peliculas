import 'package:flutter/material.dart';

class PantallaImagen extends StatelessWidget {
  const PantallaImagen({super.key, required this.pathImagen, required this.tituloPelicula});
  final String pathImagen;
  final String tituloPelicula;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tituloPelicula),
      ),
      body: Expanded(
        child: Image.network(pathImagen),
      ),
    );
  }
}