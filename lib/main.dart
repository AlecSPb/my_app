import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
//import 'package:flutter/rendering.dart';

import './pages/products.dart';
import './pages/products_admin.dart';
import './pages/product.dart';
import './pages/auth.dart';
import './scoped_models/main.dart';
import './models/product.dart';

void main() {
  //debugPaintSizeEnabled = true;
  //debugPaintBaselinesEnabled = true;
  //debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    final MainModel model = MainModel();
    return ScopedModel(
      model: model,
          child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
          buttonColor: Colors.deepPurple,
          //fontFamily: 'Oswald',
        ),
        //home: AuthPage(),
        //home: ProductsAdminPage(),
        routes: {
          '/': (BuildContext context) => AuthPage(),
          '/products': (BuildContext context) => ProductsPage(model),
          '/admin': (BuildContext context) =>
              ProductsAdminPage(model),
        },

        onGenerateRoute: (RouteSettings setting) {
          final List<String> pathElements = setting.name.split('/');

          if (pathElements[0] != '') {
            return null;
          }

          if (pathElements[1] == 'product') {
            final String productId = pathElements[2];
            final Product product = model.allProducts.firstWhere((Product product) {
              return product.id == productId;
            });

            return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ProductPage(product),
            );
          }

          return null;
        },
        onUnknownRoute: (RouteSettings setting) {
          return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage(model),
          );
        },
      ),
    );
  }
}
