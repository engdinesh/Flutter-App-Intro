import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_app/feature/signup_page.dart';
import 'login_page_view.dart';
import 'login_page_view_model.dart';
//1. imported local authentication plugin
import 'package:local_auth/local_auth.dart';



class LoginPageView extends StatefulWidget {
  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> implements LoginView{

  final Connectivity _connectivity = new Connectivity();
  final loginViewModel = new LoginPageViewModel();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String _authorized = 'Not Authorized';
// 2. created object of localauthentication class
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  // 3. variable for track whether your device support local authentication means
  //    have fingerprint or face recognization sensor or not
  bool _hasFingerPrintSupport = false;
  // 4. we will set state whether user authorized or not
  String _authorizedOrNot = "Not Authorized";
  // 5. list of avalable biometric authentication supports of your device will be saved in this array
  List<BiometricType> _availableBuimetricType = List<BiometricType>();

  Future<void> _getBiometricsSupport() async {
    // 6. this method checks whether your device has biometric support or not
    bool hasFingerPrintSupport = false;
    try {
      hasFingerPrintSupport = await _localAuthentication.canCheckBiometrics;
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _hasFingerPrintSupport = hasFingerPrintSupport;
    });
  }

  Future<void> _getAvailableSupport() async {
    // 7. this method fetches all the available biometric supports of the device
    List<BiometricType> availableBuimetricType = List<BiometricType>();
    try {
      availableBuimetricType =
      await _localAuthentication.getAvailableBiometrics();
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _availableBuimetricType = availableBuimetricType;
    });
  }

  Future<void> _authenticateMe() async {
    // 8. this method opens a dialog for fingerprint authentication.
    //    we do not need to create a dialog nut it popsup from device natively.
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticateWithBiometrics(
        localizedReason: "Authenticate for Testing", // message for dialog
        useErrorDialogs: true, // show error in dialog
        stickyAuth: true, // native process
      );
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _authorizedOrNot = authenticated ? "Authorized" : "Not Authorized";
    });
  }

    @override
  void initState() {
    super.initState();

    _authenticateMe();
    }


  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body:  SingleChildScrollView(
         scrollDirection: Axis.vertical,
            child: Stack(children: <Widget>[
            /*color: Color.fromRGBO(50,153,153,1),),*/
           new Container(
             width: MediaQuery.of(context).size.width,
               height: 60,
                padding: EdgeInsets.fromLTRB(0,20,0,0),
               alignment: Alignment.topCenter,
               child: Text("Sign In", style: TextStyle(fontSize: 20,
                   color: Colors.white, fontWeight:FontWeight.bold)
               ),
             color: Colors.blueGrey,
           ),
              new Container(
                margin: EdgeInsets.fromLTRB(0,50,20,0),
                child: new Column(children: <Widget>[
                  new Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.fromLTRB(20,20,20,0),
                    width: 100,
                    height: 100,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage('assets/fingertip.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  new Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.fromLTRB(20,10,20,0),
                      child: Text("One-touch Sign In", style: TextStyle(fontSize: 20,
                          color: Colors.black, fontWeight:FontWeight.bold)
                      )
                  ),
                  new Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.fromLTRB(20,20,20,0),
                      child: Text("Please place your fingertip on scanner to verify your identify", style: TextStyle(fontSize: 20,
                          color: Colors.black, fontWeight:FontWeight.normal)
                      )
                  ),
                  new Column(children: <Widget>[
                    new Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: 340,
                      margin: EdgeInsets.fromLTRB(16,40,0,0),
                      child: new Column(children: <Widget>[
                        new Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(60,40,60,0),
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          child: new TextField(
                            controller: emailController,
                            style: TextStyle(color: Colors.white,
                                fontSize: 14,fontWeight:FontWeight.w400,
                                fontFamily: 'Roboto'),
                            decoration: new InputDecoration(
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 0.5)),
                                disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 0.5)),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 0.5)),
                                contentPadding: EdgeInsets.all(10),
                                filled: false,
                                hintStyle: new TextStyle(color: Colors.white,
                                    fontSize: 14, fontWeight:FontWeight.w400),
                                hintText: "Email ID",
                                fillColor: Colors.white70),
                          ),

                        ),
                        SizedBox(height: 10),
                        new Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(60,0,60,0),
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          child: new TextField(
                              controller: passwordController,
                              obscureText: true,
                              style: TextStyle(color: Colors.white,
                                  fontSize: 14,fontWeight:FontWeight.w400,
                                  letterSpacing: 4),
                              decoration: new InputDecoration(
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 0.5)),
                                disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 0.5)),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 0.5)),
                                contentPadding: EdgeInsets.all(10),
                                filled: false,
                                hintStyle: new TextStyle(color: Colors.white,
                                    fontSize: 14,fontWeight:FontWeight.w400,letterSpacing: 0),
                                hintText: "Password",
                              )),
                        ),
                        SizedBox(height: 40),
                        new Row(children: <Widget>[
                          new Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.fromLTRB(60,0,0,0),
                              child: Text("Forgot password?", style: TextStyle(fontSize: 15,
                                  color: Colors.white,
                                  fontWeight:FontWeight.normal,
                                  decoration: TextDecoration.underline)
                              )
                          ),
                          Spacer(),
                          new GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignupPageView()),
                              );
                            },
                            child: new Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.fromLTRB(60,0,60,0),
                                child: Text("Signup", style: TextStyle(fontSize: 15,
                                    color: Colors.white,
                                    fontWeight:FontWeight.normal,
                                    decoration: TextDecoration.underline)
                                )
                            ),
                          ),
                        ],),
                        new GestureDetector(
                          onTap: () {
                            bool isLoginValid=loginViewModel.login(emailController.text,passwordController.text);
                            if(isLoginValid)
                            {
                              Loading();
                            }
                          },
                          child: new Container(
                            margin: EdgeInsets.all(20),
                              alignment: Alignment.center,
                              width: 120,
                              height: 60,
                              child: new Icon(Icons.arrow_forward, size: 28, color: Colors.white),
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 0,
                                ),],
                                color: Colors.black,)

                          ),
                        ),
                        Text('Current State: $_authorized\n'),
                      ],),
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20) ),
                          color: Colors.blueGrey),
                    ),
                  ],),
                ],),
           ),],
          )),
     );
  }

  @override
  bool checkNetwork()
  {
    // TODO: implement checkNetwork
    var connectivityResult=_connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile)
    {
      return true;

    } else if (connectivityResult == ConnectivityResult.wifi)
    {
      return true;
    }
    else {
      return false;
    }
    return false;
  }

  @override
  void hideLoader()
  {
    // TODO: implement hideLoader
  }

  @override
  void showLoader() {
    // TODO: implement showLoader

  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromRGBO(166,213,205,1),
          body: Center(
            child: SpinKitChasingDots(color: Colors.black),
          )),
    );
  }
}
