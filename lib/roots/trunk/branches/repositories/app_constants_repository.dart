


class AppConstantsRepository{

  static String get productData =>
      "https://pokedex.alansantos.dev/api/pokemons.json";

  static String productDetails(String id) =>
      "https://pokedex.alansantos.dev/api/pokemons/$id.json";

  static String get productItems =>
      "https://pokedex.alansantos.dev/api/items.json";



}