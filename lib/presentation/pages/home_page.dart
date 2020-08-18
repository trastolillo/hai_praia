import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hay praia returns'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: listItem(),
      ),
    );
  }

  List<ListTile> listItem() {
    final item = ListTile(
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
