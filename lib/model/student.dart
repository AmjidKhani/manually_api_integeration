import 'package:flutter/material.dart';

class StudentModel{
  String? Name;
  int? Age;
  List<dynamic?> image;
 Attributes? attribute;
  List<dynamic>? subjects;
  StudentModel({
    required this.Name,
    required this.Age,
    required this.subjects,
    required this.attribute,
    required this.image,

});
  factory StudentModel.fromjson(Map<String,dynamic> parsejson){
    var list=parsejson["Images"];
    var converlisttomap=list.map((e)=>Images.fromjson((e))).toList();
    return StudentModel(
      Name: parsejson["Name"],
      Age: parsejson["Age"],
        subjects:parsejson ["subjects"],
      attribute: Attributes.fromjson(parsejson["Attributes"]),
        image: converlisttomap

    );
  }

}
class Attributes{
  String color;
  int size;
  Attributes({
    required this.color,
    required this.size
});
  factory Attributes.fromjson(Map<String,dynamic> parsejson)
  {
    return Attributes(
    size: parsejson['size'],
    color: parsejson['color'],
    );
  }
}
class Images{
  int? id;
  String? grade;
  Images({
  required  this.id,
  required this.grade
  });
  factory Images.fromjson(Map<String,dynamic> parsejson)
  {
    return Images(
        grade:parsejson["grade"],
        id: parsejson["id"],

    );
  }
}
