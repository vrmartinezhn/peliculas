import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:peliculas/components/consejos/controllers/consejos_controller.dart';
import 'package:peliculas/components/consejos/models/consejos_model.dart';

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
                : Column(
                  spacing: 20,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.amber,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _controller.consejosModel?.advice ?? 'Sin datos',
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _controller.getConsejos, 
                      child: Text('Nuevo Consejo')
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}