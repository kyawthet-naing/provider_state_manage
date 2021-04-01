import 'package:flutter/material.dart';
import 'package:flutter_state/state_manage/shirt_data.dart';
import 'package:flutter_state/utils/reusable.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: Reusable.buildAppBar(
              context: context, title: 'Cart', action: false),
          body: Consumer<ShirtCart>(
            builder: (context, cartData, child) => ListView.builder(
              itemCount: cartData.getCartCount,
              itemBuilder: (context, index) => Card(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 80,
                  child: Row(
                    children: [
                      Text(cartData.cartList[index].name,
                          style: TextStyle(fontSize: 20, color: Colors.blue)),
                      Spacer(),
                      Reusable.existItem(
                          cartData: cartData,
                          index: index,
                          list: cartData.cartList)
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
