import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transact/AppBar.dart';
import 'package:transact/Supplier/History.dart';
import 'package:transact/Supplier/ItemDetails.dart';
import 'package:transact/Supplier/addProduct.dart';
import 'package:transact/Supplier/bundleItems.dart';
import 'package:transact/Supplier/contactUs.dart';
import 'package:transact/Supplier/conversation.dart';
import 'package:transact/Supplier/expenses.dart';
import 'package:transact/Supplier/inventoryManagement.dart';
import 'package:transact/Supplier/myAccount.dart';
import 'package:transact/Supplier/orderReceived.dart';
import 'package:transact/Supplier/paymentMethod.dart';
import 'package:transact/Supplier/reports.dart';
import 'package:transact/Supplier/settings.dart';
import 'package:transact/Supplier/wallet.dart';
import 'package:transact/loginSignUp.dart';
import 'package:transact/utils/bottomButton.dart';
import 'package:transact/utils/routes.dart';
import 'package:transact/utils/utils.dart';

import 'mycart.dart';

class SellerDashBoard extends StatefulWidget {
  @override
  _SellerDashBoardState createState() => _SellerDashBoardState();
}

class _SellerDashBoardState extends State<SellerDashBoard> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  bool switchbuttton1=true;
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.transparent;
  bool switchControl = false;
  var textHolder = 'Switch is OFF';
  void toggleSwitch(bool value) {
    if (switchControl == false) {
      setState(() {
        switchControl = true;
        textHolder = 'Switch is ON';
      });
      print('Switch is ON');
      // Put your code here which you want to execute on Switch ON event.

    } else {
      setState(() {
        switchControl = false;
        textHolder = 'Switch is OFF';
      });
      print('Switch is OFF');
      // Put your code here which you want to execute on Switch OFF event.
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5F7FA),
        body: _sellerHome(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(125.0),
          child: CustomeAppBar(
            homepage: true,
            title: "Cashier",
            key: _key,
          ),
        ),
       // floatingActionButton: _fab(context),
        drawer: _buildDrawer(),
      ),
    );
  }

  Widget _sellerHome() {
    return Container(
        height: MediaQuery.of(context).size.height / 1.15,
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) => new Container(
              color: Colors.white,
              child: new Center(
                child: itemCardSeller(
                  index==0?'images/kurti.png':index==2?'images/im2.png':index==3?'images/im3.png':index==4?'images/im4.png':index==5?'images/im5.png':
                  index==6?'images/im6.png':index==7?'images/im7.png':'images/im1.png',
               // index==0?'images/discountTag.png':index==1?'images/discountTag.png':index==2?'images/discountTag.png':index,
                  index
                ),
              )),
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 3 : 2.8),
          mainAxisSpacing: 7.0,
          crossAxisSpacing: 7.0,
        ));
  }

  // Widget _itemCardSeller() {
  //   return Container(
  //     margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 4),
  //     color: Colors.white,
  //     child: Stack(
  //       children: <Widget>[
  //         Container(
  //           //padding: EdgeInsets.symmetric(vertical: 30),
  //           child: Column(
  //            // mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: <Widget>[
  //               Image(
  //                 image: AssetImage("images/shirt.png"),
  //               ),
  //               Container(
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: <Widget>[
  //                     Text(
  //                       "V Neck Shirt - Black",
  //                       style: TextStyle(
  //                           color: HexColor("#3B444B"),
  //                           fontSize: 14,
  //                           fontWeight: FontWeight.bold,
  //                           fontFamily: 'CaviarDreams'),
  //                     ),
  //                     GestureDetector(
  //                       onTap: () {},
  //                       child: Icon(
  //                         Icons.more_vert,
  //                         color: HexColor('#3B444B'),
  //                         size: 22,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Container(
  //                 alignment: Alignment.centerLeft,
  //                 child:
  //                  Text(
  //                   "\$24.99",
  //                   style: TextStyle(
  //                       color: HexColor("#707070"),
  //                       fontSize: 12,
  //                       fontWeight: FontWeight.bold,
  //                       fontFamily: 'CaviarDreams'),
  //                 ),
  //               ),
           
  //             ],
  //           ),
  //         ),
  //         Align(
  //             alignment: Alignment.topRight,
  //             child: Container(
  //                 height: 20,
  //                 width: 35,
  //                 decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                     image: AssetImage("images/discountTag.png"),
  //                   ),
  //                 ),
  //                 child: Center(
  //                   child: Text(
  //                     "-10%",
  //                     textAlign: TextAlign.center,
  //                     style: TextStyle(fontSize: 10, color: Colors.white),
  //                   ),
  //                 ))),
  //       ],
  //     ),
  //   );
  // }

  Widget itemCardSeller(String img,index) {
    return GestureDetector(
      onTap: () {
        AppRoutes.push(context, ItemDetails());
      },
      child: Container(

        margin: EdgeInsets.only(left: 10, right: 10, top: 10,),
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              child: Column(
               // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image(
                    image: AssetImage("$img"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "V Neck Shirt - Black",
                          style: TextStyle(
                              color: HexColor("#3B444B"),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'CaviarDreams'),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.more_vert,
                            color: HexColor('#3B444B'),
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child:Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                     
                            
                         Text(
                          "\$24.99",
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color:Color(0xff515C6F),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                          )
                        ),
                      

                    
           
                            Container(
                              margin: EdgeInsets.only(top:0,left:8),
                              child:Text(
                          "\$58.99",
                          style: TextStyle(
                              color: Color(0xff8D8C8C),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                          )
                             ) ),
             
                    
                    
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      AppRoutes.push(context,SellerMycart() );
                    },
                    child:Container(
                    margin: EdgeInsets.only(top:10),
                    decoration: BoxDecoration(
                       color: Color(0xff3B444B),
                      borderRadius: BorderRadius.circular(6)
                    ),
                    width: MediaQuery.of(context).size.width/3,
                    height: MediaQuery.of(context).size.height/20,
                    child: Center(child: Text('Add to card',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold
                    ),),
                   ) ))
          
                ],
              ),
            ),
            Align(
                alignment: Alignment.topRight,
                child: Container(
                    height: 20,
                    width: 35,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/discountTag.png"),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "-10%",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }

  Widget _fab(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRoutes.push(context, AddProduct());
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .15,
        height: MediaQuery.of(context).size.width * .15,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xff3B444B),
                  const Color(0xff1A956C),
                  const Color(0xff3B444B),
                ]),
            borderRadius: BorderRadius.circular(600)),
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _buildDrawer() {
    return Drawer(
      elevation: 3,
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 25),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("images/profile.png"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2, bottom: 10),
                child: Text(
                  "John Doe",
                  style: TextStyle(
                    color: HexColor("#343434"),
                    fontSize: 18.0,
                  ),
                ),
              ),
              _buildRow("images/home.png", "Home"),
              _buildRow("images/cart.png", "Order Received"),
              _buildRow(
                "images/conversation.png",
                "Conversation",
              ),
              _buildRow(
                "images/bundle.png",
                "Bundle Items",
              ),
              _buildRow("images/card.png", "Payment Method"),
              _buildRow("images/inventory.png", "Inventory Management"),
              _buildRow("images/expenses.png", "Expenses"),
              _buildRow("images/reports.png", "Reports"),
              _buildRow("images/history.png", "History"),
              _buildRow("images/wallet.png", "Wallet"),
              _buildRow("images/user2.png", "My Account"),
              _buildRow("images/settings.png", "Settings"),
              _buildRow("images/contact-us.png", "Contact Us"),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  child: BottomButton(
                    name: "LOG OUT",
                    image: Image(
                      height: 20,
                      width: 20,
                      image: AssetImage("images/logout.png"),
                    ),
                    ontap: () {
                      AppRoutes.push(context, Login());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(
    String image,
    String title,
  ) {
    final TextStyle tStyle =
        TextStyle(color: HexColor("#343434"), fontSize: 17.0);
    return InkWell(
        onTap: () {
          title == 'Home'
              ? Navigator.pop(context)
              : title == 'Conversation'
                  ? AppRoutes.push(context, Conversation())
                  : title == 'Contact Us'
                      ? AppRoutes.push(context, ContactUs())
                      : title == 'Payment Method'
                          ? AppRoutes.push(context, PaymentMethod())
                          : title == 'History'
                              ? AppRoutes.push(context, SupplierHistory())
                              : title == 'Wallet'
                                  ? AppRoutes.push(context, Wallet())
                                  : title == 'Order Received'
                                      ? AppRoutes.push(context, OrderReceived())
                                      : title == 'My Account'
                                          ? AppRoutes.push(context, MyAccount())
                                          : title == 'Settings'
                                              ? AppRoutes.push(
                                                  context, Settings())
                                              : title == 'Bundle Items'
                                                  ? AppRoutes.push(
                                                      context, BundleItems())
                                                  : title ==
                                                          'Inventory Management'
                                                      ? AppRoutes.push(context,
                                                          InventoryManagement())
                                                      : title == 'Expenses'
                                                          ? AppRoutes.push(
                                                              context,
                                                              Expenses())
                                                          : title == 'Reports'
                                                              ? AppRoutes.push(
                                                                  context,
                                                                  Reports())
                                                              : null;
        },
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 1, horizontal: 17),
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(children: [
              Image(
                height: 25,
                width: 25,
                image: AssetImage("$image"),
              ),
              SizedBox(width: 17.0),
              Text(
                title,
                style: tStyle,
              ),
            ])));
  }
}
