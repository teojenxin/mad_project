import 'package:flutter/material.dart';
import 'package:project_mad/model/categoryicon.dart';
import 'package:project_mad/provider/category_provider.dart';
import 'package:project_mad/provider/product_provider.dart';
import 'package:project_mad/screens/detailsscreen.dart';
import 'package:project_mad/screens/listproduct.dart';
import 'package:project_mad/screens/widgets/singerproduct.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:provider/provider.dart';
import '../model/product.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Product shirt;
Product watch;
CategoryProvider categoryProvider;
ProductProvider productProvider;

var featureSnapShot;
var newAchivesSnapShot;
var tie;
var shirts;
var pants;
var shoes;
var dress;

Product mouse;
Product mornitor;

class _HomePageState extends State<HomePage> {
  Widget _buildCategoryProduct({String image, int color}) {
    return CircleAvatar(
      maxRadius: 35,
      backgroundColor: Color(color),
      child: Container(
        height: 40,
        child: Image(
          color: Colors.white,
          image: NetworkImage(image),
        ),
      ),
    );
  }

  bool homeColor = true;

  bool cartColor = false;

  bool aboutColor = false;

  bool contactusColor = false;
  Widget _buildMyDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "JENXIN",
              style: TextStyle(color: Colors.black),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/man.jpg"),
            ),
            decoration: BoxDecoration(color: Color(0xfff)),
            accountEmail: Text("teojenxin@gmail.com",
                style: TextStyle(color: Colors.black)),
          ),
          ListTile(
            selected: homeColor,
            onTap: () {
              setState(() {
                homeColor = true;
                contactusColor = false;
                cartColor = false;
                aboutColor = false;
              });
            },
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            selected: cartColor,
            onTap: () {
              setState(() {
                cartColor = true;
                homeColor = false;
                contactusColor = false;
                aboutColor = false;
              });
            },
            leading: Icon(Icons.shopping_cart),
            title: Text("Cart"),
          ),
          ListTile(
            selected: aboutColor,
            onTap: () {
              setState(() {
                aboutColor = true;
                homeColor = false;
                contactusColor = false;
                cartColor = false;
              });
            },
            leading: Icon(Icons.info),
            title: Text("About"),
          ),
          ListTile(
            selected: contactusColor,
            onTap: () {
              setState(() {
                contactusColor = true;
                homeColor = false;
                cartColor = false;
                aboutColor = false;
              });
            },
            leading: Icon(Icons.phone),
            title: Text("Contact Us"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }

  Widget _buidImageSlider() {
    return Container(
      height: 300,
      child: Carousel(
        autoplay: true,
        showIndicator: false,
        images: [
          AssetImage("images/shoe_icon.png"),
          AssetImage("images/pants.png"),
        ],
      ),
    );
  }

  Widget _buildCategory() {
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Categories",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 60,
          child: Row(
            children: <Widget>[
              _buildDressIcon(),
              _buildShirtIcon(),
              _buildPantIcon(),
              _buildShoeIcon(),
              _buildTieIcon(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDressIcon() {
    List<CategoryIcon> dressIcon = categoryProvider.getDressiconData;
    List<Product> dress = categoryProvider.getDressList;
    return Row(
        children: dressIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "Dress",
                snapShot: dress,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(image: e.image, color: 0xFF4FC3F7),
      );
    }).toList());
  }

  Widget _buildShirtIcon() {
    List<Product> shirts = categoryProvider.getShirtList;
    List<CategoryIcon> shirtIcon = categoryProvider.getshirticonData;
    return Row(
        children: shirtIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "Shirt",
                snapShot: shirts,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(image: e.image, color: 0xFF4FC3F7),
      );
    }).toList());
  }

  Widget _buildPantIcon() {
    List<Product> pant = categoryProvider.getShirtList;
    List<CategoryIcon> pantIcon = categoryProvider.getpanticonData;
    return Row(
        children: pantIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "Pant",
                snapShot: pant,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(image: e.image, color: 0xFF4FC3F7),
      );
    }).toList());
  }

  Widget _buildShoeIcon() {
    List<Product> shoes = categoryProvider.getshoesList;
    List<CategoryIcon> shoeIcon = categoryProvider.getShoesiconData;
    return Row(
        children: shoeIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "shoes",
                snapShot: shoes,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(image: e.image, color: 0xFF4FC3F7),
      );
    }).toList());
  }

  Widget _buildTieIcon() {
    List<Product> tie = categoryProvider.getTieList;
    List<CategoryIcon> tieIcon = categoryProvider.gettieiconData;
    return Row(
        children: tieIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "Tie",
                snapShot: tie,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(image: e.image, color: 0xFF4FC3F7),
      );
    }).toList());
  }

  Widget _buildFeatured() {
    List<Product> featureProduct;
    List<Product> homeFeatureProducts;
    homeFeatureProducts = productProvider.getHomeFeatureList;

    featureProduct = productProvider.getFeaturedList;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Featured",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => ListProduct(
                      name: "Featured",
                      snapShot: featureProduct,
                    ),
                  ),
                );
              },
              child: Text(
                "View More",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
            children: homeFeatureProducts.map((e) {
          return Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => DetailScreen(
                            image: e.image,
                            price: e.price,
                            name: e.name,
                          ),
                        ),
                      );
                    },
                    child: SingleProduct(
                      image: e.image,
                      price: e.price,
                      name: e.name,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => DetailScreen(
                          image: e.image,
                          price: e.price,
                          name: e.name,
                        ),
                      ),
                    );
                  },
                  child: SingleProduct(
                    image: e.image,
                    price: e.price,
                    name: e.name,
                  ),
                ),
              ],
            ),
          );
        }).toList()),
      ],
    );
  }

  Widget _buildNewAchives() {
    List<Product> newAchivesProduct = productProvider.getnewAchivesList;
    return Column(
      children: <Widget>[
        Container(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "New Achives",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => ListProduct(
                            name: "New Achives",
                            snapShot: newAchivesProduct,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "View More",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => DetailScreen(
                              image: newAchivesProduct.elementAt(0).image,
                              price: newAchivesProduct.elementAt(0).price,
                              name: newAchivesProduct.elementAt(0).name,
                            ),
                          ),
                        );
                      },
                      child: SingleProduct(
                          image: newAchivesProduct.elementAt(0).image,
                          price: newAchivesProduct.elementAt(0).price,
                          name: newAchivesProduct.elementAt(0).name),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => DetailScreen(
                              image: newAchivesProduct.elementAt(1).image,
                              price: newAchivesProduct.elementAt(1).price,
                              name: newAchivesProduct.elementAt(1).name,
                            ),
                          ),
                        );
                      },
                      child: SingleProduct(
                        image: newAchivesProduct.elementAt(1).image,
                        price: newAchivesProduct.elementAt(1).price,
                        name: newAchivesProduct.elementAt(1).name,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of<CategoryProvider>(context);
    categoryProvider.getShirtData();
    categoryProvider.getDressData();
    categoryProvider.getPantData();
    categoryProvider.getTieData();
    categoryProvider.getShoesData();
    productProvider = Provider.of<ProductProvider>(context);
    productProvider.getNewAchiveData();
    productProvider.getFutureData();
    productProvider.getHomeFeaturesData();
    categoryProvider.getDressIcon();
    categoryProvider.getShirtIcon();
    categoryProvider.getPantIcon();
    categoryProvider.getTieIcon();
    categoryProvider.getShoesIcon();

    return Builder(builder: (context) {
      return Scaffold(
        key: _key,
        drawer: _buildMyDrawer(),
        appBar: AppBar(
          title: Text(
            "HomePage",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.grey[100],
          leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                _key.currentState.openDrawer();
              }),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.notifications_none, color: Colors.black),
                onPressed: () {}),
            IconButton(
                icon: Icon(Icons.send, color: Colors.black), onPressed: () {}),
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buidImageSlider(),
                    _buildCategory(),
                    SizedBox(
                      height: 20,
                    ),
                    _buildFeatured(),
                    _buildNewAchives()
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
