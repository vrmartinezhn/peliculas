
import 'package:get/get.dart';
import 'package:peliculas/components/movies/models/peliculas_actor_model.dart';
import 'package:peliculas/components/shared/request_handler.dart';
import 'package:peliculas/components/utils/constantes.dart';

class PeliculasActorController extends GetxController {

  PeliculasActorController({required this.personId});

  final int personId;

  final _cargando = false.obs;
  final _request = RequestHandler();

  @override
  void onInit() {
    super.onInit();
    getPeliculasActor();
  }

  final RxList<PeliculasActorModel> _listaPeliculas =
      <PeliculasActorModel>[].obs;

  Future<void> getPeliculasActor() async {

    cargando = true;
    update();

    try {

      final endpoint = endpointPeliculasActor.replaceFirst(
        '{person_id}',
        personId.toString(),
      );

      final data = await _request.requestGet(
        host: hostApi,
        endpoint: endpoint,
      );

      if (data.results.isNotEmpty) {

        listaPeliculas = data.results
            .map((i) => PeliculasActorModel.fromJson(i))
            .toList();

      } else {

        listaPeliculas = [];
      }

    } finally {

      cargando = false;
      update();
    }
  }

  // Getters y setters

  bool get cargando => _cargando.value;

  set cargando(bool value) => _cargando.value = value;

  List<PeliculasActorModel> get listaPeliculas => _listaPeliculas;

  set listaPeliculas(List<PeliculasActorModel> peliculas) =>
      listaPeliculas.assignAll(peliculas);
}
