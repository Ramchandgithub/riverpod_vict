import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/constants.dart';

class BusinesSummeryGridWidget extends StatelessWidget {
  final String key1;
  final String value;
  final String image;
  final Color colors;
  BusinesSummeryGridWidget( this.image,this.key1, this.value, this.colors);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Image.asset(
            '${Constants.ImagePath}$image',
            color: colors,
            height: 25,
            width: 30,
          ),
          const SizedBox(height: 10,),
          Text(
            '$key1',
            maxLines: 5,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 10),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '$value',
            style:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}