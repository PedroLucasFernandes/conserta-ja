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
            ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/google.png',
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 8),
                  ],
                ),
                Text(
                  "Continuar com Google",
                ),
                SizedBox(width: 32),
              ],
            ),
              onPressed: () {
        
              },
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/facebook.png',
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 8),
                  ],
                ),
                Text(
                  "Continuar com Facebook",
                ),
                SizedBox(width: 32),
              ],
            ),
              onPressed: () {
              },
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/email.png',
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 8),
                  ],
                ),
                Text(
                  "Continuar com E-mail",
                ),
                SizedBox(width: 32),
              ],
            ),
              onPressed: () {
                Navigator.pushNamed(context, "/emailsignup");
              },
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),            
            ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/telefone.png',
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 8),
                  ],
                ),
                Text(
                  "Continuar com Telefone",
                ),
                SizedBox(width: 32),
              ],
            ),
              onPressed: () {
                Navigator.pushNamed(context, "/phonesignup");
              },
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}