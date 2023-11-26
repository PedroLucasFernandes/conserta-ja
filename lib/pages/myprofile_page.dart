import 'package:conserta_ja/BD/database_helper.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  late Map<String, dynamic> userData;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    super.didChangeDependencies();
    
    DatabaseHelper().getUserByIdentifier(args).then((user) {
      if (user != null) {
        setState(() {
          userData = user;
        });
      } else {
        
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFCEA169),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 45.0,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Meu Perfil:",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  width: 218,
                  height: 204,
                  child: ClipOval(
                    child: Image.asset(
                      "assets/perfil.png",
                      fit: BoxFit.cover,
                      color: Colors.black,  
                    ),
                  ),
                ),
                Text(
                  userData['name'],
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 35,),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: (){
      
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    child: Text(
                      "Alterar E-mail",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    child: Text(
                      "Alterar Telefone",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pushReplacementNamed("/login_page"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    child: Text(
                      "Fazer Logout",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}