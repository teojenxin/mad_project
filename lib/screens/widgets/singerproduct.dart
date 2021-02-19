import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  final double price;
  final String name;
  SingleProduct({this.image, this.name, this.price});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 200,
            width: 168,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                  height: 140,
                  width: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(image),
                    ),
                  ),
                ),
                ),
            
                Text(
                   "\$ ${price.toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xff9b)),
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
