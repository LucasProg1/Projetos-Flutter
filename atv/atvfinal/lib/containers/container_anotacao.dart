import 'package:flutter/material.dart';

class ContainerAnot extends StatelessWidget {
  const ContainerAnot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Text(
        "Anotações",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
