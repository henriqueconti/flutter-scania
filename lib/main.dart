import 'package:challenge_scania/view/caminhao/cadastro_view.dart';
import 'package:challenge_scania/view/home_view.dart';
import 'package:flutter/material.dart';

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
        primarySwatch: MaterialColor(
          0xFF1B5E20,
          {
            300: Colors.red.shade700,
            500: Colors.red.shade900,
            600: Colors.blue.shade700,
            900: Colors.blue.shade900
          },
        )
      ),
      routes: {
        '/': (context) => const HomeView(),
        '/caminhao-cadastro': (context) => CadastroView()
      },
      initialRoute: '/',
    );
  }
}