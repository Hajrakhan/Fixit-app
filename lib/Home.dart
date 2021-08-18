import 'package:flutter/material.dart';
import 'package:fixit_app/formPage.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Logo(context),
                      // Text("Please Enter Your Details",
                      //     style: TextStyle(letterSpacing: -0.1,fontSize: 16,color: Colors.grey[500]),textAlign: TextAlign.start),

                      FormScreen()
                    ]
                )
            )
        )
    );
  }
}
Widget Logo(cxt){
  return Container(
    width: MediaQuery.of(cxt).size.width,
    // color: Colors.pink,
    height: MediaQuery.of(cxt).size.height*0.1,
    margin: EdgeInsets.fromLTRB(0, 90, 0, 0),
    child: Image.asset("assets/logo.png",scale: 1.8,),
  );
}