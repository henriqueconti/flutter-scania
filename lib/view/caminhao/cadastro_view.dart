import 'package:challenge_scania/model/caminhao.dart';
import 'package:challenge_scania/model/tipo_caminhao.dart';
import 'package:challenge_scania/repository/caminhao_repository.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CadastroView extends StatefulWidget {
  CadastroView({Key? key}) : super(key: key);

  @override
  State<CadastroView> createState() => _CadastroCaminhaoViewState();
}

class _CadastroCaminhaoViewState extends State<CadastroView> {

  final _caminhaoRepository = CaminhaoRepository();

  final _modeloController = TextEditingController();
  final _anoController = TextEditingController();

  final _capacidadeCargaController = TextEditingController(); 
  final _valorController = MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.', leftSymbol: 'R\$');

  TipoCaminhao tipoCaminhaoSelecionado = TipoCaminhao.Pesado;

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Cadastrar Caminhão'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildModelo(),
                const SizedBox(height: 15),
                _buildAno(),
                const SizedBox(height: 15),
                _buildTipoCaminhao(),
                const SizedBox(height: 10),
                _buildCapacidadeCarga(),
                const SizedBox(height: 10),
                _buildValor(),
                const SizedBox(height: 20),
                _buildButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('Cadastrar'),
        ),
        onPressed: () async {
          final isValid = _formKey.currentState!.validate();
          if (isValid) {
            final valor = NumberFormat.currency(locale: 'pt_BR')
                .parse(_valorController.text.replaceAll('R\$', ''))
                .toDouble();
            final ano = NumberFormat.currency(locale: 'pt_BR')
                .parse(_anoController.text)
                .toInt();
            final modelo = _modeloController.text;
            final capacidade = NumberFormat.currency(locale: 'pt_BR')
                .parse(_capacidadeCargaController.text)
                .toDouble();
            
            final caminhao = Caminhao(
              modelo: modelo,
              ano: ano,
              valor: valor,
              capacidadeCarga: capacidade,
              tipoCaminhao: tipoCaminhaoSelecionado
            );

            try {
              await _caminhaoRepository.cadastrarCaminhao(caminhao);

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Caminhão $modelo cadastrado com sucesso'),
              ));

              Navigator.of(context).pop(true);
            }catch(e){
              Navigator.of(context).pop(false);
            }
          }
        },
      ),
    );
  }

  Widget _buildTipoCaminhao() {
    return Column(
      children: <Widget>[
        RadioListTile<TipoCaminhao>(
          title: const Text("Caminhão Pesado"),
          value: TipoCaminhao.Pesado,
          groupValue: tipoCaminhaoSelecionado,
          onChanged: (TipoCaminhao? value) {
            if (value != null) {
              setState(() {
                tipoCaminhaoSelecionado = value;
              });
            }
          },
        ),
        RadioListTile<TipoCaminhao>(
          title: const Text('Caminhão Semi Pesado'),
          value: TipoCaminhao.SemiPesado,
          groupValue: tipoCaminhaoSelecionado,
          onChanged: (TipoCaminhao? value) {
            if (value != null) {
              setState(() {
                tipoCaminhaoSelecionado = value;
              });
            }
          },
        ),
        RadioListTile<TipoCaminhao>(
          title: const Text('Caminhão Urbano'),
          value: TipoCaminhao.VeiculoUrbano,
          groupValue: tipoCaminhaoSelecionado,
          onChanged: (TipoCaminhao? value) {
            if (value != null) {
              setState(() {
                tipoCaminhaoSelecionado = value;
              });
            }
          },
        )
      ],
    );
  }

  TextFormField _buildModelo() {
    return TextFormField(
      controller: _modeloController,
      decoration: const InputDecoration(
        hintText: 'Informe o modelo',
        labelText: 'Modelo',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe o modelo';
        }
        if (value.length < 10 || value.length > 30) {
          return 'O modelo deve conter de 10 a 30 caracteres';
        }
        return null;
      },
    );
  }

  TextFormField _buildValor() {
    return TextFormField(
      controller: _valorController,
      decoration: const InputDecoration(
        hintText: 'Informe o valor',
        labelText: 'Valor',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.money),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe um Valor';
        }
        final valor = NumberFormat.currency(locale: 'pt_BR')
            .parse(_valorController.text.replaceAll('R\$', ''));
        if (valor <= 0) {
          return 'Informe um valor maior que zero';
        }

        return null;
      },
    );
  }

  TextFormField _buildAno() {
    return TextFormField(
      controller: _anoController,
      decoration: const InputDecoration(
        hintText: 'Informe o ano',
        labelText: 'Ano',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.money),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe o ano';
        }
        final ano = NumberFormat.currency(locale: 'pt_BR')
            .parse(_anoController.text);
        if (ano <= 1000 || ano > 2023) {
          return 'Informe um ano válido';
        }

        return null;
      },
    );
  }

  TextFormField _buildCapacidadeCarga() {
    return TextFormField(
      controller: _capacidadeCargaController,
      decoration: const InputDecoration(
        hintText: 'Informe a capacidade de carga (Kg)',
        labelText: 'Capacidade de Carga (Kg)',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.money),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Capacidade de carga inválida';
        }
        final carga = NumberFormat.currency(locale: 'pt_BR')
            .parse(_capacidadeCargaController.text);
        if (carga <= 100 || carga > 9999) {
          return 'Capacidade de carga inválida';
        }

        return null;
      },
    );
  }
}