import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

final _formKey = GlobalKey<FormState>();

class _AddressPageState extends State<AddressPage> {

  final cepController = TextEditingController();
  final maskFormatter = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFCEA169),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 45.0,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Confirme seu endereço:",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: cepController,
                  inputFormatters: [maskFormatter],
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "CEP:",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                        return 'CEP não pode ser vazio';
                      }
                      if (value.length != 9) {
                        return 'CEP incompleto. Digite os 8 dígitos.';
                      }
                      return null;
                    },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Rua, Número:",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira uma Rua e Número';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Bloco, Número (Se morar em prédio):",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Bairro:",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira um Bairro';
                    }
                    if (value.contains(RegExp(r'[0-9]'))) {
                      return 'Bairro não pode conter números';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Cidade/Estado:",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira uma Cidade e um estado';
                    }
                    if (value.contains(RegExp(r'[0-9]'))) {
                      return 'Cidade e estado não podem conter números';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25,),
                Container(
                  width: 200,
                  child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Color(0XFFCEA169))
                  ),
                  child: Text(
                    "Continuar",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}