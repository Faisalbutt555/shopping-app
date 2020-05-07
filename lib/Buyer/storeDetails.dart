import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transact/utils/utils.dart';

import '../AppBar.dart';

class StoreDetails extends StatefulWidget {
  @override
  _StoreDetailsState createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  var favorite = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: HexColor("#F5F7FA"),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: CustomeAppBar(
              title: "Store Name",
              homepage: false,
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) => new Container(
                  color: Colors.white,
                  child: new Center(
                    child: _itemCardSupplier(),
                  )),
              staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2, index.isEven ? 3 : 2.8),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          )),
    );
  }

  Widget _itemCardSupplier() {
    return Container(
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
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Min Order : (10)",
                    style: TextStyle(
                        color: HexColor("#707070"),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'CaviarDreams'),
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
                      "(81/100) IN STOCK",
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
    );
  }
}
