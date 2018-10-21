import 'package:flutter/material.dart';

import './price_tag.dart';
import '../ui_elements/title_default.dart';
import './address_tag.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  Widget _buildTitlePriceRow(){
    return Container(
            margin: EdgeInsets.only(top: 16.0, bottom: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // MY Default title ui_delment
                TitleDefault(product['title']),
                SizedBox(
                  width: 10.0,
                ),
                // My Custom price Tag widget
                PriceTag(product['price'].toString()),
              ],
            ),
          );
  }

  Widget _buildBottomBar(BuildContext context){
    return ButtonBar(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
                onPressed: () => Navigator.pushNamed<bool>(
                            context, '/product/' + productIndex.toString())
                        .then((bool value) {
                      if (value) {
                        // deleteProduct(index);
                      }
                    }),
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: () => Navigator.pushNamed<bool>(
                            context, '/product/' + productIndex.toString())
                        .then((bool value) {
                      if (value) {
                        // deleteProduct(index);
                      }
                    }),
              ),
            ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(
            product['image'],
          ),
          _buildTitlePriceRow(),
          // My own AddressTag widget
          AddressTag(),
          _buildBottomBar(context),
        ],
      ),
    );
  }
}
