import 'package:flutter/material.dart';
import 'package:viacep_back4app_dio_dart/back4app/endereco_back4app_model.dart';

Widget cepTileList(BuildContext context, Results data) {
  const List<String> keys = ["Logradouro", "Localidade", "Bairro", "UF", "CEP"];

  List<String> values = [
    data.logradouro!,
    data.localidade!,
    data.bairro!,
    data.uf!,
    data.cep!
  ];

/*
            Column(
              children: keys.map((e) => Text(e)).toList(),
            ),
            Column(
              children: keys.map((e) => Text(values[keys.indexOf(e)])).toList(),
            )
*/

  return GestureDetector(
      onTap: () => {},
      child: Card(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                  onPressed: () => print(data.objectId),
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                  ))
            ]),
      ));
}
