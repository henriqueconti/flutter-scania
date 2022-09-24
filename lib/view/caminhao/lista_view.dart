import 'package:flutter/material.dart';

class ListaView extends StatefulWidget {
  ListaView({Key? key}) : super(key: key);

  @override
  State<ListaView> createState() => _ListaCaminhaoViewState();
}

class _ListaCaminhaoViewState extends State<ListaView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Consultar Caminhões'),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
              ],
            ),
          ),
        ),
      ),
    );
  }
}