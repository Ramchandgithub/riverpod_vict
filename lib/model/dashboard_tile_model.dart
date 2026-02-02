


import 'package:flutter/material.dart';

class DashboardTile {
  final String title;
  final String icon;
  final String value;
  final  Widget? custom;

  DashboardTile({
   required this.title,  required this.icon, required this.value, this.custom
});

}