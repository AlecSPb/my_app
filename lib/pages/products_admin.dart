import 'package:flutter/material.dart';

import './product_edit.dart';
import './product_list.dart';

class ProductsAdminPage extends StatelessWidget {
  final Function addProduct;
  final Function updateProduct;
  final Function deleteProduct;
  final List<Map<String, dynamic>> products;

  ProductsAdminPage(this.addProduct, this.updateProduct, this.deleteProduct, this.products);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Choose"),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            contentPadding: EdgeInsets.all(20.0),
            leading: Icon(Icons.list),
            title: Text("All Products"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/products');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text("Manage Products"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                //text: "Create Products",
                icon: Icon(Icons.create),
              ),
              Tab(
                //text: "My Products",
                icon: Icon(Icons.list),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductEdit(addProduct: addProduct),
            ProductList(products, updateProduct, deleteProduct),
          ],
        ),
      ),
    );
  }
}
