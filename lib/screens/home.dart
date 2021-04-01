import 'package:flutter/material.dart';
import 'package:flutter_state/utils/reusable.dart';
import 'package:flutter_state/utils/route_name.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: Reusable.buildAppBar(
          context: context, title: 'Flat State', action: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Reusable.buildElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, product1),
                  title: 'Shirt Screen 1'),
              Reusable.buildElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, product2),
                  title: 'Shirt Screen 2'),
            ],
          ),
        ),
      ),
    ));
  }
}
