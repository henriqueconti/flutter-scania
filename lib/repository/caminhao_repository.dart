import 'package:challenge_scania/database/database_manager.dart';
import 'package:challenge_scania/model/caminhao.dart';
import 'package:challenge_scania/model/tipo_caminhao.dart';

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

  Future<List<Caminhao>> listarCaminhao() async {
    final db = await DatabaseManager().getDatabase();

    final List<Map<String, dynamic>> rows = await db.rawQuery('''
          SELECT id, valor, modelo, ano, capacidadeCarga, tipoCaminhao
          FROM caminhao
          ''');
    
    return rows
        .map(
          (row) => Caminhao(
            id: row['id'],
            tipoCaminhao: TipoCaminhao.values[row['tipoCaminhao']],
            modelo: row['modelo'],
            valor: row['valor'],
            capacidadeCarga: row['capacidadeCarga'],
            ano: row['ano']
          ),
        )
        .toList();
  }
}