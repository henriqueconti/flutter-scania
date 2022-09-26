import 'package:challenge_scania/model/tipo_caminhao.dart';

class Caminhao {
  int? id;
  double valor;
  String modelo;
  int ano;
  double capacidadeCarga;
  TipoCaminhao tipoCaminhao;

  Caminhao({
    this.id,
    required this.valor,
    required this.modelo,
    required this.ano,
    required this.capacidadeCarga,
    required this.tipoCaminhao
  });
}
