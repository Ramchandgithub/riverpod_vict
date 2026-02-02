

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeadingIconWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        minRadius: 2,
          child: IconButton(onPressed: () { Navigator.pop(context);  },
            icon: Icon(Icons.arrow_back, color: Colors.black,size: 20,),)),
    );

  }

}