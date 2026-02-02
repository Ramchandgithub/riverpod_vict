
import 'package:flutter/material.dart';

class AddingWidget extends StatelessWidget {
  const AddingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: Colors.red,style: BorderStyle.solid, strokeAlign: BorderSide.strokeAlignInside, width: 2),
          // padding: EdgeInsets.all(0.0),
          fixedSize: const Size(80, 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
      ),
      onPressed: () async {

      },
      child: const Text("ADD", style: TextStyle(color: Colors.green, fontSize: 8),),
    );
  }
}
