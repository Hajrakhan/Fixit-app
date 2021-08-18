import 'package:fixit_app/formPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fixit_app/main.dart';
  Future<void> showMyDialog(ctx,id) async {
    return showDialog<void>(
      // barrierColor: Colors.grey[200],
      context: ctx,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Registered",style: TextStyle(fontWeight: FontWeight.w500,letterSpacing: -0.5,color: Colors.grey[700])),
          content: Builder(
    builder: (context) {
      // Get available height and width of the build area of this widget. Make a choice depending on the size.
      var height = MediaQuery
          .of(context)
          .size
          .height;
      var width = MediaQuery
          .of(context)
          .size
          .width;
      return Container(
        height: height * 0.07,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("Your Complaint Number is"),SizedBox(height: 5,), Container(padding: EdgeInsets.symmetric(horizontal: 10),
              child:Text(id,style: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1,color: Colors.grey[700]),))
          ],
        ),
      );
    }
          ),
          actionsPadding: EdgeInsets.all(0),
          contentPadding: EdgeInsets.fromLTRB(30,25,30,0),
          buttonPadding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }