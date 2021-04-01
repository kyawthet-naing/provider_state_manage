import 'package:flutter/foundation.dart';
import 'package:flutter_state/models/product_model.dart';

class ShirtCart extends ChangeNotifier {
  List<Product> screen1ProductList = [
    Product(name: 'Shirt-1', id: 1),
    Product(name: 'Shirt-2', id: 2),
    Product(name: 'Shirt-3', id: 3),
    Product(name: 'Shirt-4', id: 4),
    Product(name: 'Shirt-5', id: 5),
    Product(name: 'Shirt-6', id: 6),
    Product(name: 'Shirt-7', id: 7),
    Product(name: 'Shirt-8', id: 8),
    Product(name: 'Shirt-9', id: 9),
    Product(name: 'Shirt-10', id: 10),
  ];

  List<Product> screen2ProductList = [
    Product(name: 'Shirt-11', id: 11),
    Product(name: 'Shirt-12', id: 12),
    Product(name: 'Shirt-13', id: 13),
    Product(name: 'Shirt-14', id: 14),
    Product(name: 'Shirt-15', id: 15),
    Product(name: 'Shirt-16', id: 16),
    Product(name: 'Shirt-17', id: 17),
    Product(name: 'Shirt-18', id: 18),
    Product(name: 'Shirt-19', id: 19),
    Product(name: 'Shirt-20', id: 20),
  ];

  List<Product> cartList = [];
  List<Product> toRemove = [];

  int get getCartCount {
    return cartList.length;
  }

  int get getCartQuantity {
    int quantity = 0;
    cartList.forEach((element) {
      quantity += element.orderCount;
    });
    return quantity;
  }

  void addProductToCart({@required Product product}) {
    product.orderCount++;
    cartList.add(product);
    notifyListeners();
  }

  void decreaseOrderCount({@required Product product}) {
    cartList.forEach((p) {
      if (p.id == product.id) {
        if (product.orderCount > 0) product.orderCount--;
        if (product.orderCount == 0) toRemove.add(product);
      }
    });
    cartList.removeWhere((e) => toRemove.contains(e));
    toRemove.clear();
    notifyListeners();
  }

  void increaseOrderCount({@required Product product}) {
    cartList.forEach((p) {
      if (p.id == product.id) {
        product.orderCount++;
        return;
      }
    });
    notifyListeners();
  }

  int getOrderCount({@required Product product}) {
    int count;
    cartList.forEach((p) {
      if (p.id == product.id) {
        count = p.orderCount;
      }
    });
    return count;
  }

  bool checkExistInCart({@required Product product}) {
    bool bol = false;
    cartList.forEach((p) {
      if (p.id == product.id) {
        bol = true;
        return;
      }
    });
    return bol;
  }
}
