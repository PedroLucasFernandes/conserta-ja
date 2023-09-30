import 'package:flutter/material.dart';

class Name extends StatelessWidget {

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
              child: Text(
                "Sou cliente"
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
            SizedBox(height: 12,),
            ElevatedButton(
              child: Text(
                "Sou prestador de serviços"
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
          ],
        ),
      ),
    );
  }
}