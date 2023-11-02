import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InformationPage extends StatefulWidget {
  InformationPage({Key? key}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final TextEditingController _dateController = TextEditingController();
  final _dateMaskFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Cadastro de novo usuário",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: () {
          Navigator.of(context).pop();
        },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                child: Text(
                  "Informações para o perfil:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Seu nome completo",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Seu nome não pode ser vazio';
                  }
                  if (value.contains(RegExp(r'[0-9]'))) {
                    return 'Seu nome não pode conter números';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.datetime,
                controller: _dateController,
                inputFormatters: [_dateMaskFormatter],
                decoration: InputDecoration(
                  labelText: "Sua data de nascimento (DD/MM/AAAA)",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira sua data de nascimento no formato DD/MM/AAAA';
                  }
      
                  final datePattern = r'^\d{2}/\d{2}/\d{4}$';
      
                  if (!RegExp(datePattern).hasMatch(value)) {
                    return 'Formato de data inválido. Use DD/MM/AAAA';
                  }
      
                  final parts = value.split('/');
      
                  final day = int.tryParse(parts[0]);
                  final month = int.tryParse(parts[1]);
                  final year = int.tryParse(parts[2]);
      
                  if (day == null || month == null || year == null) {
                    return 'Data inválida';
                  }
      
                  if (day < 1 || day > 31 || month < 1 || month > 12 || year < 1900 || year > 2100) {
                    return 'Data fora dos limites válidos';
                  }
      
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 60,
                  bottom: 15,
                  left: 30,
                  right: 30,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, "/home_page");
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  child: Text(
                    "Sou cliente",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, "/home_page");
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  child: Text(
                    "Sou prestador de serviços",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),             
            ],
          ),
        ),
      ),
    );
  }
}