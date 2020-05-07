import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transact/AppBar.dart';
import 'package:transact/Buyer/allCatagories.dart';
import 'package:transact/Buyer/buyerCart.dart';
import 'package:transact/Buyer/buyerNotification.dart';
import 'package:transact/Buyer/drawer.dart';
import 'package:transact/Buyer/itemDetails.dart';
import 'package:transact/Model/UserModel.dart';
import 'package:transact/utils/fonts.dart';
import 'package:transact/utils/routes.dart';
import 'package:transact/utils/utils.dart';

class BuyerHome extends StatefulWidget {
  @override
  _BuyerHomeState createState() => _BuyerHomeState();
}

class _BuyerHomeState extends State<BuyerHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var favorite = false;
  bool filter = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      drawer: BuyerDrawer(
        filter: filter,
      ),
      backgroundColor: HexColor("#F5F7FA"),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: CustomeAppBar(
          title: "Purchase Products",
          homepage: true,
          suffix: true,
          suffixIcon: "images/bell.png",
          type: "Buyer",
          bottomIcon1: "images/applyfilter.png",
          bottomIcon2: "images/shopping-cart.png",
          bottomIcon1OnTap: () {
            setState(() {
              User.userData.filter = true;
              //  filter = true;

              print("$filter");
            });
            _scaffoldKey.currentState.openDrawer();
          },
          bottomIcon2OnTap: () {
            AppRoutes.push(context, BuyerCart());
          },
          suffixOnTap: () {
            AppRoutes.push(context, BuyerNotifications());
          },
        ),
      ),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: _categories()),
    ));
  }

  Widget _categories() {
    return Container(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Categories", style: blackbold.copyWith(fontSize: 22)),
            Row(
              children: <Widget>[
                Expanded(child: _category("images/apparel.png", "Apparel")),
                Expanded(child: _category("images/beauty.png", "Beauty")),
                Expanded(child: _category("images/shoes.png", "Shoes")),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          AppRoutes.push(context, AllCategories());
                        },
                        child: _category("images/see-all.png", "See All"))),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              height: MediaQuery.of(context).size.height / 1.6,
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) => new Container(
                    color: Colors.white,
                    child: new Center(
                      child: _itemCardBuyer(),
                    )),
                staggeredTileBuilder: (int index) =>
                    new StaggeredTile.count(2, index.isEven ? 3 : 2.8),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _category(String image, String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: Image(
              image: AssetImage("$image"),
            ),
          ),
          Text(
            "$text",
            style: catagoryFont.copyWith(height: 0.1, fontSize: 13),
          )
        ],
      ),
    );
  }

  Widget _itemCardBuyer() {
    return GestureDetector(
      onTap: () {
        AppRoutes.push(context, ItemDetailsBuyer());
      },
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image(
                    image: AssetImage("images/shirt.png"),
                  ),
                  Container(
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
                          onTap: () {
                            setState(() {
                              favorite == true
                                  ? favorite = false
                                  : favorite = true;
                            });
                          },
                          child: Icon(
                            favorite == false
                                ? Icons.favorite_border
                                : Icons.favorite,
                            color: favorite == false
                                ? HexColor('#3B444B')
                                : Colors.red,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "\$58.99",
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: HexColor("#707070"),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'CaviarDreams'),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "\$24.99",
                          style: TextStyle(
                              color: HexColor("#515C6F"),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'CaviarDreams'),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Per Piece",
                          style: TextStyle(
                              color: HexColor("#707070"),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'CaviarDreams'),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: HexColor("#EFCE4A"),
                            size: 9,
                          ),
                          Icon(
                            Icons.star,
                            color: HexColor("#EFCE4A"),
                            size: 9,
                          ),
                          Icon(
                            Icons.star,
                            color: HexColor("#EFCE4A"),
                            size: 9,
                          ),
                          Icon(
                            Icons.star,
                            color: HexColor("#EFCE4A"),
                            size: 9,
                          ),
                          Icon(
                            Icons.star,
                            color: HexColor("#EFCE4A"),
                            size: 9,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "(10)",
                            style: TextStyle(fontSize: 9),
                          ),
                        ],
                      ),
                      Text(
                        "IN STOCK",
                        style: TextStyle(
                            color: HexColor("#707070"),
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'CaviarDreams'),
                      ),
                    ],
                  )
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

  Widget _buildRow(
    String image,
    String title,
  ) {
    final TextStyle tStyle =
        TextStyle(color: HexColor("#343434"), fontSize: 17.0);
    return InkWell(
        onTap: () {
          title == "Home" ? Navigator.pop(context) : null;
        },
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 17),
            //  padding: const EdgeInsets.symmetric(vertical: 5.0),
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
