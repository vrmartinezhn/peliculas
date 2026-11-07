import 'package:get/get.dart';
import 'package:peliculas/components/movies/models/creditos_model.dart';
import 'package:peliculas/components/shared/request_handler.dart';
import 'package:peliculas/components/utils/constantes.dart';

class CreditosController extends GetxController {
  CreditosController({required this.movieId});

  final int movieId;

  final _cargando = false.obs;
  final _request = RequestHandler();

  @override
  void onInit() {
    super.onInit();
    getCreditos();
  }

  final RxList<CreditosModel> _listaCreditos = <CreditosModel>[].obs;

  Future<void> getCreditos() async {
    cargando = true;
    update();

    try {
      final endpoint = endpointCreditos.replaceFirst(
        '{movie_id}',
        movieId.toString(),
      );
      final data = await _request.requestGet(host: hostApi, endpoint: endpoint);

      if (data.results.isNotEmpty) {
        listaCreditos = data.results
            .map((i) => CreditosModel.fromJson(i))
            .toList();
      } else {
        listaCreditos = [];
      }
    } finally {
      cargando = false;
      update();
    }
  }

  // getters y setters
  bool get cargando => _cargando.value;
  set cargando(bool value) => _cargando.value = value;

  List<CreditosModel> get listaCreditos => _listaCreditos;
  set listaCreditos(List<CreditosModel> creditos) =>
      listaCreditos.assignAll(creditos);
}
