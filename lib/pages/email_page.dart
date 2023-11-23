import 'package:conserta_ja/widgets/login_button.dart';
import 'package:flutter/material.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({super.key});

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
                "Continue com seu e-mail.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            LoginButton(
              image: "assets/email.png",
              tittle: "Primeira vez aqui? (Cadastro)",
              onPressed: (){
                  Navigator.pushNamed(context, "/email_signup");
              },
            ),
            SizedBox(height: 10,),
            LoginButton(
              image: "assets/email.png",
              tittle: "Já possui uma conta? (Login)",
              onPressed: (){
                  Navigator.pushNamed(context, "/email_login");
              },
            )
          ],
        ),
      ),
    );
  }
}