import 'dart:math';
import 'database.dart';
import 'package:flutter/material.dart';

class Hospital extends StatefulWidget {
  @override
  _HospitalState createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {

  List<Widget> itemsData = [];

  void getPostsData() {
    List tilecolors = [Colors.cyan.shade100, Colors.orange.shade100, Colors.deepPurple.shade100];
    List textcolors =[Colors.cyan, Colors.orange, Colors.deepPurple];
    int index=0,j=0,k=0;
    List<dynamic> responseList = listdata;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: tilecolors[index++],
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100),
                    blurRadius: 1.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  post["name"],
                  style: const TextStyle(fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Text(
                  post["address"],
                  style: TextStyle(fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: textcolors[j++]),
                ),
                SizedBox(height: 8),
                Text(
                  post["beds"],
                  style: const TextStyle(fontSize: 17, color: Colors.grey),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Telephone:"),
                    Text(post["call"])
                  ],
                ),
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          child: Column(
            children:[
              Padding(
                padding: const EdgeInsets.only(top:10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      child: Icon(Icons.navigate_before),
                      onTap: (){
                        //    Navigator.pop(context);
                        print('pressed');
                      },
                    ),
                    Center(child: Text('Shelter Homes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),)),
                    IconButton(
                        icon: Icon(Icons.navigate_next, semanticLabel: 'next',),
                        onPressed: (){
                          print('Pressed');
                        }
                    )
                  ],),
              ),
              Padding(
                padding: const EdgeInsets.only(left:10,right:10,bottom: 4),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Search',
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: itemsData.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return itemsData[index];
                    }
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                    child: Column(
                      children: <Widget>[
                        FlatButton(onPressed: (){
                          print('pressed');
                        },
                            color: Colors.deepPurple.shade100,
                            child: Icon(Icons.add, size: 30,)),
                        SizedBox(height: 5),
                        Text('Winchester',style: TextStyle(
                          color: Colors.deepPurple.shade100,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  CustomCard({@required this.colour,this.cardChild});
  final Color colour;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
