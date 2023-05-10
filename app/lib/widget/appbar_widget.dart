
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context){
  return AppBar(
    leading: BackButton(
      color: Colors.black,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    
  );
}