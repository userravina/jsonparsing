import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jsonparsing/OnlinDataJson/modal/onlinjson_modal.dart';
class Api_helper
{
  List<ProducteModal> ProducteList=[];

  Future<List<ProducteModal>> getdatajson()
  async {
    String? like="https://fakestoreapi.com/products";
    var responce = await http.get(Uri.parse(like));

    List product = jsonDecode(responce.body);

    ProducteList = product.map((e) => ProducteModal.fromjson(e)).toList();

    return ProducteList;
  }
}