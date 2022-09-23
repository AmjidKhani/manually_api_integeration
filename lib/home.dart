import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'model/student.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Future<StudentModel> loadjsondata()async
  {
    var loadjson=await rootBundle.loadString("Apiworking/appwork_json.json");
    var jsondecoing= jsonDecode(loadjson);
    print(jsondecoing);
     StudentModel s=StudentModel.fromjson(jsondecoing);

  return s;
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body:    FutureBuilder(

                    future:loadjsondata() ,

                    builder: (

                        BuildContext context, AsyncSnapshot<StudentModel> snapshot)

                    {
                      if(!snapshot.hasData){
                        return Center(child: CircularProgressIndicator());
                      }
                      return Column(
                        children: [
                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                      elevation: 3,
                      color: Colors.purple,
                    child: ListTile(
                    title: Text("${snapshot.data!.Name}"),
                    subtitle:  Text("${snapshot.data!.Age}"),
                      )),
                      ),
                          ...List.generate(snapshot.data!.subjects!.length, (index) {
                            return Card(
                                elevation: 3,
                                color: Colors.purple,
                                child: ListTile(
                                  title: Text("${snapshot.data!.subjects![index]}"),

                                ));
                          } ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                                elevation: 3,
                                color: Colors.purple,
                                child: ListTile(
                                  title: Text("${snapshot.data!.attribute!.color}"),
                                  subtitle:  Text("${snapshot.data!.attribute!.color}"),
                                )),
                          ),
                          ...List.generate(snapshot.data!.image.length, (index) {
                            return  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                  elevation: 3,
                                  color: Colors.purple,
                                  child: ListTile(
                                    title: Text("${snapshot.data!.image[index].id}"),
                                    subtitle:  Text("${snapshot.data!.image[index].grade}"),



                                  )),
                            );
                          }),

                        ],
                      );


                    },

                  ),
                ),



    );
  }
}
