import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/common/Data/api_get/UsersModel.dart';
import 'package:flutter_app/common/Database/Database.dart';
import 'dart:math' as math;
import 'package:fluttertoast/fluttertoast.dart';

class SignupPageView extends StatefulWidget {
  @override
  _SignupPageViewState createState() => _SignupPageViewState();
}

class _SignupPageViewState extends State<SignupPageView> {

  // data for testing
  List<Client> testClients;
  int i=1;
// Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  /* Display Message to user */
  void showMessage(String message) {
    setState(() {
      Fluttertoast.showToast(
        msg: "${message}",
        textColor: Colors.black,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIos: 1,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white.withOpacity(0.5),
      );
    });
  }


  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
     return Scaffold(
       resizeToAvoidBottomInset: false,
         body: Stack(children: <Widget>[
           new Container(
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height,
             color: Color.fromRGBO(166,213,205,1),),
           new Container(
                width: 320,
               alignment: Alignment.topLeft,
               margin: EdgeInsets.fromLTRB(40, 60, 0, 0),
               child: Text("Create Account", style: TextStyle(fontSize:40,
                   color: Colors.black, fontWeight:FontWeight.bold, fontStyle: FontStyle.normal)
               )
           ),

         /*  new Container(
               width: 320,
               alignment: Alignment.topLeft,
               margin: EdgeInsets.fromLTRB(40, 110, 0, 0),
               child: Text("and start meeting new friends around you", style: TextStyle(fontSize:24,
                   color: Color.fromRGBO(104, 130, 127, 1), fontWeight:FontWeight.normal, fontStyle: FontStyle.normal)
               )
           ),*/
           new Column(
             children: <Widget>[
             SizedBox(height: 180),
             new Container(
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height * 0.45,
               child: new Column(children: <Widget>[
                 new Container(
                   alignment: Alignment.center,
                   margin: EdgeInsets.fromLTRB(20,40,20,0),
                   width: MediaQuery.of(context).size.width,
                   height: 45,
                   child: new TextField(
                     controller: nameController,
                     style: TextStyle(color: Colors.black,
                         fontSize: 14,fontWeight:FontWeight.w400,
                         fontFamily: 'Roboto'),
                     decoration: new InputDecoration(
                         enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 0.8)),
                         disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 0.8)),
                         focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 0.8)),
                         contentPadding: EdgeInsets.all(10),
                         filled: false,
                         hintStyle: new TextStyle(color: Colors.grey[700],
                             fontSize: 14, fontWeight:FontWeight.w400),
                         hintText: "Name",
                         fillColor: Colors.white70),
                   ),

                 ),
                 SizedBox(height: 10),
                 new Container(
                   alignment: Alignment.center,
                   margin: EdgeInsets.fromLTRB(20,0,20,0),
                   width: MediaQuery.of(context).size.width,
                   height: 45,
                   child: new TextField(
                     controller: emailController,
                     style: TextStyle(color: Colors.black,
                         fontSize: 14,fontWeight:FontWeight.w400,
                         fontFamily: 'Roboto'),
                          keyboardType: TextInputType.emailAddress,
                          decoration: new InputDecoration(
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 0.8)),
                              disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 0.8)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 0.8)),
                         contentPadding: EdgeInsets.all(10),
                         filled: false,
                         hintStyle: new TextStyle(color: Colors.grey[700],
                             fontSize: 14, fontWeight:FontWeight.w400),
                         hintText: "Email ID",
                         fillColor: Colors.white70),
                   ),

                 ),
                 SizedBox(height: 10),
                 new Container(
                   alignment: Alignment.center,
                   margin: EdgeInsets.fromLTRB(20,0,20,0),
                   width: MediaQuery.of(context).size.width,
                   height: 45,
                   child: new TextField(
                     controller: mobileController,
                     style: TextStyle(color: Colors.black,
                         fontSize: 14,fontWeight:FontWeight.w400,
                         fontFamily: 'Roboto'),
                     keyboardType: TextInputType.phone,
                     decoration: new InputDecoration(
                         enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 0.8)),
                         disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 0.8)),
                         focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 0.8)),
                         contentPadding: EdgeInsets.all(10),
                         filled: false,
                         hintStyle: new TextStyle(color: Colors.grey[700],
                             fontSize: 14, fontWeight:FontWeight.w400),
                         hintText: "Mobile Number",
                         fillColor: Colors.white70),
                   ),

                 ),
                 SizedBox(height: 10),
                 new Container(
                   alignment: Alignment.center,
                   margin: EdgeInsets.fromLTRB(20,0,20,0),
                   width: MediaQuery.of(context).size.width,
                   height: 45,
                   child: new TextField(
                     controller: passwordController,
                     style: TextStyle(color: Colors.black,
                         fontSize: 14,fontWeight:FontWeight.w400,
                         fontFamily: 'Roboto'),
                     decoration: new InputDecoration(
                         enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 0.8)),
                         disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 0.8)),
                         focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 0.8)),
                         contentPadding: EdgeInsets.all(10),
                         filled: false,
                         hintStyle: new TextStyle(color: Colors.grey[700],
                             fontSize: 14, fontWeight:FontWeight.w400),
                         hintText: "Password",
                         fillColor: Colors.white70),
                   ),

                 ),

               ],),
               alignment: Alignment.center,
               margin: EdgeInsets.fromLTRB(30,40,30,0),
               decoration: new BoxDecoration(
                   borderRadius: BorderRadius.circular(30),
                   color: Colors.white.withOpacity(0.8)),
             ),
          ],),
           new GestureDetector(
             onTap: () {
               checkValidation();
             },
             child:   new Container(
                 alignment: Alignment.center,
                 margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.55, MediaQuery.of(context).size.height * 0.45 + 180, 30, 0),
                 width: 180,
                 height:60,
                 child: new Text("Let's connect",style: TextStyle(fontSize: 18,color: Colors.white),),
                 decoration: new BoxDecoration(
                   borderRadius: BorderRadius.circular(30),
                   boxShadow: [BoxShadow(
                     color: Colors.black,
                     blurRadius: 0,
                   ),],
                   color: Colors.black,)

             ),
           ),

          ]),
     );
  }

  /* Checking validation for signup */
  void checkValidation()
  {

    if(nameController.text.trim().isEmpty)
      {
        showMessage("Enter name");
      }
    else if(emailController.text.trim().isEmpty)
      {
        showMessage("Enter email");
      }
    else if(mobileController.text.trim().isEmpty)
    {
      showMessage("Enter mobile");
    }
    else if(passwordController.text.trim().isEmpty)
    {
      showMessage("Enter password");
    }
    else
      {
        saveUser();
      }
  }

  /* Save user data into Database */
  Future<void> saveUser() async{

    // Imagine that this function is saving user info from another service or database
    Client client=new Client(id: i,name: nameController.text,
        email: emailController.text,mobile: mobileController.text,
        password: passwordController.text);

    var status=await DBProvider.db.newClient(client);
    
    setState(() {

      if(status==1)
        {
          showMessage("Data inserted successfully...");
          i=i+1;
        }
    });

  }





}
