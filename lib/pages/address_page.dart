import 'package:conserta_ja/BD/database_helper.dart';
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

  final streetController = TextEditingController();
  final blockController = TextEditingController();
  final districtController = TextEditingController();
  final cityController = TextEditingController();

  late Map<String, dynamic> userData;

  @override
  void initState() {
    super.initState();
    userData = {'email': "", 'phone': ""};
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    super.didChangeDependencies();
    
    DatabaseHelper().getUserByIdentifier(args).then((user) {
      if (user != null) {
        setState(() {
          userData = user;
        });
      } else {
        
      }
    });
  }

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
                  keyboardType: TextInputType.number,
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
                  controller: streetController,
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
                  controller: blockController,
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
                  controller: districtController,
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
                  controller: cityController,
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
                    onPressed: () async {
                      if (_formKey.currentState != null && _formKey.currentState!.validate()) {

                        Map<String, dynamic> addressData = {
                          'cep': cepController.text,
                          'street': streetController.text,
                          'block': blockController.text,
                          'district': districtController.text, 
                          'city': cityController.text
                        };

                        await DatabaseHelper().updateUserAddress(
                          userData['email'] == "" ? userData['phone'] : userData['email'],
                          addressData
                        );

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