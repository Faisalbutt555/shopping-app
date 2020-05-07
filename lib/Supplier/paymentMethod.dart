import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:transact/AppBar.dart';
import 'package:credit_card/credit_card_form.dart';
import 'package:credit_card/credit_card_model.dart';
import 'package:credit_card/credit_card_widget.dart';
import 'package:credit_card/flutter_credit_card.dart';
import 'package:transact/utils/bottomButton.dart';
import 'package:transact/utils/routes.dart';

import 'package:transact/utils/utils.dart';

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String _group;
  bool _add = false;

  String newValue;

  @override
  void initState() {
    _group = "1";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: CustomeAppBar(
              title: _add == false ? "Payment Method" : "Add Card",
            ),
          ),
          bottomNavigationBar: _add == false
              ? BottomButton(
                  name: "Proceed",
                  ontap: () {},
                )
              : null,
          body: SingleChildScrollView(
            primary: true,
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Column(
                children: <Widget>[
                  _cardSwipe(),
                  _cardSelection(),
                  _add == false ? _addNewButton() : Container(),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget _cardSwipe() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: MediaQuery.of(context).size.height * .2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: MediaQuery.of(context).size.width / 1.4,
            child: Image.asset("images/Visacard.png"),
            // fit: BoxFit.fill,
          );
        },
      ),
    );
  }

  Widget _cardSelection() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width / 1.2,
      child: Column(
        children: <Widget>[
          _radioCard("E-Wallet", "E-Wallet", "images/wallet.png"),
          _radioCard("Master", "xxxx-9167", "images/master.png"),
          _radioCard("Visa", "xxxx-6660", "images/visa.png"),
          _radioCard("PayPal", "xxxx-9753", "images/paypal.png"),
        ],
      ),
    );
  }

  Widget _radioCard(String value, String text, String img) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "$text",
                textAlign: TextAlign.start,
                style: TextStyle(color: HexColor('#2F8FFF'), fontSize: 14),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Image(
                height: 30,
                width: 10,
                image: AssetImage("$img"),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _addNewButton() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(bottom: 10, left: 25, right: 25, top: 20),
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: HexColor("#3B444B")),
        child: BottomButton(
          name: "+ Add New Card",
          ontap: () {
            setState(() {
              AppRoutes.push(context, AddCard());
            });
          },
        ));
  }
}

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController cardnumController;
  TextEditingController holderController;
  TextEditingController monthController;
  TextEditingController yearController;
  TextEditingController cvvController;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool _added = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: _added == false
              ? BottomButton(
                  name: "Proceed",
                  ontap: () {
                    setState(() {
                      _added = true;
                    });
                  },
                )
              : null,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: CustomeAppBar(
              title: "Add Card",
            ),
          ),
          body: SingleChildScrollView(
            primary: true,
            physics: BouncingScrollPhysics(),
            child: Container(
              child: _added == false
                  ? Column(
                      children: <Widget>[
                        _card(),

                        CreditCardForm(
                          onCreditCardModelChange: onCreditCardModelChange,
                        ),

                        // _enterCardDetails(),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    )
                  : _cardAdded(),
            ),
          )),
    );
  }

  Widget _enterCardDetails() {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            color: Colors.black,
            blurRadius: 8.0,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Image(
              image: AssetImage("images/wallet1.png"),
            ),
          ),
          _textFields(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // _add == true ? _add = false : _add = true;
                    });
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 14, color: HexColor("#343434")),
                  ),
                ),
                _addCardButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textFields() {
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        TextFormField(
          maxLength: 16,
          keyboardType: TextInputType.number,
          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
          validator: (value) {
            if (value.isEmpty) {
              return 'Please Enter Card Number';
            }
            return null;
          },
          controller: cardnumController,
          onSaved: (value) {
            print("$value");
          },
          decoration: InputDecoration(
              isDense: true,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              contentPadding: EdgeInsets.all(3),
              hintText: "CARD Number",
              hintStyle: TextStyle(fontSize: 14)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2),
        ),
        TextFormField(
          maxLength: 20,
          keyboardType: TextInputType.text,
          controller: holderController,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please Enter Card Holder Name';
            }
            return null;
          },
          onSaved: (String text) {
            print("$text");
          },
          decoration: InputDecoration(
              isDense: true,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              contentPadding: EdgeInsets.all(3),
              hintText: "Card Holder Name",
              hintStyle: TextStyle(fontSize: 14)),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: TextFormField(
                maxLength: 2,
                keyboardType: TextInputType.number,
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                controller: holderController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Month';
                  }
                  return null;
                },
                onSaved: (String text) {
                  print("$text");
                },
                decoration: InputDecoration(
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    contentPadding: EdgeInsets.all(3),
                    hintText: "MM",
                    hintStyle: TextStyle(fontSize: 14)),
              ),
            ),
            Spacer(),
            Expanded(
              child: TextFormField(
                maxLength: 2,
                keyboardType: TextInputType.number,
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                controller: holderController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'YY';
                  }
                  return null;
                },
                onSaved: (String text) {
                  print("$text");
                },
                decoration: InputDecoration(
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    contentPadding: EdgeInsets.all(3),
                    hintText: "YY",
                    hintStyle: TextStyle(fontSize: 14)),
              ),
            ),
            Spacer(),
            Expanded(
              child: TextFormField(
                maxLength: 3,
                keyboardType: TextInputType.number,
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                //controller: holderController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'CVV';
                  }
                  return null;
                },
                onSaved: (String text) {
                  print("$text");
                },
                decoration: InputDecoration(
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    contentPadding: EdgeInsets.all(3),
                    hintText: "CVV",
                    hintStyle: TextStyle(fontSize: 14)),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Widget _addCardButton() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * .05,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2), color: HexColor("#3B444B")),
      child: GestureDetector(
        onTap: () {
          if (_formKey.currentState.validate()) {
            setState(() {});
          }
        },
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                "  Add Card   ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      child: CreditCardWidget(
        cardNumber: cardNumber,
        expiryDate: expiryDate,
        cardHolderName: cardHolderName,
        cvvCode: cvvCode,
        showBackView: isCvvFocused,
        height: 175,
        textStyle: TextStyle(color: Colors.yellowAccent),
        width: MediaQuery.of(context).size.width,
        animationDuration: Duration(milliseconds: 1000),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  Widget _cardAdded() {
    return Center(
      heightFactor: 1.5,
      child: Container(
        alignment: Alignment.center,
        // width: MediaQuery.of(context).size.width / 1.2,
        //  / padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 40, bottom: 20),
              child: Image(
                height: 200,
                width: 280,
                image: AssetImage("images/Visacard.png"),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  AppRoutes.push(context, PaymentMethod());
                });
              },
              child: Image(
                height: 50,
                width: 100,
                image: AssetImage("images/success.png"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Text(
                "Card Added Succesfully!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
