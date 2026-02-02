
import 'package:get/get.dart';
import 'package:flutter/material.dart';



class LeadingIcon extends StatelessWidget {
  const LeadingIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child:  IconButton(
          iconSize: 20,
          icon:Icon(Icons.arrow_back_outlined,
          color: Theme.of(context).primaryColor),
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }
}