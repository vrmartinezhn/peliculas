import 'package:get/get.dart';
import 'package:peliculas/components/shared/request_handler.dart';
import 'package:peliculas/components/shared/request_model.dart';
import 'package:peliculas/components/utils/constantes.dart';

class SeriesController extends GetxController{

  final _cargando = false.obs;
  final _request = RequestHandler();
  late RequestModel response;

  @override
  void onInit() async{
    super.onInit();
    response = await getSeries();
  }

  Future<RequestModel> getSeries() async {
    cargando = true;

    final data = await _request.requestGet(host: hostApi, endpoint: endpointSeries);
    if(data.results.isNotEmpty){
      //listaSeries = data.results.map((i) => SeriesModelXXXXX)
    }

    cargando = false;

    return data;

  }


  // getters y setters
  bool get cargando => _cargando.value;
  set cargando(bool value) => _cargando.value = value;

  

}