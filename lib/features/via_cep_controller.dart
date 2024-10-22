import 'package:dio_browser_nativo/repositories/via_cep_repository.dart';
import 'package:flutter/material.dart';

class ViaCepController
    extends ValueNotifier<({String city, String street, String cep})> {
  ViaCepController() : super((city: '', street: '', cep: ''));

  final repository = ViaCepRepository();

  Future<void> getCep(String cep) async {
    //* alterando o estado do valueNotifier (APENAS COM O VALUE NOTIFIER)
    value = await repository.getCep(cep);
  }
}
