import 'dart:convert';

import 'package:collection/collection.dart';

class AddressModel {
  final String? cep;
  final String? logradouro;
  final String? complemento;
  final String? unidade;
  final String? bairro;
  final String? localidade;
  final String? uf;
  final String? ibge;
  final String? gia;
  final String? ddd;
  final String? siafi;

  const AddressModel({
    this.cep,
    this.logradouro,
    this.complemento,
    this.unidade,
    this.bairro,
    this.localidade,
    this.uf,
    this.ibge,
    this.gia,
    this.ddd,
    this.siafi,
  });

  @override
  String toString() {
    return 'AddressModel(cep: $cep, logradouro: $logradouro, complemento: $complemento, unidade: $unidade, bairro: $bairro, localidade: $localidade, uf: $uf, ibge: $ibge, gia: $gia, ddd: $ddd, siafi: $siafi)';
  }

  factory AddressModel.fromMap(Map<String, dynamic> data) => AddressModel(
        cep: data['cep'] as String?,
        logradouro: data['logradouro'] as String?,
        complemento: data['complemento'] as String?,
        unidade: data['unidade'] as String?,
        bairro: data['bairro'] as String?,
        localidade: data['localidade'] as String?,
        uf: data['uf'] as String?,
        ibge: data['ibge'] as String?,
        gia: data['gia'] as String?,
        ddd: data['ddd'] as String?,
        siafi: data['siafi'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'cep': cep,
        'logradouro': logradouro,
        'complemento': complemento,
        'unidade': unidade,
        'bairro': bairro,
        'localidade': localidade,
        'uf': uf,
        'ibge': ibge,
        'gia': gia,
        'ddd': ddd,
        'siafi': siafi,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AddressModel].
  factory AddressModel.fromJson(String data) {
    return AddressModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AddressModel] to a JSON string.
  String toJson() => json.encode(toMap());

  AddressModel copyWith({
    String? cep,
    String? logradouro,
    String? complemento,
    String? unidade,
    String? bairro,
    String? localidade,
    String? uf,
    String? ibge,
    String? gia,
    String? ddd,
    String? siafi,
  }) {
    return AddressModel(
      cep: cep ?? this.cep,
      logradouro: logradouro ?? this.logradouro,
      complemento: complemento ?? this.complemento,
      unidade: unidade ?? this.unidade,
      bairro: bairro ?? this.bairro,
      localidade: localidade ?? this.localidade,
      uf: uf ?? this.uf,
      ibge: ibge ?? this.ibge,
      gia: gia ?? this.gia,
      ddd: ddd ?? this.ddd,
      siafi: siafi ?? this.siafi,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AddressModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      cep.hashCode ^
      logradouro.hashCode ^
      complemento.hashCode ^
      unidade.hashCode ^
      bairro.hashCode ^
      localidade.hashCode ^
      uf.hashCode ^
      ibge.hashCode ^
      gia.hashCode ^
      ddd.hashCode ^
      siafi.hashCode;
}
