import 'package:flutter/material.dart';
import 'package:flutter_state/state_manage/shirt_data.dart';
import 'package:flutter_state/utils/reusable.dart';
import 'package:provider/provider.dart';

class ProductScreen1 extends StatefulWidget {
  @override
  _ProductScreen1State createState() => _ProductScreen1State();
}

class _ProductScreen1State extends State<ProductScreen1> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: Reusable.buildAppBar(context: context, title: 'Shirt 1 - 10',action: true),
          body: Consumer<ShirtCart>(
            builder: (context, cartData, child) => ListView.builder(
              itemCount: cartData.screen1ProductList.length,
              itemBuilder: (context, index) => Card(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 80,
                  child: Row(
                    children: [
                      Text(
                          cartData.screen1ProductList[index].name,
                          style: TextStyle(fontSize: 20, color: Colors.blue)),
                      Spacer(),
                      cartData.checkExistInCart(product: cartData.screen1ProductList[index])
                          ? Reusable.existItem(
                              cartData: cartData,
                              index: index,
                              list:cartData.screen1ProductList)
                          : Reusable.notExistItem(
                              cartData: cartData,
                              index: index,
                              list:cartData.screen1ProductList)
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
