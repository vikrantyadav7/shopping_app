import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;


Future<List<Products>> readJsonData() async {
  //read json file
  final jsondata = await rootBundle.rootBundle.loadString('assets/data.json');
  //decode json data as list
  final list = json.decode(jsondata) as List<dynamic>;
  //map json and initialize using DataModel
  return list.map((e) => Products.fromJson(e)).toList();
}

updateJsonData(index , value) async {
  final  jsondata = await rootBundle.rootBundle.loadString('assets/data.json');
  //decode json data as list
  final list = json.decode(jsondata) as List<dynamic>;
  list[index]["quantity"] = value ;
}

class Products {
  String? pImage;
  String? pName;
  int? pId;
  int? pCost;
  int? pAvailability;
  String? pDetails;
  String? pCategory;

  Products(
      {this.pImage,
        this.pName,
        this.pId,
        this.pCost,
        this.pAvailability,
        this.pDetails,
        this.pCategory});

  Products.fromJson(Map<String, dynamic> json) {
    pImage = json['p_image'];
    pName = json['p_name'];
    pId = json['p_id'];
    pCost = json['p_cost'];
    pAvailability = json['p_availability'];
    pDetails = json['p_details'];
    pCategory = json['p_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['p_image'] = pImage;
    data['p_name'] = pName;
    data['p_id'] = pId;
    data['p_cost'] = pCost;
    data['p_availability'] = pAvailability;
    data['p_details'] = pDetails;
    data['p_category'] = pCategory;
    return data;
  }
}