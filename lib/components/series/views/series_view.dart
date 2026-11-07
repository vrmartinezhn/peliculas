import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:peliculas/components/series/controllers/series_controller.dart';
import 'package:peliculas/components/series/views/card_serie.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SeriesListasView extends StatelessWidget {
  SeriesListasView({super.key});

  // inyectando el controlar de series
  final _seriesController = Get.put<SeriesController>(
    SeriesController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Series'),
      ),
      body: Obx(
        () => _seriesController.cargando
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
          init: _seriesController,
          builder: (SeriesController controller){
            return ListView.builder(
              itemCount: controller.listaSeries.length,
              padding: EdgeInsets.all(12),
              itemBuilder: (context, index){
                final serie = controller.listaSeries[index];
                return CardSeries(serie: serie);
              },
            );
          },
        ),
      ),
    );
  }
}