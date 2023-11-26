import 'package:conserta_ja/BD/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneLogin extends StatefulWidget {
  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

final _formKey = GlobalKey<FormState>();

class _PhoneLoginState extends State<PhoneLogin> {
  final phoneController = TextEditingController();
  final maskFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                width: 128,
                height: 128,
                child: Image.asset("assets/consertaja.png"),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Login via telefone.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: phoneController,
                inputFormatters: [maskFormatter],
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Digite o Telefone: (00) 12345-6789",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
          
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira um número no formato (00) 12345-6789';
                  }
          
                  final phonePattern = r'^\(\d{2}\) \d{5}-\d{4}$';
          
                  if (!RegExp(phonePattern).hasMatch(value)) {
                    return 'Formato de telefone inválido. Use (00) 12345-6789';
                  }
          
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'A senha deve conter entre 8 e 24 caracteres';
                  }
                  if (value.length < 8 || value.length > 24) {
                    return 'A senha deve conter entre 8 e 24 caracteres';
                  }
                  return null;
                },
                obscureText: true,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    String phone = phoneController.text;
                    String password = passwordController.text;

                    bool loginSuccess = await DatabaseHelper().loginUserPhone(
                      phone: phone,
                      password: password,
                    );

                    if (loginSuccess) {
                      Navigator.pushNamedAndRemoveUntil(context, "/home_page", arguments: phone, (Route<dynamic> route) => false);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Telefone ou senha incorretos. Tente novamente.'),
                        ),
                      );
                    }
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black)
                ),
                child: Text(
                  "Continuar",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
              ElevatedButton(
                child: Text(
                  "Continuar de outra maneira",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/login_page");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.white,
                  ),
                  elevation: MaterialStatePropertyAll(
                    0,
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
