import 'package:dio_configured/screens/via_cep_controller.dart';
import 'package:flutter/material.dart';

class ViaCepScreen extends StatefulWidget {
  const ViaCepScreen({super.key});

  @override
  State<ViaCepScreen> createState() => _ViaCepScreenState();
}

class _ViaCepScreenState extends State<ViaCepScreen> {
  final cepEC = TextEditingController();
  final controller = ViaCepController();

  @override
  void dispose() {
    cepEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Busca Endereço'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: cepEC,
                decoration: const InputDecoration(
                  labelText: 'CEP',
                  hintText: 'Digite o CEP',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    controller.getAddress(cepEC.text);
                  },
                  child: const Text('Buscar CEP')),
              const SizedBox(height: 16),
              ValueListenableBuilder(
                valueListenable: controller,
                builder: (_, controllerValue, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: controllerValue.cep != '',
                        child: CustomTextFieldWidget(desc: "CEP:", value: controllerValue.cep!),
                      ),
                      Visibility(
                        visible: controllerValue.logradouro != '',
                        child: CustomTextFieldWidget(desc: "Logradouro/Endereço:", value: controllerValue.logradouro!),
                      ),
                      Visibility(
                        visible: controllerValue.complemento != '',
                        child: CustomTextFieldWidget(desc: "Complemento:", value: controllerValue.complemento!),
                      ),
                      Visibility(
                        visible: controllerValue.unidade != '',
                        child: CustomTextFieldWidget(desc: "Unidade:", value: controllerValue.unidade!),
                      ),
                      Visibility(
                        visible: controllerValue.bairro != '',
                        child: CustomTextFieldWidget(desc: "Bairro:", value: controllerValue.bairro!),
                      ),
                      Visibility(
                        visible: controllerValue.localidade != '',
                        child: CustomTextFieldWidget(desc: "Cidade:", value: controllerValue.localidade!),
                      ),
                      Visibility(
                        visible: controllerValue.uf != '',
                        child: CustomTextFieldWidget(desc: "UF:", value: controllerValue.uf!),
                      ),
                      Visibility(
                        visible: controllerValue.ibge != '',
                        child: CustomTextFieldWidget(desc: "IBGE:", value: controllerValue.ibge!),
                      ),
                      Visibility(
                        visible: controllerValue.gia != '',
                        child: CustomTextFieldWidget(desc: "GIA:", value: controllerValue.gia!),
                      ),
                      Visibility(
                        visible: controllerValue.ddd != '',
                        child: CustomTextFieldWidget(desc: "DDD:", value: controllerValue.ddd!),
                      ),
                      Visibility(
                        visible: controllerValue.siafi != '',
                        child: CustomTextFieldWidget(desc: "SIAFI:", value: controllerValue.siafi!),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldWidget extends StatelessWidget {
  CustomTextFieldWidget({
    super.key,
    required this.desc,
    required this.value,
  });

  final String desc;
  final String value;
  final textEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        enabled: false,
        controller: textEC..text = value,
        decoration: InputDecoration(
          labelText: desc,
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          border: const OutlineInputBorder(),
        ),
        style: TextStyle(
          color: Theme.of(context).colorScheme.shadow,
        ),
      ),
    );
  }
}
