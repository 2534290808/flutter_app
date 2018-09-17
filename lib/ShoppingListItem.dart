import 'package:flutter/material.dart';

class Product {
  Product({this.name});
  final String name;
}

//给函数定义别名
typedef void CartChangedCallback(Product product,bool inCart);


class ShoppingListItem extends StatelessWidget {
  //因为super中不能直接使用this,所以构造函数中不能写为this.product
  ShoppingListItem({Product product,this.inCart,this.onCartChanged}):product = product,super(key:new ObjectKey(product));

  final bool inCart;
  final CartChangedCallback onCartChanged;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(product.name, style: _getTextStyle(context)),
    );
  }

  Color _getColor(BuildContext context){
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }
}