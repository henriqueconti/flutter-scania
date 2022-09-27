import 'package:challenge_scania/components/caminhao_list_item.dart';
import 'package:challenge_scania/model/caminhao.dart';
import 'package:challenge_scania/repository/caminhao_repository.dart';
import 'package:flutter/material.dart';

class ListaView extends StatefulWidget {
  ListaView({Key? key}) : super(key: key);

  @override
  State<ListaView> createState() => _ListaCaminhaoViewState();
}

class _ListaCaminhaoViewState extends State<ListaView> {

  final _caminhaoRepository = CaminhaoRepository();
  late Future<List<Caminhao>> _caminhoes;

  @override
  void initState() {
    carregarTCaminhoes();
    super.initState();
  }

  void carregarTCaminhoes() {
    _caminhoes = _caminhaoRepository.listarCaminhao();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Consultar Caminhões'),
      ),
      body: FutureBuilder<List<Caminhao>>(
        future: _caminhoes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            final caminhoes = snapshot.data ?? [];
            return ListView.separated(
              itemCount: caminhoes.length,
              itemBuilder: (context, index) {
                final caminhao = caminhoes[index];
                return Container(
                  child: CaminhaoListItem(caminhao: caminhao),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          }
          return Container();
        },
      ),
    );
  }
}