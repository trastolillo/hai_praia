import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hai_praia/infrastructure/datasources/remote_data/fetch_data/sunrise_sunset_data/sunrise_sunset_data.dart';

import '../../infrastructure/datasources/remote_data/fetch_data/meteogalicia_data/meteogalicia_data.dart';
import '../../infrastructure/datasources/remote_data/fetch_data/openweather_data/openweather_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final meteogaliciaData =
        MeteogaliciaData(diasPrediccion: 1, locationId: 59791, dio: dio);
    final openweatherPrediccionData = OpenweatherData(
      localidad: 'Santander',
      isActual: false,
      dio: dio,
    );
    final openweatherActualData = OpenweatherData(
      localidad: 'Santander',
      isActual: true,
      dio: dio,
    );
    final sunriseSunsetData = SunriseSunsetData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hay praia returns'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: listItem(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // openweatherPrediccionData.getData();
          // meteogaliciaData.getData();
          // openweatherActualData.getData();
          sunriseSunsetData.getData();
        },
        child: const Icon(Icons.update),
      ),
    );
  }

  List<ListTile> listItem() {
    const item = ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.wb_sunny),
      ),
      title: Text('Título'),
      subtitle: Text('Subtítulo'),
      trailing: Text('T'),
    );

    return [item, item, item];
  }
}
