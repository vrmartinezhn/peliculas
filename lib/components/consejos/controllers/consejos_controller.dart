import 'package:get/get.dart';
import 'package:peliculas/components/consejos/models/consejos_model.dart';
import 'package:peliculas/components/shared/request_handler.dart';
import 'package:peliculas/components/utils/constantes.dart';

class ConsejosController extends GetxController {

  final RxBool _cargando = false.obs;

  final _request = RequestHandler();

  // llamamos a ConsejosResponse
  late ConsejosResponse response;

  @override
  void onInit() async {
    super.onInit();
    // llamando el método para obtener los consejos
    response = await getConsejos();
  }

  final Rx<ConsejosModel?> _consejosModel = Rx<ConsejosModel?>(null);

  Future<ConsejosResponse> getConsejos () async {

    cargando = true;

    final data = await _request.requestGetConsejos(
      host: hostConsejos, 
      endpoint: endpointConsejos
    );

    if (data.slip != null) {
      consejoActual = data.slip;
    }

    cargando = false;

    return data;
  }

  // getters y setters
  bool get cargando => _cargando.value;
  set cargando(bool value) => _cargando.value = value;

  ConsejosModel? get consejosModel => _consejosModel.value;
  set consejoActual(ConsejosModel? value) => _consejosModel.value = value;

}