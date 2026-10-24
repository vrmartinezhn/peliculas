import 'package:get/get.dart';
import 'package:peliculas/components/movies/controllers/peliculas_model.dart';
import 'package:peliculas/components/shared/request_handler.dart';
import 'package:peliculas/components/shared/request_model.dart';
import 'package:peliculas/components/utils/constantes.dart';

class PeliculasController extends GetxController{

  // el _ indica que es una variable privada
  // obs indica que el valor a cambiar
  final _cargando = false.obs;

  // instancia de la clase RequestHandler
  final _request = RequestHandler();

  // late indica que la variable sera leida despues
  // su contenido o valor sera evaluado mas adelante en la aplicación
  late RequestModel response;

  // variable que tendra la información de las películas
  // se inicializa como una lista vacia
  final RxList<PeliculasModel> _listaPeliculas = <PeliculasModel>[].obs;

  //future, algo que sucedera
  //metodo para obtener las peliculas de la API
  Future<RequestModel> getPeliculas() async {
    
    // una vez se ejecute la petición, la variable cargando pasa a true
    // y con ello mostramos que lap petición esta pendiente o cargando
    cargando = true;

    // aqui se lanza la peticion
    final data = await _request.requestGet(host: hostApi, endpoint: endpointPopulares);

    // si la propiedad results de json de la api tiene datos,
    // lo asignamos a la variable listaPeliculas
    if(data.results.isNotEmpty){
      listaPeliculas = data.results.map((i) => PeliculasModel.fromJson(i)).toList();
    }

    // una vez termine la petición, la pasamos a false
    cargando = false;

    return data;
  }

  // getters y setters
  bool get cargando => _cargando.value;
  set cargando(bool value) => _cargando.value = value;

  List<PeliculasModel> get listaPeliculas => _listaPeliculas;
  set listaPeliculas(List<PeliculasModel> peliculas) =>
                              listaPeliculas.assignAll(peliculas);

}