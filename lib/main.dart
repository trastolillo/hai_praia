import 'package:flutter/material.dart';

import 'infrastructure/datasources/local_data/bd/database.dart';
import 'presentation/pages/home_page.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await Database.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hai praia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
