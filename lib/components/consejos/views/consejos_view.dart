import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:peliculas/components/consejos/controllers/consejos_controller.dart';

class ConsejosView extends StatelessWidget {
  ConsejosView({super.key});

  // inyectamos el controlador
  final ConsejosController _controller = Get.put(ConsejosController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Obx(
                () => _controller.cargando
                ? CircularProgressIndicator()
                : Text(
                  _controller.consejosModel?.advice ?? 'Sin datos',
                  style: TextStyle(fontSize: 40),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}