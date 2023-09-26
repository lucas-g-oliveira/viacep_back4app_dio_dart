class EnderecoModel {
  List<Results>? results;

  EnderecoModel({this.results});

  EnderecoModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? objectId;
  String? cep;
  String? logradouro;
  String? bairro;
  String? estado;
  String? uF;
  int? ddd;
  String? cidade;
  String? createdAt;
  String? updatedAt;

  Results(
      {this.objectId,
      this.cep,
      this.logradouro,
      this.bairro,
      this.estado,
      this.uF,
      this.ddd,
      this.cidade,
      this.createdAt,
      this.updatedAt});

  Results.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    cep = json['cep'];
    logradouro = json['logradouro'];
    bairro = json['bairro'];
    estado = json['estado'];
    uF = json['UF'];
    ddd = json['ddd'];
    cidade = json['cidade'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['objectId'] = objectId;
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['bairro'] = bairro;
    data['estado'] = estado;
    data['UF'] = uF;
    data['ddd'] = ddd;
    data['cidade'] = cidade;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
