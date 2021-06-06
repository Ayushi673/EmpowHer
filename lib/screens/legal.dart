import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Legalhelp {
  String name;
  String desc;

  Legalhelp({this.name, this.desc});

  Legalhelp.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['desc'] = this.desc;
    return data;
  }
}

class Legal extends StatefulWidget {
  @override
  _LegalState createState() => _LegalState();
}

class _LegalState extends State<Legal> {

  List<Legalhelp> userlist=new List();

  @override
  void initState() {
    _getRequest();
    super.initState();
  }


  Future<List<Legalhelp>> _getRequest() async{
    String url="https://boiling-hamlet-15119.herokuapp.com/";
    http.Response res=await http.get(url);
    var rb=res.body;
    var list=json.decode(rb) as List;
    List<Legalhelp> listval=list.map((e)=>Legalhelp.fromJson(e)).toList();

    setState(() {
      userlist.addAll(listval);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10,15.0,10,5),
        child: ListView.builder(
          itemCount: userlist.length,
          itemBuilder: (context,index){
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color(0xffe8d5f9),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(userlist[index].name,
                            style: TextStyle(
                              color: Color(0xff663399),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                        SizedBox(height: 10),
                        Text(userlist[index].desc),
                      ],
                    ),
                  ),
                ),
              )
            );
          },
        ),
      ),
    );
  }
}
