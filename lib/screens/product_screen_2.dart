import 'package:flutter/material.dart';
import 'package:flutter_state/state_manage/shirt_data.dart';
import 'package:flutter_state/utils/reusable.dart';
import 'package:provider/provider.dart';

class ProductScreen2 extends StatefulWidget {
  @override
  _ProductScreen2State createState() => _ProductScreen2State();
}

class _ProductScreen2State extends State<ProductScreen2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Reusable.buildAppBar(
            context: context, title: 'Shirt 11 - 20', action: true),
        body: Consumer<ShirtCart>(
          builder: (_, cartData, child) => ListView.builder(
              itemCount: cartData.screen2ProductList.length,
              itemBuilder: (_, index) => Card(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 80,
                      child: Row(
                        children: [
                          Text(cartData.screen2ProductList[index].name,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.blue)),
                          Spacer(),
                          cartData.checkExistInCart(
                                  product: cartData.screen2ProductList[index])
                              ? Reusable.existItem(
                                  cartData: cartData,
                                  index: index,
                                  list: cartData.screen2ProductList)
                              : Reusable.notExistItem(
                                  cartData: cartData,
                                  index: index,
                                  list: cartData.screen2ProductList)
                        ],
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
