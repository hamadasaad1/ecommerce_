import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService{
  final CollectionReference _categoryCollection =
  FirebaseFirestore.instance.collection("category");

  final CollectionReference _productCollection =
  FirebaseFirestore.instance.collection("product");

  Future<List<QueryDocumentSnapshot>> getCategory()async{
    var value=await _categoryCollection.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProduct()async{
    var value=await _productCollection.get();
    return value.docs;
  }
}