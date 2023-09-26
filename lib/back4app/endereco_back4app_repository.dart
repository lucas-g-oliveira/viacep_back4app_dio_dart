import 'package:dio/dio.dart';
import 'package:viacep_back4app_dio_dart/back4app/endereco_back4app_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:viacep_back4app_dio_dart/viacep/cep_model.dart';

class EnderecosBack4App {
  Dio _dio = Dio();

  EnderecosBack4App() {
    String header1 = "X-Parse-REST-API-Key";
    String header2 = "X-Parse-Application-Id";
    String header3 = "application/json";
    String baseURL = "BASE-URL";

    _dio.options.headers[header1] = dotenv.get(header1);
    _dio.options.headers[header2] = dotenv.get(header2);
    _dio.options.headers[header3] = dotenv.get(header3);
    _dio.options.baseUrl = dotenv.get(baseURL);
  }

  Future<EnderecoModel> getAll() async {
    var response = await _dio.get("/");
    return EnderecoModel.fromJson(response.data);
  }

  Future<EnderecoModel> getByCEP(String cep) async {
    var response = await _dio.get("?where={cep: $cep}");
    return EnderecoModel.fromJson(response.data);
  }

  Future<bool> deleteById(String id) async {
    var response = await _dio.delete("/$id");
    return response.statusCode == 202;
  }

  Future<bool> create(CEPModel adress) async {
    var response = await _dio.post("/", data: {
      "cep": adress.cep,
      "logradouro": adress.logradouro,
      "bairro": adress.bairro,
      "uf": adress.uf,
      "localidade": adress.localidade,
    });
    return response.statusCode == 201;
  }

  Future<bool> update(Map<String, dynamic> param) async {
    var response = await _dio.put("/", data: param);
    return response.statusCode == 201;
  }
}
