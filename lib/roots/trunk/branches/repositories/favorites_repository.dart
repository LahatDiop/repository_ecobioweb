

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ecobioweb/roots/trunk/branches/products/components/product.dart';
import 'package:ecobioweb/roots/trunk/branches/repositories/app_constants_repository.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../cart/components/cart_item.dart';

class  FavoritesRepository{



  Future<List<Product>> fetchCartFromRepository() async{
    try{
      final response = await http.get(Uri.parse(AppConstantsRepository.productData));

      return List<Product>.from(json.decode(const Utf8Decoder().convert(response.body.codeUnits)).map(
            (model)=>Product.fromJson(model),
      )
      );

    }catch(e){
      rethrow;
    }
  }

  Future<Product> fetchProductFromRepository(String id) async{
    try{
      final response= await http.get(Uri.parse(AppConstantsRepository.productDetails(id)));
      return Product.fromJson(jsonDecode( const Utf8Decoder().convert(response.body.codeUnits)));

    }catch(e){
      throw e;
    }
  }

  Future <List<String>> fetchFavoritesFromRepository() async{
    try{
      SharedPreferences pref =await SharedPreferences.getInstance();

      final favorites= pref.getStringList('favorites-products');
      if(favorites ==null){
        return [];
      }else{
        return favorites;
      }
    }catch(e){
      rethrow;
    }

  }

  Future <List<String>> fetchIsRecentlyFromRepository() async{
    try{
      SharedPreferences pref =await SharedPreferences.getInstance();

      final favorites= pref.getStringList('isRecently-products');
      if(favorites ==null){
        return [];
      }else{
        return favorites;
      }
    }catch(e){
      rethrow;
    }

  }

  /// ---> Save

  void saveCartToRepository(List<String> carts) async{
    try{
      SharedPreferences pref =await SharedPreferences.getInstance();
      await pref.setStringList('favorites-products', carts);

    }catch(e){
      rethrow;
    }
  }


  void saveRecentlyToRepository(List<String> recentlys) async{
    try{
      SharedPreferences pref =await SharedPreferences.getInstance();
      await pref.setStringList('isRecently-products', recentlys);

    }catch(e){
      rethrow;
    }
  }

}