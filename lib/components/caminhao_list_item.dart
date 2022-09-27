import 'package:challenge_scania/model/caminhao.dart';
import 'package:challenge_scania/model/tipo_caminhao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CaminhaoListItem extends StatelessWidget {
  final Caminhao caminhao;
  const CaminhaoListItem({Key? key, required this.caminhao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tipoCaminhao = caminhao.tipoCaminhao.name == "SemiPesado" ? "Semi Pesado" : caminhao.tipoCaminhao.name;
    return ListTile(
      title: Text(caminhao.modelo + " " + caminhao.ano.toString() + " - " + tipoCaminhao),
      subtitle: Text("Capacidade de carga: " + caminhao.capacidadeCarga.toString() + "Kg"),
      trailing: Text(
        NumberFormat.simpleCurrency(locale: 'pt_BR').format(caminhao.valor)
      )
    );
  }
}