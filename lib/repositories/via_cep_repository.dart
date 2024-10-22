import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_browser_nativo/rest_cliente/dio_rest_cliente.dart';

class ViaCepRepository {
  Future<({String city, String street, String cep})> getCep(String cep) async {
    try {
      final restCliente = DioRestCliente();

      final Response(:data) =
          await restCliente.get('https://viacep.com.br/ws/$cep/json/');

      return (
        city: data['localidade'] as String,
        street: data['logradouro'] as String,
        cep: data['cep'] as String
      );
    } on DioException catch (e, s) {
      log('Erro ao buscar CEP $cep', error: e, stackTrace: s);
      throw (
        city: 'Não encontrada',
        street: 'Não encontrada',
        cep: 'Não encontrada'
      );
    }
  }
}
