import 'package:flutter/material.dart';

class NamedBox extends StatelessWidget {

  final String name;
  final String image;
  final double? stars;

  const NamedBox({
      super.key,
      required this.image, 
      required this.name,
      this.stars 
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 12,),
          InkWell(
            onTap: () {
              
            },
            child: Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  image,
                  width: 62,
                  height: 62,
                ),
              ),
            ),
          ),
          SizedBox(height: 4,),
          Row(
            children: [
              stars != null
              ? Text(
                  "$name | $stars ☆",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                )
              :
              Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}