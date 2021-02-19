import 'package:flutter/material.dart';
class CartModel{
  final String name;
  final String image;
  final double price;
  final int quantity;
  CartModel({@required this.image ,@required this.price ,@required this.quantity ,@required this.name});
}