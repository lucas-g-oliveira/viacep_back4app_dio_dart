// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:viacep_back4app_dio_dart/back4app/endereco_back4app_model.dart';
import 'package:viacep_back4app_dio_dart/back4app/endereco_back4app_repository.dart';
import 'package:viacep_back4app_dio_dart/viacep/cep_model.dart';

class EditAndSaveScreen extends StatefulWidget {
  final Results? dataCEP;
  final List<Results>? allData;
  final Function parentSetState;

  const EditAndSaveScreen(
      {super.key, this.allData, this.dataCEP, required this.parentSetState});
  @override
  State<EditAndSaveScreen> createState() => _EditAndSaveScreenState();
}

class _EditAndSaveScreenState extends State<EditAndSaveScreen> {
  final _dio = Dio();
  EnderecosBack4App back4App = EnderecosBack4App();
  var cepController = TextEditingController();
  var logradouroController = TextEditingController();
  var bairroController = TextEditingController();
  var localidadeController = TextEditingController();
  var ufController = TextEditingController();
  late CEPModel asked;

  bool hasData = false;
  bool isLoading = false;
  bool saveButton = false;

  @override
  void initState() {
    hasData = widget.dataCEP != null;

    if (hasData) {
      initialData();
    } else {
      refresh();
    }
    super.initState();
  }

  void initialData() {
    cepController.text = widget.dataCEP!.cep!;
    logradouroController.text = widget.dataCEP!.logradouro!;
    bairroController.text = widget.dataCEP!.bairro!;
    localidadeController.text = widget.dataCEP!.localidade!;
    ufController.text = widget.dataCEP!.uf!;
  }

  void refresh() {
    cepController.text = "";
    logradouroController.text = "";
    bairroController.text = "";
    localidadeController.text = "";
    ufController.text = "";
  }

  Future<void> cepSearch(String cep) async {
    isLoading = true;
    var busca = await _dio.get("https://viacep.com.br/ws/$cep/json/");
    asked = CEPModel.fromJson(busca.data);

    localidadeController.text = asked.localidade!;
    logradouroController.text = asked.logradouro!;
    bairroController.text = asked.bairro!;
    ufController.text = asked.uf!;

    isLoading = false;
    saveButton = logradouroController.text != "";
    setState(() {});
  }

  cepOnChange(String value) {
    bool exists = widget.allData!.map((e) => e.cep).toList().contains(value);
    if (value.length == 8 && isLoading == false && exists == false) {
      cepSearch(value);
    } else if (value.length == 8 && isLoading == false && exists == true) {
      Results asked = widget.allData!.where((e) => e.cep == value).first;
      localidadeController.text = asked.localidade!;
      logradouroController.text = asked.logradouro!;
      bairroController.text = asked.bairro!;
      ufController.text = asked.uf!;
      saveButton = false;
    } else {
      saveButton = false;
    }
    setState(() {});
  }

  othersOnChabged(String str) {
    bool logradouro = logradouroController.text == widget.dataCEP!.logradouro!;
    bool bairro = bairroController.text == widget.dataCEP!.logradouro!;
    bool localidade = localidadeController.text == widget.dataCEP!.localidade!;
    bool uf = ufController.text == widget.dataCEP!.uf!;

    if ([logradouro, bairro, localidade, uf].every((element) => element)) {
      saveButton = false;
    } else {
      saveButton = true;
    }
    setState(() {});
  }

  pop() {
    widget.parentSetState();
    Navigator.pop(context);
  }

  action() async {
    if (hasData && saveButton) {
      await back4App.update(widget.dataCEP!.objectId!, {
        "cep": cepController.text,
        "logradouro": logradouroController.text,
        "bairro": bairroController.text,
        "uf": ufController.text,
        "localidade": localidadeController.text,
      });
      pop();
    } else if (!hasData && saveButton) {
      await back4App.create(asked);
      pop();
    } else if (!hasData && !saveButton) {
      refresh();
    } else {
      initialData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text((!hasData) ? "Buscar" : "Editar"),
            IconButton(
              onPressed: () => action(),
              icon: Icon(saveButton ? Icons.save : Icons.refresh),
            )
          ]),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                TextField(
                  enabled: !hasData,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "CEP",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  controller: cepController,
                  onChanged: (value) => cepOnChange(value),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  enabled: hasData,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Logradouro",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  controller: logradouroController,
                  onChanged: (value) => othersOnChabged(value),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  enabled: hasData,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Bairro",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  controller: bairroController,
                  onChanged: (value) => othersOnChabged(value),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  enabled: hasData,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Localidade",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  controller: localidadeController,
                  onChanged: (value) => othersOnChabged(value),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  enabled: hasData,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "UF",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  controller: ufController,
                  onChanged: (value) => othersOnChabged(value),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
          ],
        ));
  }
}
