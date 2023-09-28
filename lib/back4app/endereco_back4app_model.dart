// ignore_for_file: unnecessary_this, unnecessary_new

class EnderecoModel {
  List<Results> results = [];

  EnderecoModel({required this.results});

  EnderecoModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.results != [null]) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? objectId;
  String? cep;
  String? logradouro;
  String? bairro;
  String? uf;
  String? localidade;
  String? createdAt;
  String? updatedAt;

  Results(
      {this.objectId,
      this.cep,
      this.logradouro,
      this.bairro,
      this.uf,
      this.localidade,
      this.createdAt,
      this.updatedAt});

  Results.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    cep = json['cep'];
    logradouro = json['logradouro'];
    bairro = json['bairro'];
    uf = json['uf'];
    localidade = json['localidade'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = this.objectId;
    data['cep'] = this.cep;
    data['logradouro'] = this.logradouro;
    data['bairro'] = this.bairro;
    data['uf'] = this.uf;
    data['localidade'] = this.localidade;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
