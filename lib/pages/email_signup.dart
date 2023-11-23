import 'package:conserta_ja/BD/database_helper.dart';
import 'package:flutter/material.dart';

class EmailSignup extends StatefulWidget {
  @override
  _EmailSignupState createState() => _EmailSignupState();
}

final _formKey = GlobalKey<FormState>();

class _EmailSignupState extends State<EmailSignup> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool emailValido = false;
  bool erroEmail = false;
  bool senhaValida = false;
  bool erroSenha = false;

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
                  "Cadastro via e-mail.",
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'O e-mail não pode ser vazio';
                  }
                  if (!value.contains("@")) {
                    return 'Insira um e-mail válido';
                  }
                  return null;
                },
              ),
              if (erroEmail)
                Text(
                  "Por favor, insira um e-mail válido.",
                  style: TextStyle(
                    color: Colors.red,
                  ),
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
                  obscureText: true,
                    validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'A senha deve conter entre 8 e 24 caracteres';
                    }
                    if (value.length < 8 || value.length > 24) {
                      return 'A senha deve conter entre 8 e 24 caracteres';
                    }
                    return null;
                  },
                ),
                if (erroSenha)
                  Text(
                    "A senha deve conter entre 8 e 24 caracteres.",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    String email = emailController.text;
                    String password = passwordController.text;
                    await DatabaseHelper().insertUser(phone: email, password: password);

                    Navigator.pushNamed(context, "/information_page");
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
      ),
    );
  }
}
