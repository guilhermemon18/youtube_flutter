import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricao.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:async';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      const EmAlta(),
      const Inscricao(),
      const Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.grey, opacity: 1),
        backgroundColor: Colors.white,
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: [
          IconButton(
              onPressed: () async {
                String? res = await showSearch(
                    context: context, delegate: CustomSearchDelegate());
                setState(() {
                  _resultado = res!;
                });
                print("resultado: digitado " + res!);
              },
              icon: const Icon(Icons.search)),
          // IconButton(
          //     onPressed: () {
          //       print("Ação: videocam");
          //     },
          //     icon: const Icon(Icons.videocam)),

          // IconButton(
          //     onPressed: () {
          //       print("Ação: conta");
          //     },
          //     icon: const Icon(Icons.account_circle))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      //necessita ao menos 2 BottomNavigationBarItem:
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _indiceAtual,
          onTap: (indice) {
            setState(() {
              _indiceAtual = indice;
            });
          },
          fixedColor: Colors.red,
          items: const [
            BottomNavigationBarItem(label: "Início", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "Em Alta", icon: Icon(Icons.whatshot)),
            BottomNavigationBarItem(
                label: "Inscrições", icon: Icon(Icons.subscriptions)),
            BottomNavigationBarItem(
                label: "Biblioteca", icon: Icon(Icons.folder)),
          ]),
    );
  }
}
