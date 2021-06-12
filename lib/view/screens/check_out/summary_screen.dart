import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "Choose Summery",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
