// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:viacep_back4app_dio_dart/back4app/endereco_back4app_model.dart';
import 'package:viacep_back4app_dio_dart/back4app/endereco_back4app_repository.dart';
import 'package:viacep_back4app_dio_dart/components/item_cep_tile.dart';
import 'package:viacep_back4app_dio_dart/pages/edit_and_add_cep.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data = EnderecosBack4App();
  EnderecoModel? temp;
  bool loading = false;

  @override
  void initState() {
    carregarDados();
    super.initState();
  }

  Future<dynamic> carregarDados() async {
    loading = true;
    temp = await data.getAll();
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Salvador de CEPs',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              IconButton(
                  onPressed: () async {
                    carregarDados();
                  },
                  icon: Icon(Icons.refresh))
            ],
          )),
      body: Center(
          child: Container(
              child: loading
                  ? const CircularProgressIndicator()
                  : ListView.builder(
                      itemCount: temp!.results.length,
                      itemBuilder: (context, index) => cepTileList(
                          context, temp!.results[index], carregarDados)))),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => EditAndSaveScreen(
                              allData: temp!.results,
                              parentSetState: carregarDados,
                            )))
              },
          child: const Text(
            "+",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          )),
    );
  }
}
