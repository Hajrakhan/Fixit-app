import 'dart:convert';
import 'package:fixit_app/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fixit_app/data.dart';
import 'package:http/http.dart' as http;
// extension CapExtension on String {
//   String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
//   String get allInCaps => this.toUpperCase();
//   String get capitalizeFirstofEach => this.split(" ").map((str) => str.capitalize).join(" ");
// }
class ComplaintTracking extends StatefulWidget {
  @override
  _ComplaintTrackingState createState() => _ComplaintTrackingState();
}

class _ComplaintTrackingState extends State<ComplaintTracking> {
  var data=[];
  String searchWord;
  bool pressed;
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  @override
  void initState() {
    setState(() {
      data=null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String capitalize(String string) {
      if (string == null) {
        throw ArgumentError.notNull('string');
      }

      if (string.isEmpty) {
        return string;
      }

      return string[0].toUpperCase() + string.substring(1);
    }
    Future<void> show(ctx) async {
      showDialog(
          context: context,
          builder: (_) => new AlertDialog(

            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(
                    Radius.circular(10.0))),
            // title: Text(data[0]['Status']),
            content: Builder(
              builder: (context) {
                // Get available height and width of the build area of this widget. Make a choice depending on the size.
                var height = MediaQuery.of(context).size.height;
                var width = MediaQuery.of(context).size.width;
                return Container(
                  height: height*0.15,
                  width: width,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row(children: [Text("Complaint Number: ",style: TextStyle(fontSize: 14,letterSpacing:0.4,),),SizedBox(width: 5,),Text(capitalize(data[0]['complaint_ID']),style: TextStyle(letterSpacing:0.6,fontSize: 14,fontWeight: FontWeight.w600),)],),
                      SizedBox(height: 5,),
                      Row(children: [Text("Name: ",style: TextStyle(fontSize: 14,letterSpacing:0.4,),),SizedBox(width: 5,),Text(capitalize(data[0]['Name']),style: TextStyle(letterSpacing:0.6,fontSize: 14,fontWeight: FontWeight.w600),)],),
                      SizedBox(height: 5,),
                      Row(children: [Text("CNIC: ",style: TextStyle(letterSpacing:0.4,fontSize: 14),),SizedBox(width: 5,),Text(data[0]['cnic'],style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,letterSpacing:0.6,),)],),
                      SizedBox(height: 5,),
                      Row(children: [Text("Address: ",style: TextStyle(fontSize: 14),),SizedBox(width: 5,),Text(capitalize(data[0]['address']),style: TextStyle(letterSpacing:0.6,fontSize: 14,fontWeight: FontWeight.w600),)],),
                      SizedBox(height: 5,),
                      Row(children: [Text("Status: ",style: TextStyle(fontSize: 14),),SizedBox(width: 5,),Text(capitalize(data[0]['Status']),style: TextStyle(letterSpacing:0.6,fontSize: 14,fontWeight: FontWeight.w600),)],),
                    ],
                  ),
                );
              },
            ),
            actionsPadding: EdgeInsets.all(0),
            contentPadding: EdgeInsets.fromLTRB(30,25,30,0),
            buttonPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )
      );
    }
    Future<void> Wrongcomplaint(ctx) async {
      showDialog(
          context: context,
          builder: (_) => new AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(
                    Radius.circular(10.0))),
            content: Text("Invalid Complaint Number"),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
            actionsPadding: EdgeInsets.all(0),
            contentPadding: EdgeInsets.fromLTRB(30,25,30,0),
            buttonPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          )
      );
    }
    Widget Status(ctx){
      if(data!=null) {
        show(ctx);
      }
      else{
        Wrongcomplaint(ctx);
      }
    }
    Future SearchStatus() async {
      String url = "http://uetpswr.cisnr.com/fixit/app/search.php";
      final response = await http.post(url, body: {
        "id": searchWord,
      });
      print(response.body);
      if(response.body=="[null]") {
        setState(() {
          data=null;
          pressed=true;
          Status(context);
        });
      }
      else{
        setState(() {
          data = json.decode(response.body);
          print(data[0]['id']);
          pressed=true;
          Status(context);
        });
      }
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black54),
        title: Text("Complaint Status",style: TextStyle(fontSize: 16,letterSpacing:0.4,color: Colors.black87),),
        backgroundColor: Colors.white,
        elevation: 3,
        titleSpacing: -2,
        leading: Transform.translate(
            offset: Offset(-5, 0),
            child: InkWell(
              child: Icon(Icons.arrow_back),
              onTap: (){
                Navigator.pop(context);
              },
            )
        ),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,/
          children: [
            // SizedBox(height: MediaQuery.of(context).size.height*0.3),
            SizedBox(height: MediaQuery.of(context).size.height*0.3),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
              child: Text("Please fill in complaint No below to proceed.",
                  style: TextStyle(letterSpacing: -0.1,fontSize: 14,color: Colors.black87),textAlign: TextAlign.start),
            ),
            SizedBox(height: 5,),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
              child:TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    labelStyle: TextStyle(color: Colors.grey,fontSize: 12,letterSpacing: 1,fontWeight: FontWeight.w500),
                    hintText: "Enter your Complaint Number",
                    hintStyle: TextStyle(fontSize: 12,color: Colors.grey[500],letterSpacing: 0.6),
                    contentPadding: EdgeInsets.all(0.0),
                    isDense: true,
                    // labelText: 'Complaint Number',
                    prefixIcon: Icon(Icons.search,size: 25,)),
                validator: (String value){
                  if(value.isEmpty){
                    return 'Complaint Number is required';
                  }
                  return null;
                },
                onSaved: (String value){searchWord=value;},
              ),
            ),
            SizedBox(height: 15,),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.45,
                height: 40,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(color: Colors.black)
                  ),
                  // color: Colors.orange[700].withOpacity(0.8),
                  color: Colors.black45.withOpacity(0.6),

                  onPressed: (){
                    if(!_formkey.currentState.validate()){
                      return;
                    }
                    _formkey.currentState.save();
                    SearchStatus();
                  },
                  child: Text("View Status",style: TextStyle(
                      color: Colors.white,
                      letterSpacing: -0.1,
                      fontSize: 16,fontWeight: FontWeight.w500
                  ),
                  ),
                ),
              ),
            ),
            // SizedBox(height: 100,)
          ],
        ),
      )
    );
  }
}
