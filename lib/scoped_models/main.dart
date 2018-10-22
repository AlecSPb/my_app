import 'package:scoped_model/scoped_model.dart';

import '../scoped_models/connected_products.dart';

class MainModel extends Model with ConnectedProductsModel, ProductsModel, UserModel{
  
}