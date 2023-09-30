import 'package:flutter/material.dart';

class PhoneSignup extends StatefulWidget {
  @override
  _PhoneSignupState createState() => _PhoneSignupState();
}

class _PhoneSignupState extends State<PhoneSignup> {

  TextEditingController phoneController = TextEditingController();
  bool phoneValido = false;
  bool erro = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.white,

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
                "Cadastre-se com seu telefone.",
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
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Digite o Telefone:",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  // Validação do e-mail
                  phoneValido = isValidPhone(value);
                  erro = false; // Verifica se o e-mail é válido
                });
              },
            ),
            if (erro)
              Text(
                "Por favor, insira um e-mail válido.",
                style: TextStyle(
                  color: Colors.red, // Cor vermelha para indicar o erro
                ),
              ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: Text(
                "Continuar"
              ),
              onPressed: () {
                if (phoneValido){
                  Navigator.pushNamed(context, "/name");
                } else{
                  setState(() {
                    erro = true;
                  });
                }
              }  
            ),
            ElevatedButton(
              child: Text(
                "Cadastrar de outra maneira"
              ),
              onPressed: () {
                Navigator.pop(context);
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
    );
  }

  bool isValidPhone(String phoneNumber) {
    return phoneNumber.isNotEmpty &&
    !phoneNumber.contains(RegExp(r'[A-Za-z]'));
  }
}