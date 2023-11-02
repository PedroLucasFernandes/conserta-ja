import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {

  final String tittle;
  final String image;
  final VoidCallback onPressed;

  const LoginButton({
      super.key,
      required this.image, 
      required this.tittle,
      required this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Row(
          children: [
            Image.asset(
              image,
              height: 24,
              width: 24,
            ),
            SizedBox(width: 8),
          ],
        ),
        Text(
          tittle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 32),
      ],
    ),
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:MaterialStatePropertyAll(Color(0XFFFABB5B)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}