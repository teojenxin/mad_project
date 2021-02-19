import 'package:flutter/material.dart';
import 'package:project_mad/provider/product_provider.dart';
import 'package:project_mad/screens/widgets/carsingleproduct.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final TextStyle myStyle = TextStyle(
    fontSize: 18,
  );

  ProductProvider productProvider;
  Widget _buildBottomDetail({String startName, String endName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          startName,
          style: myStyle,
        ),
        Text(
          endName,
          style: myStyle,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Checked Out",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          color: Color(0xff),
          child: Text("Buy", style: TextStyle(color: Colors.white)),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListView.builder(
                itemCount: productProvider.getCartModelListLength,
                itemBuilder: (ctx, index) {
                  return CartSingleProduct(
                    image: productProvider.getCartModelList[index].image,
                    name: productProvider.getCartModelList[index].name,
                    price: productProvider.getCartModelList[index].price,
                    quantity: productProvider.getCartModelList[index].quantity,
                  );
                }),
            Container(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildBottomDetail(
                    startName: "Your Price",
                    endName: "\$ 60.0",
                  ),
                  _buildBottomDetail(
                    startName: "Discount",
                    endName: "3%",
                  ),
                  _buildBottomDetail(
                    startName: "Shiping",
                    endName: "\$ 60.0",
                  ),
                  _buildBottomDetail(
                    startName: "Total",
                    endName: "\$ 120",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
