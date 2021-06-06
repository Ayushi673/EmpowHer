import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:empowerher/screens/details.dart';
import 'package:empowerher/screens/legal.dart';
import 'package:empowerher/screens/donate.dart';
import 'package:empowerher/screens/sharepage.dart';
import 'package:url_launcher/url_launcher.dart';

void main()
{
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Creating UI widgets",
      home: Page1()
  )
  );
}
_makingPhoneCall() async {
  const url = 'tel:2345678910'; //dummy hotline number
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class Page1 extends StatelessWidget {

  Future navigateToSubPage(context) async {
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => Page2()
        )
    );
  }
  final String img1 = 'images/togther.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color(0xFF3F2E4B),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 100),
                SizedBox(
                  child: SvgPicture.asset(
                    img1,
                    placeholderBuilder: (context) => CircularProgressIndicator(),
                    height: 300.0,
                    width: 160,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:50),
                  child: Text('Support',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                SizedBox(height:20),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(subtitle(1),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,),
                ),
                CustomButton(
                  leftbutton: '24 HR HOTLINE',
                    buttontext: 'Next',
                    leftpress: (){
                      print('pressed');
                      _makingPhoneCall();
                    },
                    pressed: (){
                      print('pressed');
                      navigateToSubPage(context);
                    })
              ],
            ),
          ),
        )
    );
  }
}
class Page2 extends StatelessWidget {

  Future navigateToNext(context) async {
    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => Legal(),
        )
    );
  }
  Future navigateToHospital(context) async {
    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => MyHomepage(),
        )
    );
  }
  Future navigateToShelter(context) async {
    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => MyHomepage(),
        )
    );
  }

  Future navigateToP3(context) async {
    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => Page3(),
        )
    );
  }


  final String img2 = 'images/find.svg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color(0xFFF3E8F9),//
          child: Center(
            child: Column(
              children: <Widget>[
                TopButton(
                    pressed: () {
                      print('pressed');
                      navigateToP3(context);
                    }
                ),
                SizedBox(height: 50),
                SizedBox(
                  child: SvgPicture.asset(
                    img2,
                    placeholderBuilder: (context) => CircularProgressIndicator(),
                    height: 260.0,
                    width: 170,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:30),
                  child: Text('Helpline',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(30,10,30,10),
                  child: Text(subtitle(2),
                    textAlign: TextAlign.center,),
                ),
                MyButton(
                    buttontext: 'Shelter Homes',
                    pressed: (){
                      print('pressed');
                      //navigateToSubPage(context);
                      navigateToShelter(context);
                    }),
                MyButton(
                    buttontext: 'Legal Advisory Firms',
                    pressed: (){
                      print('pressed');
                      navigateToNext(context);
                    }),
                MyButton(
                    buttontext: 'Hospital emergency',
                    pressed: (){
                      print('pressed');
                      //navigateToSubPage(context);
                    }),
                SizedBox(height: 50),
              ],
            ),
          ),
        )
    );
  }
}

class Page3 extends StatelessWidget {

  Future navigateToApptPage(context) async {
    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => ShareThoughts(),
        )
    );
  }
  Future navigateToDonate(context) async {
    Navigator.push(context,
        MaterialPageRoute(
              builder: (context) => PaymentPage(),
        )
    );
  }
  final String img3 = 'images/superwoman.svg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color(0xFFD9AAF7),
          child: Center(
            child: Column(
              children: <Widget>[
                TopButton(),
                SizedBox(height: 50),
                SizedBox(
                  child: SvgPicture.asset(
                    img3,
                    placeholderBuilder: (context) => CircularProgressIndicator(),
                    height: 260.0,
                    width: 170,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:50),
                  child: Text('Empower',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(subtitle(3),
                    textAlign: TextAlign.center,),
                ),
                CustomButton(
                  leftpress: (){
                    print('pressed');
                    navigateToDonate(context);
                  },
                  pressed: (){
                    print('pressed');
                    navigateToApptPage(context);
                },
                  leftbutton: 'DONATE',
                  buttontext:'Thought Room',),
                SizedBox(height: 30,)
              ],
            ),
          ),
        )
    );
  }
}

class TopButton extends StatelessWidget {
  TopButton({@required this.pressed});
  final pressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
              child: Icon(Icons.arrow_back_ios),
              onTap: (){
                Navigator.pop(context);
              }
          ),
          GestureDetector(
              child: Icon(Icons.arrow_forward_ios),
              onTap: pressed,
          ),
        ],
      ),
    );
  }
}



class MyButton extends StatelessWidget {
  MyButton({@required this.pressed, @required this.buttontext});
  final pressed;
  final String buttontext;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            padding: EdgeInsets.only(left: 40,right: 40),
            onPressed: pressed,
            color: Colors.deepPurple,
            shape: const StadiumBorder(),
            child: Row(
              children: <Widget>[
                Text(buttontext, style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(width: 10),
                Icon(Icons.arrow_forward, color: Colors.white,),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({@required this.pressed, @required this.buttontext, @required this.leftbutton, @required this.leftpress});
  final pressed;
  final leftpress;
  final String buttontext;
  final String leftbutton;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton(
            onPressed: leftpress,
            padding: EdgeInsets.only(left:10, right: 10),
            child: Text(leftbutton, style: TextStyle(color:Colors.white),),
          ),
          RaisedButton(
            padding: EdgeInsets.only(left: 40,right: 40),
            onPressed: pressed,
            color: Colors.deepPurple,
            shape: const StadiumBorder(),
            child: Row(
              children: <Widget>[
                Text(buttontext, style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(width: 10),
                Icon(Icons.arrow_forward, color: Colors.white,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
String a,b;
String subtitle(int n) {
  if (n == 1)
    return 'Support us! We\'re a community and we\'re all in this together. The 24 hr crisis hotline is open for women/non-binary people in distress.For any queries contact:\ndasayushi16@gmail.com';
  else if (n == 2)
    return 'Places/Contacts that might come in handy!';
  else
    return '~Share relevant resources\n\n~Share your thoughts and feeling with the community!\n\n~Donate to support the community\n\n';
}