import 'package:flutter/material.dart';
import 'package:project_mad/model/product.dart';
import 'package:project_mad/screens/widgets/singerproduct.dart';

class ListProduct extends StatelessWidget {
  final String name;
  final List<Product> snapShot;
  ListProduct({this.name, this.snapShot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        
            
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
              icon: Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {}),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    height: 600,
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      scrollDirection: Axis.vertical,
                      children: snapShot
                      .map(
                        (e) => SingleProduct(
                          price: e.price,
                          image: e.image,
                          name: e.name,
                        ),
                      )
                        
                        .toList(),
                      
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
