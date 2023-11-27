import 'dart:io';

import 'package:conserta_ja/BD/database_helper.dart';
import 'package:conserta_ja/widgets/named_box.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? street;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadStreet();
  }

  void loadStreet() async {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    final user = await DatabaseHelper().getUserByIdentifier(args);
    if (user != null && user['street'] != null) {
      setState(() {
        street = user['street'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  street != null && street!.isNotEmpty
                  ?
                  Row (
                    children: [
                      Text(
                        "$street",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 8,),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.create,
                            color: Colors.black,
                            size: 20.0,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "/address_page", arguments: args).then((_) {
                              loadStreet();
                            });
                          },
                        ),
                      ),
                    ],
                  )
                  :
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "/address_page", arguments: args).then((_) {
                        loadStreet();
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Color(0XFFCEA169))
                    ),
                    child: Text(
                      "Confirme seu endereço",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("/myprofile_page", arguments: args);
                    },
                    child: Hero(
                      tag: 'profileImage',
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Color(0XFFCEA169),
                        child: ClipOval(
                          child: FutureBuilder<Map<String, dynamic>?>(
                            future: DatabaseHelper().getUserByIdentifier(args),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                if (snapshot.hasData) {
                                  String? profileImage = snapshot.data!['profileImage'];
                                  if (profileImage != null && profileImage.isNotEmpty) {
                                    return Image.file(
                                      File(profileImage),
                                      fit: BoxFit.cover,
                                      width: 40,
                                      height: 40,
                                    );
                                  }
                                }
                              }
                              return Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 200.0,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "O que você procura hoje?",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.black,  
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NamedBox(
                    image: "assets/eletricista.png",
                    name: "Eletricistas"
                  ),
                  NamedBox(
                    image: "assets/encanador.png",
                    name: "Encanadores"
                  ),
                  NamedBox(
                    image: "assets/pedreiro.png",
                    name: "Pedreiros"
                  ),
                  NamedBox(
                    image: "assets/pintor.png",
                    name: "Pintores"
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NamedBox(
                    image: "assets/consertogeral.png",
                    name: "Gerais"
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                      width: 273,
                      height: 94,
                      decoration: BoxDecoration(
                        color: Color(0XFFCEA169),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Ofertas da semana!",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Acesse já!",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                Image.asset(
                                  "assets/cupom.png",
                                  height: 40,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text(
                    "Últimos serviços:",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NamedBox(
                    image: "assets/perfil.png",
                    name: "Nome 1",
                    stars: 5,
                  ),
                  NamedBox(
                    image: "assets/perfil.png",
                    name: "Nome 1",
                    stars: 4.7,
                  ),
                  NamedBox(
                    image: "assets/perfil.png",
                    name: "Nome 1",
                    stars: 4.9,
                  ),
                  NamedBox(
                    image: "assets/perfil.png",
                    name: "Nome 1",
                    stars: 5,
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text(
                    "Em alta:",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NamedBox(
                    image: "assets/perfil.png",
                    name: "Nome 1",
                    stars: 5,
                  ),
                  NamedBox(
                    image: "assets/perfil.png",
                    name: "Nome 1",
                    stars: 4.7,
                  ),
                  NamedBox(
                    image: "assets/perfil.png",
                    name: "Nome 1",
                    stars: 4.9,
                  ),
                  NamedBox(
                    image: "assets/perfil.png",
                    name: "Nome 1",
                    stars: 5,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NamedBox(
                    image: "assets/perfil.png",
                    name: "Nome 1",
                    stars: 5,
                  ),
                  NamedBox(
                    image: "assets/perfil.png",
                    name: "Nome 1",
                    stars: 4.7,
                  ),
                  NamedBox(
                    image: "assets/perfil.png",
                    name: "Nome 1",
                    stars: 4.9,
                  ),
                  NamedBox(
                    image: "assets/perfil.png",
                    name: "Nome 1",
                    stars: 5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
