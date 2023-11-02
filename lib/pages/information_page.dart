import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Se identifique:"),
      ),
      body : Container(
        padding: EdgeInsets.only(
          top: 30,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children : <Widget>[
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Qual o seu nome completo?",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
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
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                  Navigator.pushNamed(context, "/documents");
              },
            ),
            SizedBox(height: 12,),
            ElevatedButton(
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
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                  Navigator.pushNamed(context, "/documents");
              },
            ),          
          ],
        ),
      ),
    );
  }
}
