import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:transact/sellermode/sellerorder.dart';
import 'package:transact/utils/bottomButton.dart';
import 'package:transact/utils/routes.dart';
import 'package:transact/utils/utils.dart';

import '../AppBar.dart';
class SellerMycart extends StatefulWidget {
  @override
  _SellerMycartState createState() => _SellerMycartState();
}

class _SellerMycartState extends State<SellerMycart> {
    int counter = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: HexColor("#F5F7FA"),
          bottomNavigationBar: _bottomBar(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Padding(
              padding: EdgeInsets.only(top:0),
              child: 
            
            CustomeAppBar(
              title: "My Cart",
              homepage: false,
            ),
           ) ),
          body:SingleChildScrollView(
            child:
          
           Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height/2.5,
                  child:ListView.builder(
              itemCount:3,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                 // height: 30,
                  child: _cartItem(),
                );
              },
                  )  ),
                  SizedBox(height: 10,),
            _voucher()
              ],
            )
      
          )
          ),
     ) );
  }
  
  Widget _bottomBar() {
    return Container(
      height: MediaQuery.of(context).size.height * .08,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Total\n",
                      style: TextStyle(
                          fontSize: 15,
                          color: HexColor("#3B444B"),
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "\$875",
                      style: TextStyle(
                          fontSize: 12,
                          color: HexColor("#3B444B"),
                          fontWeight: FontWeight.bold))
                ]),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: BottomButton(
                name: "Check Out",
                customColor: true,
                color: HexColor("#FF6D2B"),
                ontap: () {
                  AppRoutes.replace(context, Sellerorder());
                },
              ),
            ),
          )
        ],
      ),
    );
  }
  
  Widget _cartItem() {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child:
    Card(
      elevation: 7,
      //height: MediaQuery.of(context).size.height * .1,
      color: Colors.white,
      margin: EdgeInsets.only(top:5, left: 10, right: 10),
      child: Container(
        height: MediaQuery.of(context).size.height/7.5,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin:EdgeInsets.only(left: 3),
             
              width: MediaQuery.of(context).size.width/5,
                child: Image.asset("images/item3.png",
                scale: 7,),
              ),
              
              Padding(
                padding:EdgeInsets.only(left: 4),
                child: 
              
          Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Iphone X\n",
                          style: TextStyle(
                              fontSize: 12,
                              height: 2,
                              color:Color(0xff3B444B),
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "\$875",
                          style: TextStyle(
                              height: 1.5,
                              fontSize: 12,
                              color:Color(0xff515C6F),
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "   per piece",
                          style: TextStyle(
                              fontSize:7,
                              color:Color(0xff939698),
                              fontWeight: FontWeight.bold))
                    ]),
                  ),
                  Container(
                    width:MediaQuery.of(context).size.width/1.5,
                    child: 
                  
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
   _counter(),
        Text("\$924",
                  style: TextStyle(
                      fontSize:10,
                      color:Color(0xff515C6F),
                      fontWeight: FontWeight.bold)),
          
             ],
                      )    )
               
                ],
               ) 
               ),
   
       
          ],
        ),
      ),
    ),
       actions: <Widget>[],
      secondaryActions: <Widget>[
        IconSlideAction(
         
          foregroundColor: Colors.white,
          color: Color(0xffFF3D00),
          iconWidget: Image.asset(
            'images/deletechat.png',
            scale:4,
          ),
          onTap: () => _showSnackBar('Delete'),
        ),
      ],
    );

  }
  
  Widget _text(String text1, String text2) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$text1",
         // style: headingFont.copyWith(color: HexColor("#363636"), fontSize: 14),
        ),
        Text(
          "$text2",
         // style: headingFont.copyWith(color: Colors.black, fontSize: 14),
        ),
      ],
    ));
  }
  
    Widget _textField(String image, String label, id) {
    return Container(

      margin: EdgeInsets.only(right:2, top: 5),
      height:MediaQuery.of(context).size.height/18,
      child: TextFormField(
        decoration: InputDecoration(
          isDense: true,
          icon: image == ""
              ? null
              : Container(
                  height: 45,
                  width: 30,
                  child: Image.asset("$image"),
                ),
          filled: true,
          fillColor: HexColor("#FFFFFF"),
          hintText: "$label",
          hintStyle: TextStyle(
              fontFamily: "CaviarDreams",
              fontSize: 14,
              color: HexColor("#939698")),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(id == 3 ? 4 : 10),
              borderSide: BorderSide(color: HexColor("#707070"))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(id == 3 ? 4 : 10),
              borderSide: BorderSide(width: 1, color: HexColor("#707070"))),
        ),
      ),
    );
  }
  Widget _voucher() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      color: Colors.white,
      padding: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
         // _text("Subtotal (1 item)", "\$9024.99"),
          SizedBox(
            height: 5,
          ),
         // _text("Shipping fee", "\$ 15"),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: _textField("", "Any Discount", 3),
                ),
                Expanded(
                flex: 1,
                  child:Container(
                    margin: EdgeInsets.only(left: 4),
                    height:MediaQuery.of(context).size.height/18,
                    width: MediaQuery.of(context).size.width/29,
                    child: BottomButton(
                      name: "Apply",
                      customColor: true,
                      color: HexColor("#E8DDDD"),
                      ontap: () {
                        print("Voucher");
                      },
                    ),
                  ),
              
                 ) ],
            ),
          ),
        ],
      ),
    );
  }

    Widget _showSnackBar(
    String txt,
  ) {
    return Column(
      children: <Widget>[
        Text(
          '$txt',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
    Widget _counter() {
    return Container(
      height:MediaQuery.of(context).size.height/26,
      width: MediaQuery.of(context).size.width * .24,
      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
     
        borderRadius: BorderRadius.circular(03),
        color: Colors.grey[200],
      ),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                counter >= 2 ? counter = counter - 1 : null;
              });
            },
            child: Container(height: 30, child: Icon(Icons.remove,size: 10,)),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 17),
              child: Text(
                "$counter",
                style: TextStyle(fontSize: 10),
              )),
          GestureDetector(
            onTap: () {
              setState(() {
                counter = counter + 1;
              });
            },
            child: Container(height: 30, child: Icon(Icons.add,size: 10,)),
          ),
        ],
      ),
    );
  }
}