

import 'package:ecobioweb/roots/trunk/branches/repositories/favorites_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../products/components/product.dart';

///  ! Save, fetch product, favorites products from SharedPreference :RepositoryApp


class FavoriteProvider  with ChangeNotifier{

  static  final List<Product> _itemsFavoritesList=[];

  List<Product> get itemsFavoritesList{
    return _itemsFavoritesList;
  }

  final Map<String, Product>_itemsFavorites ={};
 
   Map<String, Product> get favorites{
   return {..._itemsFavorites};
 }


 static final FavoritesRepository _favoritesRepository=GetIt.instance<FavoritesRepository>();

 @observable
  ObservableList<Product> _favoritesItems=ObservableList();

 @observable
 List<Product>? _favoriteList;
 
  List<Product> get favoriteItems{
    return _itemsFavoritesList.where((element) => element.isFavorite!).toList();
  }

  bool isFavorite(String id){
    final index = _favoritesItems.indexWhere((element) => element.id.toString() == id.toString());
    return index>=0;

  }

  /// get favorites from SharedPref... *
  Future<void> _fetchFavoriteProductsFromPref() async{
    final favorites=await _favoritesRepository.fetchFavoritesFromRepository();
    _favoritesItems =ObservableList.of(_favoriteList!.where((it) => favorites.contains(it.toString()))
        .toList());

  }

   Product findById(String id){
    return _itemsFavoritesList.firstWhere((element) => element.id.toString() == id);
  }

  Product findByIdFavorite(bool favorite){
    return _itemsFavoritesList.firstWhere((element) => element.isFavorite==favorite);
  }

   static Product? findByProductIsFavorite(Product product){
     _itemsFavoritesList.firstWhere((element) => element.id.toString() ==product.id.toString());
    if(!_itemsFavoritesList.contains(product)){
      return _itemsFavoritesList.firstWhere((element) => element.id.toString() ==product.id.toString());

    }else{
     return null;
    }

   // return _itemsFavoritesList.firstWhere((element) => element.id.toString() ==product.id.toString());
   //  notifyListeners();

  }

  void addFavorite (Product product){

    _itemsFavoritesList.add(product);
 //   notifyListeners();
     // if( _itemsFavoritesList.isEmpty){
     //   _itemsFavoritesList.add(product);
     //   notifyListeners();
     // }else {
     //   for (var prod in _itemsFavoritesList) {
     //     if (_itemsFavoritesList.isNotEmpty &&
     //         _itemsFavoritesList.contains(product)) {
     //       _itemsFavoritesList.add(product);
     //       notifyListeners();
     //       break;
     //     }
     //   }
     // }
  }

  void updateFavorite (Product editedProduct){
    final productindex =_itemsFavoritesList.indexWhere((element) => element.id.toString()==editedProduct.id.toString());
    _itemsFavoritesList[productindex]=editedProduct;
    notifyListeners();
  }

  void removeFavorite (String id){
    final existingProductIndex =_itemsFavoritesList.indexWhere((element) => element.id.toString()==id.toString());

    Product? existingProduct=_itemsFavoritesList[existingProductIndex];
    _itemsFavoritesList.removeAt(existingProductIndex);
    notifyListeners();
  }

  void editFavorite (String id, Product editedProduct){
    final productindex =_itemsFavoritesList.indexWhere((element) => element.id.toString()==id.toString());
    _itemsFavoritesList[productindex]=editedProduct;
    notifyListeners();
  }

  void  cleanFavorite(){
    notifyListeners();
    return _itemsFavoritesList.clear();

}


}