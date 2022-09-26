import 'package:challenge_scania/database/database_manager.dart';
import 'package:challenge_scania/model/caminhao.dart';

class CaminhaoRepository  {
  Future<void> cadastrarCaminhao(Caminhao caminhao) async {
    final db = await DatabaseManager().getDatabase();

    db.insert("caminhao", {
      "id": caminhao.id,
      "tipoCaminhao": caminhao.tipoCaminhao.index,
      "valor": caminhao.valor,
      "modelo": caminhao.modelo,
      "ano": caminhao.ano,
      "capacidadeCarga": caminhao.capacidadeCarga
    });
  }
}