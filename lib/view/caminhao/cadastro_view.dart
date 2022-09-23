import 'package:flutter/material.dart';

class CadastroView extends StatefulWidget {
  CadastroView({Key? key}) : super(key: key);

  @override
  State<CadastroView> createState() => _CadastroCaminhaoViewState();
}

class _CadastroCaminhaoViewState extends State<CadastroView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Caminhão'),
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