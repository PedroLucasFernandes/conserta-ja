import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class Documents extends StatefulWidget {
  @override
  _DocumentsState createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  late CameraController _controller;
  late List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();
    // Inicialize a câmera
    availableCameras().then((availableCameras) {
      cameras = availableCameras;
      if (cameras.isNotEmpty) {
        _controller = CameraController(cameras[0], ResolutionPreset.medium);
        _controller.initialize().then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/documento.png',
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 8),
                  ],
                ),
                Text(
                  "Você segurando o RG (Frente)",
                ),
                SizedBox(width: 32),
              ],
            ),
              onPressed: () {
                if (_controller != null && _controller.value.isInitialized) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraPreview(_controller),
                    ),
                  );
                }
              },
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/documento.png',
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 8),
                  ],
                ),
                Text(
                  "Você segurando o RG (Verso)",
                ),
                SizedBox(width: 32),
              ],
            ),
              onPressed: () {
                if (_controller != null && _controller.value.isInitialized) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraPreview(_controller),
                    ),
                  );
                }
              },
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/documento.png',
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 8),
                  ],
                ),
                Text(
                  "Foto apenas do documento",
                ),
                SizedBox(width: 32),
              ],
            ),
              onPressed: () {
                if (_controller != null && _controller.value.isInitialized) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraPreview(_controller),
                    ),
                  );
                }
              },
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/perfil.png',
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 8),
                  ],
                ),
                Text(
                  "Sua foto (será usada no perfil)",
                ),
                SizedBox(width: 32),
              ],
            ),
              onPressed: () {
                if (_controller != null && _controller.value.isInitialized) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraPreview(_controller),
                    ),
                  );
                }
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