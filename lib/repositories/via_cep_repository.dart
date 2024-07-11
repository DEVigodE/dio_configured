import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_configured/models/address_model.dart';
import 'package:dio_configured/rest_client/dio_rest_client.dart';

class ViaCepRepository {
  Future<AddressModel> getAddress(String cep) async {
    try {
      final restClient = DioRestClient();

      final response = await restClient.get('https://viacep.com.br/ws/$cep/json/');

      if (response.statusCode == 200) {
        final addressModel = AddressModel.fromMap(response.data);
        return (addressModel);
      } else {
        throw Exception('Failed to load address');
      }
    } on DioException catch (e, s) {
      log('Erro ao buscar CEP $cep', error: e, stackTrace: s);
      throw (city: 'Não encontrada', street: 'Não encontrada');
    }
  }
}
