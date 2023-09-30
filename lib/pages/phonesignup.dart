import 'package:flutter/material.dart';

class PhoneSignup extends StatelessWidget {

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
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Digite o Telefone:",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
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
        
              },
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
}