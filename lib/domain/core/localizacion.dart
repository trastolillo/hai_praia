import 'package:location/location.dart';

class Localizacion {
  final String localidad;

  Localizacion({
    this.localidad,
  });

  Future<LocationData> get coordenadas async => Location().getLocation();
}
