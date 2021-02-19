import 'package:flutter/material.dart';
import 'package:project_mad/model/cartmodel.dart';
import 'package:project_mad/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductProvider with ChangeNotifier{
  List<Product> feature =[];
  Product featureData; 
  List<CartModel> cartModelList = [];
  CartModel cartModel;
  void getCartData({
    String name,
    String image,
    int quantity,
    double price,
  }){
    cartModel = CartModel(
      price: price ,
      name: name ,
      image: image ,
      quantity: quantity
      );
      cartModelList.add(cartModel);
  }
  List<CartModel> get getCartModelList{
    return List.from(cartModelList);
  }

  int get getCartModelListLength{
    return cartModelList.length;
  }



  Future<void> getFutureData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await Firestore.instance
        .collection("product")
        .document("vP7c1N3tb44RF9UJJDal")
        .collection("featureproduct")
        .getDocuments();
    shirtSnapShot.documents.forEach(
      (element) {
        featureData = Product(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
            newList.add(featureData);
      },
    );
    feature = newList;
  }
  List<Product> get getFeaturedList {
    return feature;
  }
  List<Product> get getFeaturedPiece {
    return List.from(feature);
  }

  List<Product> homeFeature = [];
  Product homeFeatureData; 
  Future<void> getHomeFeaturesData() async {
    List<Product> newList = [];
    QuerySnapshot featureSnapShot = await Firestore.instance
        .collection("homefeature")
        .getDocuments();
    featureSnapShot.documents.forEach(
      (element) {
        featureData = Product(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
            newList.add(featureData);
      },
    );
    homeFeature = newList;
  }
  List<Product> get getHomeFeatureList{
    return homeFeature;
  }

  
  List<Product> newAchives = [];
  Product newAchivesData; 
  Future<void> getNewAchiveData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await Firestore.instance
        .collection("product")
        .document("vP7c1N3tb44RF9UJJDal")
        .collection("newachives")
        .getDocuments();
    shirtSnapShot.documents.forEach(
      (element) {
        newAchivesData = Product(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
            newList.add(newAchivesData);
      },
    );
    newAchives = newList;
  }
  List<Product> get getnewAchivesList{
    return newAchives;
  }
}