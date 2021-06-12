import 'package:eshtery/helper/extention.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String productId, name, image, desc, size, price;
  Color color;

  ProductModel({
    this.productId,
    this.name,
    this.image,
    this.desc,
    this.color,
    this.size,
    this.price,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    productId = map['productId'];
    name = map['name'];
    image = map['image'];
    desc = map['desc'];
    size = map['size'];
    color = HexColor.fromHex(map['color']);
    price = map['price'];
  }

  toJson() {
    return {
      'productId': productId,
      'name': name,
      'image': image,
      'desc': desc,
      'size': size,
      'color': color,
      'price': price,
    };
  }
}
