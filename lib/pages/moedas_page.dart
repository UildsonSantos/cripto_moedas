import 'package:cripto_moedas/models/moeda.dart';
import 'package:cripto_moedas/repositories/moeda_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoedasPage extends StatefulWidget {
  MoedasPage({Key? key}) : super(key: key);

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  final tabela = MoedaRepository.tabela;

  List<Moeda> selecionadas = [];

  @override
  Widget build(BuildContext context) {
    NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cripto Moedas'),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int moeda) {
            return ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              title: Text(
                tabela[moeda].nome,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.indigo,
                ),
              ),
              leading: SizedBox(
                child: Image.asset(tabela[moeda].icone),
                width: 40,
              ),
              trailing: Text(real.format(tabela[moeda].preco)),
              selected: selecionadas.contains(tabela[moeda]),
              selectedTileColor: Colors.indigo[50],
              onLongPress: () {
                setState(() {
                  (selecionadas.contains(tabela[moeda]))
                      ? selecionadas.remove(tabela[moeda])
                      : selecionadas.add(tabela[moeda]);
                });
              },
            );
          },
          padding: const EdgeInsets.all(16),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: tabela.length),
    );
  }
}
