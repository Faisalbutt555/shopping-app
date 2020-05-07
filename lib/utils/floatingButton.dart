import 'package:flutter/material.dart';
import 'package:transact/Supplier/bundleItems.dart';
import 'package:transact/utils/routes.dart';

class CustomFloatingButton extends StatefulWidget {
  Function ontap;
  CustomFloatingButton({
    this.ontap,
  });
  @override
  _CustomFloatingButtonState createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        AppRoutes.push(context, AddBundle());
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
}