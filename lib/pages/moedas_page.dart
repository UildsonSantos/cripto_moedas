import 'package:cripto_moedas/repositories/moeda_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoedasPage extends StatelessWidget {
  const MoedasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabela = MoedaRepository.tabela;
    NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cripto Moedas'),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int moeda) {
            return ListTile(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))
              ),
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
              selected: true,
              selectedTileColor: Colors.indigo[50],
            );
          },
          padding: EdgeInsets.all(16),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: tabela.length),
    );
  }
}
