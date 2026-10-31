import 'package:get/get.dart';

class NavigationController extends GetxController{
  RxInt opcionSeleccionada = 0.obs;

  void cambiarPagina(int indice){
    opcionSeleccionada.value = indice;
  }
  
}