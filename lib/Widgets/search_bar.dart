
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({Key? key, required onQueryChanged}) : super(key: key);
  static const String routeName = '/CustomSearchBar';

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  String Query = '';
  List list1 = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child:  Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 45.0,
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    fillColor: Colors.black12,
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    suffixIcon: Icon(Icons.search, color: Colors.white,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: TextStyle(color: Colors.white70,
                      fontWeight: FontWeight.w700, fontSize: 14,
                    ),
                    hintText: 'Search'
                ),
               onChanged: onQueryChanged(Query, list1),

              ),
            ),
          ),
          const  SizedBox(width: 10,),
          Container(
            width: 45.0,
            height: 45.0,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5),
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                    image: CachedNetworkImageProvider('https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg'), fit: BoxFit.cover)
            ),
          )
        ],
      ),
    );
  }

   onQueryChanged(String newQuery, List list) {
      setState(() {
          Query = newQuery;
          print("query....$Query");
      });
  }
}
