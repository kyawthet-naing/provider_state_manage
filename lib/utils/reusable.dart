import 'package:flutter/material.dart';
import 'package:flutter_state/models/product_model.dart';
import 'package:flutter_state/state_manage/shirt_data.dart';
import 'package:flutter_state/utils/route_name.dart';
import 'package:provider/provider.dart';

class Reusable {
  static buildButtonContainer(
      {@required IconData icon, @required Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
        child: Icon(icon, size: 30, color: Colors.white),
      ),
    );
  }

  static buildAppBar(
          {@required BuildContext context,
          @required String title,
          bool action = false}) =>
      AppBar(
          title: Text(title),
          actions: action
              ? [
                  buildElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, cart),
                      isCart: true,
                      title:
                          'i - ${Provider.of<ShirtCart>(context).getCartCount.toString()} / q - ${Provider.of<ShirtCart>(context).getCartQuantity.toString()}')
                ]
              : null);

  static buildElevatedButton(
          {@required Function onPressed,
          @required String title,
          bool isCart}) =>
      ElevatedButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isCart == null
                  ? SizedBox()
                  : Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
              SizedBox(width: 10),
              Text(title, style: TextStyle(fontSize: 18, color: Colors.white)),
            ],
          ));

  static notExistItem(
      {ShirtCart cartData, int index, @required List<Product> list}) {
    return GestureDetector(
        onTap: () => cartData.addProductToCart(product: list[index]),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            width: 150,
            height: 40,
            child: Text('Add to cart',
                style: TextStyle(fontSize: 20, color: Colors.white))));
  }

  static existItem(
      {ShirtCart cartData, int index, @required List<Product> list}) {
    return Row(children: [
      Reusable.buildButtonContainer(
          icon: Icons.remove,
          onTap: () => cartData.decreaseOrderCount(product: list[index])),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            cartData.getOrderCount(product: list[index]).toString(),
            style: TextStyle(fontSize: 20),
          )),
      Reusable.buildButtonContainer(
          icon: Icons.add,
          onTap: () => cartData.increaseOrderCount(product: list[index]))
    ]);
  }
}
