import 'package:conserta_ja/widgets/named_box.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                  ElevatedButton(
                    onPressed: (){

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
                      Navigator.of(context).pushNamed("/myprofile_page");
                    },
                    child: Icon(
                      Icons.person,
                      color: Color(0XFFCEA169),
                      size: 45.0,
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
                  Container(
                    width: 273,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Color(0XFFCEA169),
                      borderRadius: BorderRadius.circular(15),
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
