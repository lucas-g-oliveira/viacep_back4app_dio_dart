import 'package:flutter/material.dart';
import 'package:viacep_back4app_dio_dart/back4app/endereco_back4app_model.dart';
import 'package:viacep_back4app_dio_dart/pages/edit_and_add_cep.dart';

Widget cepTileList(BuildContext context, Results data, Function stateParent) {
  const List<String> keys = ["Logradouro", "Localidade", "Bairro", "UF", "CEP"];

  List<String> values = [
    data.logradouro!,
    data.localidade!,
    data.bairro!,
    data.uf!,
    data.cep!
  ];

  return GestureDetector(
    onLongPress: () => {},
    child: Card(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                  children: keys
                      .map(
                        (e) => Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                "$e: ",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Expanded(
                                flex: 5, child: Text(values[keys.indexOf(e)]))
                          ],
                        ),
                      )
                      .toList()),
            ),
            IconButton(
                // ignore: avoid_print
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => EditAndSaveScreen(
                              dataCEP: data,
                              parentSetState: stateParent,
                            ))),
                icon: const Icon(
                  Icons.edit_outlined,
                  color: Colors.grey,
                ))
          ]),
    ),
  );
}
