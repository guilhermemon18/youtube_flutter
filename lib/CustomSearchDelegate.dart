import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // print("resultado: pesquisa realizada");
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // print("Resultado: digitado " + query);
    // List<String> lista = List.empty();
    // if (query.isNotEmpty) {
    //   lista = ["Android", "Android navegação", "IOS", "Jogos"]
    //       .where((texto) => texto.toLowerCase().startsWith(query.toLowerCase()))
    //       .toList();
    //   return ListView.builder(
    //       itemCount: lista.length,
    //       itemBuilder: (context, index) {
    //         return ListTile(
    //           onTap: () {
    //             close(context, lista[index]);
    //           },
    //           title: Text(lista[index]),
    //         );
    //       });
    // } else {
    //   return Center(
    //     child: Text("Nenhum resultado para a pesquisa!"),
    //   );
    // }
    return Container();
  }
}
