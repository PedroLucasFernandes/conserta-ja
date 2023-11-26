import 'package:conserta_ja/BD/database_helper.dart';
import 'package:conserta_ja/models/user.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class DocumentsPage extends StatefulWidget {
  @override
  _DocumentsPageState createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  XFile? _pickedImage;
  XFile? _pickedImage2;
  XFile? _pickedImage3;
  XFile? _pickedImage4;

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Processo de identificação",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: ListView(
          children : <Widget>[
            Text(
              "O nosso diferencial é a segurança, então realize o processo de identificação para o bem do cliente e do profissional.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:MaterialStatePropertyAll(Color(0XFFFABB5B)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Row(
                    children: [
                      _pickedImage != null
                          ? Image.file(
                              File(_pickedImage!.path),
                              height: 24,
                              width: 24,
                            )
                          : Image.asset(
                              'assets/documento.png',
                              height: 24,
                              width: 24,
                            ),
                      SizedBox(width: 8),
                    ],
                  ),
                  Text(
                    "Você segurando o RG (Frente)",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(width: 32),
                ],
              ),
                onPressed: () async {
                  final picker = ImagePicker();
                  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
        
                  if (pickedFile != null) {
                    setState(() {
                      _pickedImage = pickedFile;
                    });
                  }
                },
              ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0XFFFABB5B)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _pickedImage2 != null
                          ? Image.file(
                              File(_pickedImage2!.path),
                              height: 24,
                              width: 24,
                            )
                          : Image.asset(
                              'assets/documento.png',
                              height: 24,
                              width: 24,
                            ),
                      SizedBox(width: 8),
                    ],
                  ),
                  Text(
                    "Você segurando o RG (Verso)",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(width: 32),
                ],
              ),
              onPressed: () async {
                final picker = ImagePicker();
                final pickedFile = await picker.pickImage(source: ImageSource.gallery);

                if (pickedFile != null) {
                  setState(() {
                    _pickedImage2 = pickedFile;
                  });
                }
              },
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0XFFFABB5B)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _pickedImage3 != null
                          ? Image.file(
                              File(_pickedImage3!.path),
                              height: 24,
                              width: 24,
                            )
                          : Image.asset(
                              'assets/documento.png',
                              height: 24,
                              width: 24,
                            ),
                      SizedBox(width: 8),
                    ],
                  ),
                  Text(
                    "Foto apenas do documento",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(width: 32),
                ],
              ),
              onPressed: () async {
                final picker = ImagePicker();
                final pickedFile = await picker.pickImage(source: ImageSource.gallery);

                if (pickedFile != null) {
                  setState(() {
                    _pickedImage3 = pickedFile;
                  });
                }
              },
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0XFFFABB5B)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _pickedImage4 != null
                          ? Image.file(
                              File(_pickedImage4!.path),
                              height: 24,
                              width: 24,
                            )
                          : Image.asset(
                              'assets/perfil.png',
                              height: 24,
                              width: 24,
                            ),
                      SizedBox(width: 8),
                    ],
                  ),
                  Text(
                    "Sua foto (será usada no perfil)",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(width: 32),
                ],
              ),
              onPressed: () async {
                final picker = ImagePicker();
                final pickedFile = await picker.pickImage(source: ImageSource.gallery);

                if (pickedFile != null) {
                  setState(() {
                    _pickedImage4 = pickedFile;
                  });
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 45,
                horizontal: 82,
              ),
              child: Text(
                "Por gentileza, verifique se os documentos estão legíveis.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45,
              ),
              child: ElevatedButton(
                onPressed: () async {     
                  if (_pickedImage != null && _pickedImage2 != null && _pickedImage3 != null && _pickedImage4 != null) {
                    await DatabaseHelper().insertUser(args);
                    
                    Navigator.pushNamed(context, "/home_page");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Envie todas as imagens necessárias'),
                        backgroundColor: Colors.red,
                      ),
                    );
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
            ),
            ElevatedButton(
              child: Text(
                "Cadastrar de outra maneira",
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
    );
  }
}