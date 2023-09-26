class CEPModel {
  String? cep;
  String? logradouro; //rua
  String? bairro;
  String? localidade; //cidade
  String? uf;

  CEPModel({this.cep, this.logradouro, this.bairro, this.localidade, this.uf});

  CEPModel.fromJson(Map<String, dynamic> json) {
    cep = json['cep'];
    logradouro = json['logradouro'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    return data;
  }
}
