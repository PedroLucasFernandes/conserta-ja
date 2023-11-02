import 'package:conserta_ja/widgets/login_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Column(
                children: [
                  Text(
                    "Seja bem-vindo(a)!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Conecte sua conta.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            LoginButton(
              image: "assets/google.png",
              tittle: "Continuar com Google",
              onPressed: (){

              },
            ),
            SizedBox(height: 10),
            LoginButton(
              image: "assets/facebook.png",
              tittle: "Continuar com Facebook",
              onPressed: (){

              },
            ),
            SizedBox(height: 10),
            LoginButton(
              image: "assets/email.png",
              tittle: "Continuar com E-mail",
              onPressed: (){
                Navigator.pushNamed(context, "/email_signup");
              },
            ),
            SizedBox(height: 10,),            
            LoginButton(
              image: "assets/telefone.png",
              tittle: "Continuar com Telefone",
              onPressed: (){
                Navigator.pushNamed(context, "/phone_signup");
              },
            ),
          ],
        ),
      ),
    );
  }
}
