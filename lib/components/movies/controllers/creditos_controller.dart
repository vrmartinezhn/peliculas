import 'package:get/get.dart';
import 'package:peliculas/components/movies/models/creditos_model.dart';
import 'package:peliculas/components/shared/request_handler.dart';
import 'package:peliculas/components/shared/request_model.dart';
import 'package:peliculas/components/utils/constantes.dart';

class CreditosController extends GetxController{

  final _cargando = false.obs;
  final _request = RequestHandler();
  late RequestModel response;

  @override
  void onInit() async{
    super.onInit();
    response = await getCreditos();
  }

  final RxList<CreditosModel> _listaCreditos = <CreditosModel>[].obs;

  Future<RequestModel> getCreditos() async {
    cargando = true;

    final data = await _request.requestGet(host: hostApi, endpoint: endpointCreditos);

    if(data.results.isNotEmpty){
      listaCreditos = data.results.map((i) => CreditosModel.fromJson(i)).toList();
    }

    cargando = false; 

    return data;
  }
  


  // getters y setters
  bool get cargando => _cargando.value;
  set cargando(bool value) => _cargando.value = value;

  List<CreditosModel> get listaCreditos => _listaCreditos;
  set listaCreditos(List<CreditosModel> creditos) =>
                              listaCreditos.assignAll(creditos);


}