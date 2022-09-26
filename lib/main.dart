import 'package:challenge_scania/view/caminhao/cadastro_view.dart';
import 'package:challenge_scania/view/caminhao/lista_view.dart';
import 'package:challenge_scania/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scania Truck',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: generateMaterialColor(color: Color.fromARGB(253, 139, 2, 2))
      ),
      routes: {
        '/': (context) => const HomeView(),
        '/caminhao-cadastro': (context) => CadastroView(),
        '/caminhao-lista': (context) => ListaView()
      },
      initialRoute: '/',
    );
  }
}