import 'package:flutter/material.dart';


class CustomOnlineWidget extends StatelessWidget {
  final String title;
  final dynamic subtitle;
  final bool isDivider;
  final Color color;


  const CustomOnlineWidget( this.title,  this.subtitle, [this.isDivider = false, this.color = Colors.white]);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$title', style: TextStyle(fontSize: 14, color: this.color),),
              Text('$subtitle', style: TextStyle(fontSize: 14, color: this.color), )

            ],
          ),
        )
      ],
    );
  }
}



class SubChildItem extends StatelessWidget {
  final String key1;
  final String value;
  final bool isDivider;
  final Color color;
  double width ;
   SubChildItem(this.key1, this.value, this.isDivider,[this.color = Colors.black,this.width=2.5]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
              width: MediaQuery.of(context).size.width / width,
              child: Text(
                key1,
                style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w700),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: Text(
                ': $value',
                style: TextStyle(fontSize: 14, color: color,fontWeight: FontWeight.w500),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
          ],
        ),
        isDivider
            ? const Divider(
          thickness: 1,
          indent: 5,
          endIndent: 5,

        )
            : const SizedBox(),
      ],
    );
  }
}




class SubChildItem2 extends StatelessWidget {
  final String key1;
  final String value;
  final bool isDivider;
  final Color color;
  double width ;
  SubChildItem2(this.key1, this.value, this.isDivider,[this.color = Colors.black,this.width=2.5]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
              width: MediaQuery.of(context).size.width*0.5 / width,
              child: Text(
                key1,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: Text(
                ': $value',
                style: TextStyle(fontSize: 16, color: color,),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,

              ),
            ),
          ],
        ),
        isDivider
            ? const Divider(
          thickness: 1,
          indent: 5,
          endIndent: 5,

        )
            : const SizedBox(),
      ],
    );
  }
}
class SubChildItem3 extends StatelessWidget {
  final String key1;
  final String value;
  final bool isDivider;
  final Color color;
  double width ;
  SubChildItem3(this.key1, this.value, this.isDivider,[this.color = Colors.black,this.width=2.5]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
              width: MediaQuery.of(context).size.width / width,
              child: Text(
                key1,
                style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w700),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: Text(
                ': $value',
                style: TextStyle(fontSize: 14, color: color,fontWeight: FontWeight.w500,decoration:TextDecoration.underline ),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
          ],
        ),
        isDivider
            ? const Divider(
          thickness: 1,
          indent: 5,
          endIndent: 5,

        )
            : const SizedBox(),
      ],
    );
  }
}

class SubChildItem4 extends StatelessWidget {
  final String key1;
  final String value;
  final bool isDivider;
  final Color color;
  double width ;
  SubChildItem4(this.key1, this.value, this.isDivider,[this.color = Colors.black,this.width=2.5]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 0.8),
              width: MediaQuery.of(context).size.width*0.5 / width,
              child: Text(
                key1,
                style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: Text(
                ': $value',
                style: TextStyle(fontSize: 13, color: color,fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,

              ),
            ),
          ],
        ),
        isDivider
            ? const Divider(
          thickness: 1,
          indent: 5,
          endIndent: 5,

        )
            : const SizedBox(),
      ],
    );
  }
}
class SubChildItem5 extends StatelessWidget {
  final String key1;
  final String value;
  final bool isDivider;
  final Color color;
  double width ;
  SubChildItem5(this.key1, this.value, this.isDivider,[this.color = Colors.black,this.width=3]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
              width: MediaQuery.of(context).size.width*0.5 / width,
              child: Text(
                key1,
                style: const TextStyle(fontSize: 11,fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: Text(
                ': $value',
                style: TextStyle(fontSize: 11, color: color,fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,

              ),
            ),
          ],
        ),
        isDivider
            ? const Divider(
          thickness: 1,
          indent: 5,
          endIndent: 5,

        )
            : const SizedBox(),
      ],
    );
  }
}