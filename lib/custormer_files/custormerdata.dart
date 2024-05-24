
import 'package:flutter/material.dart';

class Customerdata extends StatelessWidget {
  const Customerdata({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue.shade300,Colors.purple.shade300])
        ),
      child: const AlertDialog(
        backgroundColor: Colors.white,
        title: Text("customer data not found"),
      ),
    );
  }
}