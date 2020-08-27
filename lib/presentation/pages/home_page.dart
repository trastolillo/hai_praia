import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hai_praia/infrastructure/datasources/remote_data/fetch_data/meteogalicia_fetch/meteogalicia_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final meteogaliciaFetch =
        MeteogaliciaData(diasPrediccion: 1, locationId: 59791, dio: Dio());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hay praia returns'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: listItem(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => meteogaliciaFetch.getData(),
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
