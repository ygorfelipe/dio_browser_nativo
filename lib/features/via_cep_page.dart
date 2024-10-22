import 'package:dio_browser_nativo/features/via_cep_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ViaCepPage extends StatefulWidget {
  const ViaCepPage({super.key});

  @override
  State<ViaCepPage> createState() => _ViaCepPageState();
}

class _ViaCepPageState extends State<ViaCepPage> {
  final cepEC = TextEditingController();
  final viaCepController = ViaCepController();

  @override
  void dispose() {
    cepEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca de logradouro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: cepEC,
              decoration: const InputDecoration(
                  label: Text('CEP'), border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                viaCepController.getCep(cepEC.text);
              },
              child: const Text('Buscar cep'),
            ),
            const SizedBox(
              height: 16,
            ),
            ValueListenableBuilder(
                valueListenable: viaCepController,
                builder: (_, viaCepControllerValue, child) {
                  return Text(
                    'Logradouro: ${viaCepControllerValue.street}',
                    style: const TextStyle(fontSize: 16),
                  );
                }),
            ValueListenableBuilder(
                valueListenable: viaCepController,
                builder: (_, viaCepControllerValue, child) {
                  return Text(
                    'cidade: ${viaCepControllerValue.city}',
                    style: const TextStyle(fontSize: 16),
                  );
                }),
            ValueListenableBuilder(
                valueListenable: viaCepController,
                builder: (_, viaCepControllerValue, child) {
                  return Text(
                    'cidade: ${viaCepControllerValue.cep}',
                    style: const TextStyle(fontSize: 16),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
