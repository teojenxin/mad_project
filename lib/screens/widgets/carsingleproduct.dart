import 'package:flutter/material.dart';

class CartSingleProduct extends StatefulWidget {
  final String name;
  final String image;
  int quantity;
  final double price;
  CartSingleProduct({this.name , this.image , this.quantity , this.price});

  @override
  _CartSingleProductState createState() => _CartSingleProductState();
}


class _CartSingleProductState extends State<CartSingleProduct> {
  @override
  Widget build(BuildContext context) {
    return Container( 
            height: 120,
            width: double.infinity,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(widget.image),
                          ),
                        ),
                      ),
                      Container(
                        height: 110,
                        width: 200,
                        child: ListTile(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(widget.name),
                              Text("Cloths"),
                              Text(
                                "\$${widget.price.toString()}",
                                style: TextStyle(
                                    color: Color(0xff),
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 35,
                                width: 130,
                                color: Color(0xff),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    GestureDetector(
                                      child: Icon(Icons.remove),
                                      onTap: () {
                                        setState(() {
                                          if (widget.quantity > 1) {
                                            widget.quantity--;
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      widget.quantity.toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    GestureDetector(
                                      child: Icon(Icons.add),
                                      onTap: () {
                                        setState(() {
                                          widget.quantity++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );

  }
}