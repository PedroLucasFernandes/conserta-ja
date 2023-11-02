import 'package:flutter/material.dart';

class EmailSignup extends StatefulWidget {
  @override
  _EmailSignupState createState() => _EmailSignupState();
}

class _EmailSignupState extends State<EmailSignup> {

  TextEditingController emailController = TextEditingController();
  bool emailValido = false;
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
                "Cadastre-se com seu e-mail.",
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
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Digite o E-mail:",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  // Validação do e-mail
                  emailValido = isValidEmail(value);
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
              onPressed: () {
                if (emailValido){
                  Navigator.pushNamed(context, "/name");
                } else{
                  setState(() {
                    erro = true;
                  });
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black)
              ),
              child: Text(
                "Continuar",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
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
              child: Text(
                "Cadastrar de outra maneira",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    return email.contains('@') &&
    !email.contains(' ');
  }
}
