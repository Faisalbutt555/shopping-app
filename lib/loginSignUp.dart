import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:transact/Buyer/buyerHome.dart';

import 'package:transact/Supplier/supplierStore.dart';
import 'package:transact/otpScreen.dart';
import 'package:transact/sellermode/cashier.dart';
import 'package:transact/utils/routes.dart';
import 'utils/utils.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<bool> _selection = [true, false, false];

  int id;
  bool register = false;
  bool forgot = false;
  bool dialog = false;
  bool verification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F5F7FA"),
      body: SafeArea(
        child: forgot == true
            ? _recoverPassword()
            : Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: HexColor("#3B444B"),
                        child: Column(
                          children: <Widget>[
                            _logo(),
                            _loginText(),
                            _toggleButton(),
                          ],
                        ),
                      ),
                      register == false ? _loginForm() : _signUpForm(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _signUpForm() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.24,
      child: Column(
        children: <Widget>[
          _textField("images/user.png", "Full Name", 3),
          _textField("images/email.png", "Email", 4),
          _textField("images/phone.png", "Phone Number", 5),
          _textField("images/key.png", "Password", 6),
          _textField("images/key.png", "Confirm Password", 7),
          _textField("images/link.png", "Referral", 8),
          _signUpButton(),
          _policy(),
          _goToLogin(),
        ],
      ),
    );
  }

  Widget _loginForm() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.24,
      child: Column(
        children: <Widget>[
          _textField("images/email.png", "Email", 1),
          _textField("images/key.png", "Password", 2),
          _forgot(),
          _loginButton(),
          _gotoSignUp(),
        ],
      ),
    );
  }

  Widget _toggleButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: ToggleButtons(
        borderColor: Colors.white,
        borderRadius: BorderRadius.circular(30),
        hoverColor: Colors.transparent,
        fillColor: Colors.white,
        isSelected: _selection,
        onPressed: (int index) {
          setState(() {
            for (int buttonIndex = 0;
                buttonIndex < _selection.length;
                buttonIndex++) {
              if (buttonIndex == index) {
                _selection[buttonIndex] = true;
              } else {
                _selection[buttonIndex] = false;
              }
            }
          });
        },
        renderBorder: false,
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(microseconds: 10),
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: _selection[0] == true
                    ? HexColor('#FC9F74')
                    : Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                '  Buyer  ',
                style: TextStyle(
                    fontSize: 18,
                    color: _selection[0] == true ? Colors.white : Colors.black),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(microseconds: 10),
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: _selection[1] == true ? Colors.green : Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                '  Seller  ',
                style: TextStyle(
                    fontSize: 18,
                    color: _selection[1] == true ? Colors.white : Colors.black),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(microseconds: 10),
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color:
                    _selection[2] == true ? HexColor('#3B444B') : Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Supplier',
                style: TextStyle(
                    fontSize: 18,
                    color: _selection[2] == true ? Colors.white : Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textField(String image, String label, id) {
    return Container(
      margin: id == 1
          ? EdgeInsets.only(top: 50, bottom: 10)
          : id == 3
              ? EdgeInsets.only(top: 20, bottom: 5)
              : EdgeInsets.symmetric(vertical: 2),
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            fillColor: HexColor("#FFFFFF"),
            labelText: "$label",
            labelStyle: TextStyle(fontSize: 14, color: HexColor("#3B444B")),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: HexColor("#707070"))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 1, color: HexColor("#707070"))),
            prefixIcon: Container(
              height: 10,
              width: 10,
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              child: Image(
                width: 20,
                //height: 40,
                image: AssetImage("$image"),
              ),
            )),
      ),
    );
  }

  Widget _forgot() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          setState(() {
            forgot = true;
          });
        },
        child: Text(
          "\nForgot Password ?",
          style: TextStyle(fontSize: 14, color: HexColor("#29346E")),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return GestureDetector(
      onTap: () {
        _selection[2] ? AppRoutes.push(context, SupplierDetails()) : _selection[0] ? AppRoutes.push(context, BuyerHome()) :AppRoutes.push(context, SellerCashier());
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 50),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _selection[0]
                ? HexColor("#FC9F74")
                : _selection[1] ? HexColor("#03C03C") : HexColor("#3B444B")),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                "LOGIN",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 19,
                      color: _selection[0]
                          ? HexColor("#FC9F74")
                          : _selection[1]
                              ? HexColor("#03C03C")
                              : HexColor("#3B444B"),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _gotoSignUp() {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Don't have an account?",
          style: TextStyle(fontSize: 14, color: HexColor("#29346E")),
        ),
        FlatButton(
          onPressed: () {
            setState(() {
              register = true;
            });
          },
          child: Text(" Register",
              style: TextStyle(fontSize: 15, color: HexColor("#000000"))),
        )
      ],
    ));
  }

  Widget _logo() {
    return Container(
      height: register == false
          ? MediaQuery.of(context).size.height * 0.24
          : MediaQuery.of(context).size.height * 0.20,
      width: register == false
          ? MediaQuery.of(context).size.width * 0.5
          : MediaQuery.of(context).size.width * 0.5,
      padding: EdgeInsets.all(20),
      child: Image(
        image: AssetImage("images/logo.png"),
      ),
    );
  }

  Widget _loginText() {
    return Container(
      padding: EdgeInsets.only(
          top: register == false ? 30 : 20,
          bottom: register == false ? 40 : 25),
      child: Text(
        register == false ? "LOGIN" : "SIGNUP",
        style: TextStyle(
            fontFamily: 'antipasto',
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _signUpButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _selection[0]
              ? HexColor("#FC9F74")
              : _selection[1] ? HexColor("#03C03C") : HexColor("#3B444B")),
      child: GestureDetector(
        onTap: () {
          _showDialog();
        },
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                "Register",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: _selection[0]
                          ? HexColor("#FC9F74")
                          : _selection[1]
                              ? HexColor("#03C03C")
                              : HexColor("#3B444B"),
                      size: 19,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _goToLogin() {
    return Container(
        margin: EdgeInsets.only(bottom: 10, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Already a member ?",
              style: TextStyle(fontSize: 14, color: HexColor("#29346E")),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  register = false;
                });
              },
              child: Text(" LOGIN",
                  style: TextStyle(fontSize: 15, color: HexColor("#000000"))),
            )
          ],
        ));
  }

  Widget _policy() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: <TextSpan>[
            TextSpan(
              text: 'By Continuing you agree to Transact \n',
              style: TextStyle(fontSize: 12, color: HexColor("#707070")),
            ),
            TextSpan(
                text: "User Agreement ",
                style: TextStyle(fontSize: 12, color: HexColor("#FF4545")),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => print("User Agreement")),
            TextSpan(
              text: 'and',
              style: TextStyle(fontSize: 12, color: HexColor("#707070")),
            ),
            TextSpan(
                text: " Privacy policy",
                style: TextStyle(fontSize: 12, color: HexColor("#FF4545")),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => print("privacy policy\n")),
          ]),
        ));
  }

  Widget _recoverPassword() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        // height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: HexColor("#F5F7FA"),
        child: Stack(
          children: <Widget>[
            //  _bottom(), //Animation to be implemented
            Container(
              // width: MediaQuery.of(context).size.width * 2,
              child: Column(
                children: <Widget>[
                  _cancelButton(),
                  _logo2(),
                  _passChangeText(),
                  _forgotCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _forgotCard() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(10),
        color: HexColor("#F5F7FA"),
        child: Column(
          children: <Widget>[
            verification == true ? PinCodeEnterClass() : _emailbox(),
            _continueButton2(),
          ],
        ),
      ),
    );
  }

  Widget _logo2() {
    return Container(
      //  padding: EdgeInsets.all(30),
      child: Image(
        height: MediaQuery.of(context).size.height / 2.9,
        width: MediaQuery.of(context).size.width * .25,
        color: Colors.black,
        image: AssetImage("images/logo.png"),
      ),
    );
  }

  Widget _emailbox() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width / 1.4,
      child: _textField("images/email.png", "Enter Email", 9),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            width: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "VERIFICATION",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 5.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text("Please Select a verification method",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      forgot = true;
                      verification = true;
                      Navigator.pop(context);
                    });
                  },
                  child: Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            height: 50,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: HexColor("#F5F7FA")),

                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Send to mobile",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      verification = true;

                      Navigator.pop(context);
                    });
                  },
                  child: Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            height: 50,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: HexColor("#F5F7FA")),

                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Send to email",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    decoration: BoxDecoration(
                      color: HexColor("#3B444B"),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0)),
                    ),
                    child: Text(
                      "BACK",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _continueButton2() {
    return GestureDetector(
      onTap: () {
        setState(() {
          forgot = false;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        height: 50,
        // width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: HexColor("#3B444B")),

        child: Align(
          alignment: Alignment.center,
          child: Text(
            "Continue",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _cancelButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: () {
          setState(() {
            forgot = false;
            verification = false;
          });
        },
        child: Container(
          height: 25,
          width: 25,
          margin: EdgeInsets.all(15),
          child: Image.asset("images/cross.png"),
        ),
      ),
    );
  }

  Widget _passChangeText() {
    return Container(
      // margin: EdgeInsets.only(top: 15),
      child: Column(
        children: <Widget>[
          Text(
            verification == true ? "Verification" : " Forgot Password",
            style: TextStyle(fontSize: 18, color: HexColor("#000000")),
          ),
          Container(
            margin: EdgeInsets.all(25),
            child: Text(
              verification == true
                  ? "Enter the OTP that is sent to\n +92 000 000 00"
                  : " Enter Your Email Address\nPassword Change link send to your email address.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: HexColor("#000000")),
            ),
          ),
        ],
      ),
    );
  }
}
