import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      return Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              'Bhandara,Chitwan',
            ),
          );
    }
}