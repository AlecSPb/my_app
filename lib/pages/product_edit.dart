import 'package:flutter/material.dart';

class ProductEdit extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Map<String, dynamic> product;
  final int productIndex;

  ProductEdit(
      {this.addProduct, this.updateProduct, this.product, this.productIndex});

  @override
  State<StatefulWidget> createState() {
    return _ProductEditState();
  }
}

class _ProductEditState extends State<ProductEdit> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'descriptin': null,
    'image': 'assets/food.jpg',
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget modelWidget(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text("Save"),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Center(
                child: Text("This is a Model"),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildTitleTextField() {
    return TextFormField(
      initialValue: widget.product == null ? '' : widget.product['title'],
      validator: (String value) {
        if (value.isEmpty || value.length < 3) {
          return "Title must be at least 3 character";
        }
      },
      decoration: InputDecoration(
        labelText: "Product Title",
      ),
      onSaved: (String value) {
        _formData['title'] = value;
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      initialValue: widget.product == null ? '' : widget.product['description'],
      validator: (String value) {
        if (value.isEmpty || value.length < 10) {
          return "Description must be at least 10 character";
        }
      },
      decoration: InputDecoration(
        labelText: "Product Description",
      ),
      maxLines: 4,
      onSaved: (String value) {
        _formData['description'] = value;
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      initialValue:
          widget.product == null ? '' : widget.product['price'].toString(),
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return "Title must be at least 1 number";
        }
      },
      decoration: InputDecoration(
        labelText: "Product Price",
      ),
      keyboardType: TextInputType.numberWithOptions(
        decimal: true,
      ),
      onSaved: (String value) {
        _formData['price'] = double.parse(value);
      },
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    if (widget.product == null) {
      widget.addProduct(_formData);
    } else {
      widget.updateProduct(widget.productIndex, _formData);
    }
    Navigator.pushReplacementNamed(context, '/products');
  }

  Widget _buildPageContent(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _buildTitleTextField(),
              _buildDescriptionTextField(),
              _buildPriceTextField(),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: RaisedButton(
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: _submitForm,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.product == null
        ? _buildPageContent(context)
        : Scaffold(
            appBar: AppBar(
              title: Text("Product Edit"),
            ),
            body: _buildPageContent(context));
  }
}
