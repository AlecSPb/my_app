import 'package:flutter/material.dart';

import './product_edit.dart';

class ProductList extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;
  final Function deleteProduct;

  ProductList(this.products, this.updateProduct, this.deleteProduct);

  Widget _buildEditButton(BuildContext context, int index){
    return IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ProductEdit(
                        product: products[index],
                        updateProduct: updateProduct,
                        productIndex: index,
                      );
                    }));
                  },
                );
  }

  Widget _buildProductList(){
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              deleteProduct(index);
            }
          },
          background: Container(
            color: Colors.red,
            margin: EdgeInsets.only(bottom: 8.0),
          ),
          key: Key(products[index]['title']),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                    backgroundImage: AssetImage(products[index]['image'])),
                title: Text(products[index]['title']),
                subtitle: Text('\$${products[index]['price']}'),
                trailing: _buildEditButton(context, index),
              ),
              Divider(),
            ],
          ),
        );
      },
      itemCount: products.length,
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
