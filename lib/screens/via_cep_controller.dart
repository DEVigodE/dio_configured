import 'package:dio_configured/models/address_model.dart';
import 'package:dio_configured/repositories/via_cep_repository.dart';
import 'package:flutter/material.dart';

class ViaCepController extends ValueNotifier<AddressModel> {
  ViaCepController() : super(const AddressModel());

  final repository = ViaCepRepository();

  Future<void> getAddress(String cep) async {
    try {
      final result = await repository.getAddress(cep);
      value = result;
    } catch (e) {
      debugPrint('Erro ao buscar CEP $cep');
    }
  }
}
