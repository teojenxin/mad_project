import 'package:flutter/material.dart';
import 'package:project_mad/model/categoryicon.dart';
import 'package:project_mad/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryProvider with ChangeNotifier {
  List<Product> shirt = [];
  Product shirtData;
  List<Product> dress = [];
  Product dressData;
  List<Product> shoes = [];
  Product shoesData;
  List<Product> pant = [];
  Product pantData;
  List<Product> tie = [];
  Product tieData;
  CategoryIcon iconData;
  List<CategoryIcon> dressIcon = [];
  CategoryIcon dressiconData;

  Future<void> getDressIcon() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot dressSnapShot = await Firestore.instance
        .collection("categoryicon")
        .document("zN2780wRxuslmHrD3obf")
        .collection("dress")
        .getDocuments();
    dressSnapShot.documents.forEach(
      (element) {
        dressiconData = CategoryIcon(image: element["image"]);
        newList.add(dressiconData);
      },
    );
    dressIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getDressiconData {
    return dressIcon;
  }

  List<CategoryIcon> shirtIcon = [];
  CategoryIcon shirticonData;

  Future<void> getShirtIcon() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot shirtSnapShot = await Firestore.instance
        .collection("categoryicon")
        .document("zN2780wRxuslmHrD3obf")
        .collection("shirt")
        .getDocuments();
    shirtSnapShot.documents.forEach(
      (element) {
        shirticonData = CategoryIcon(image: element["image"]);
        newList.add(shirticonData);
      },
    );
    shirtIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getshirticonData {
    return shirtIcon;
  }

  List<CategoryIcon> shoesIcon = [];
  CategoryIcon shoesiconData;

  Future<void> getShoesIcon() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot shoeSnapShot = await Firestore.instance
        .collection("categoryicon")
        .document("zN2780wRxuslmHrD3obf")
        .collection("shoe")
        .getDocuments();
    shoeSnapShot.documents.forEach(
      (element) {
        shoesiconData = CategoryIcon(image: element["image"]);
        newList.add(shoesiconData);
      },
    );
    shoesIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getShoesiconData {
    return shoesIcon;
  }

  List<CategoryIcon> pantIcon = [];
  CategoryIcon panticonData;

  Future<void> getPantIcon() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot pantSnapShot = await Firestore.instance
        .collection("categoryicon")
        .document("zN2780wRxuslmHrD3obf")
        .collection("pant")
        .getDocuments();
    pantSnapShot.documents.forEach(
      (element) {
        panticonData = CategoryIcon(image: element["image"]);
        newList.add(panticonData);
      },
    );
    pantIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getpanticonData {
    return pantIcon;
  }

  List<CategoryIcon> tieIcon = [];
  CategoryIcon tieiconData;

  Future<void> getTieIcon() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot tieSnapShot = await Firestore.instance
        .collection("categoryicon")
        .document("zN2780wRxuslmHrD3obf")
        .collection("tie")
        .getDocuments();
    tieSnapShot.documents.forEach(
      (element) {
        tieiconData = CategoryIcon(image: element["image"]);
        newList.add(tieiconData);
      },
    );
    tieIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get gettieiconData {
    return tieIcon;
  }

  Future<void> getShirtData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await Firestore.instance
        .collection("category")
        .document("4UIIAHTAzZ7NhL7cZV0r")
        .collection("shirt")
        .getDocuments();
    shirtSnapShot.documents.forEach(
      (element) {
        shirtData = Product(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(shirtData);
      },
    );
    shirt = newList;
    notifyListeners();
  }

  List<Product> get getShirtList {
    return shirt;
  }

  Future<void> getDressData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await Firestore.instance
        .collection("category")
        .document("4UIIAHTAzZ7NhL7cZV0r")
        .collection("dress")
        .getDocuments();
    shirtSnapShot.documents.forEach(
      (element) {
        shirtData = Product(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(shirtData);
      },
    );
    dress = newList;
    notifyListeners();
  }

  List<Product> get getDressList {
    return dress;
  }

  Future<void> getShoesData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await Firestore.instance
        .collection("category")
        .document("4UIIAHTAzZ7NhL7cZV0r")
        .collection("shoes")
        .getDocuments();
    shirtSnapShot.documents.forEach(
      (element) {
        shirtData = Product(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(shirtData);
      },
    );
    shoes = newList;
    notifyListeners();
  }

  List<Product> get getshoesList {
    return shoes;
  }

  Future<void> getPantData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await Firestore.instance
        .collection("category")
        .document("4UIIAHTAzZ7NhL7cZV0r")
        .collection("pant")
        .getDocuments();
    shirtSnapShot.documents.forEach(
      (element) {
        shirtData = Product(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(shirtData);
      },
    );
    pant = newList;
    notifyListeners();
  }

  List<Product> get getPantList {
    return pant;
  }

  Future<void> getTieData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await Firestore.instance
        .collection("category")
        .document("4UIIAHTAzZ7NhL7cZV0r")
        .collection("tie")
        .getDocuments();
    shirtSnapShot.documents.forEach(
      (element) {
        shirtData = Product(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(shirtData);
      },
    );
    tie = newList;
    notifyListeners();
  }

  List<Product> get getTieList {
    return tie;
  }
}
