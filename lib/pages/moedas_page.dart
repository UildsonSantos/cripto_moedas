import 'package:cripto_moedas/repositories/moeda_repository.dart';
import 'package:flutter/material.dart';

class MoedasPage extends StatelessWidget {
  const MoedasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabela = MoedaRepository.tabela;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cripto Moedas'),
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int moeda) {
              return ListTile(
                title: Text(tabela[moeda].nome),
                leading: Image.asset(tabela[moeda].icone),
                trailing: Text(tabela[moeda].preco.toString()),
              );
            },
            padding: EdgeInsets.all(16),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: tabela.length),);
  }
}
