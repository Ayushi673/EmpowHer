import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int sl=9909;

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        color: Colors.grey.shade300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:20.0,left: 10,right: 14,bottom:30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                              onTap:(){
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back_ios)),
                          Text('Donate Via',style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ) ,),
                          GestureDetector(
                              onTap: (){
                              },
                              child: Text(''),),
                        ],
                      ),
                    ),
                    Text('\t\tWallet',style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 30,
                          child: Image.network('https://www.searchpng.com/wp-content/uploads/2019/02/Paytm-Logo-With-White-Border-PNG-image.png'),
                        ),
                        FlatButton(onPressed: (){}, child: Text('LINK ACCOUNT',
                          style: TextStyle(
                            color: Colors.lightGreen,
                          ),)),
                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 56,
                          child: Image.network('https://learning-tribes.com/wp-content/uploads/2021/01/paypal-logo-png-transparent.png'),
                        ),
                        Text(''),
                        FlatButton(onPressed: (){}, child: Text('LINK ACCOUNT',style: TextStyle(
                          color: Colors.lightGreen,
                        ),)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text('Debit Card',style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 55,
                          width: 110,
                          child: Image.network('https://www.vhv.rs/dpng/d/17-175065_atm-card-logo-png-transparent-png.png'),
                        ),
                        FlatButton(onPressed: (){}, child: Icon(Icons.check_circle,color: Colors.lightGreen,)),
                      ],),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8,13,8.0,13),
                      child: Center(
                        child: Text('Thank you for stopping by!',style:
                        TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.deepPurple,
                        ),),
                      ),
                    ),
                    Image.network("https://www.bestbuddies.org/wp-content/uploads/2018/07/BB-Where-The-Money-Goes-07.24.18-01.png")

                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                confirmDialog(context);
              },
              child: Container(
                color: Colors.purple.shade800,
                margin: EdgeInsets.only(top:10),
                width: double.infinity,
                height: 60,
                child: Center(child: Text('Confirm', style:
                TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void confirmDialog(BuildContext context){
    var alert= AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      content: Container(
          height: 300,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Thank You!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),),
              Container(
                height: 200,
                width: 180,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage('https://images.vexels.com/media/users/3/194361/isolated/preview/56685e66a4bb34c0bec02166e87313b2-gift-box-with-balloons-by-vexels.png')
                    )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Successful transaction!'),
                ],
              ),
              Text('DONATION #$sl',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ],
          )),
    );
    showDialog(context: context,
        builder: (BuildContext context)
        {
          return alert;
        }
    );
  }
}
//https://learning-tribes.com/wp-content/uploads/2021/01/paypal-logo-png-transparent.png