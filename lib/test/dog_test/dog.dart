

//import 'db_sqllite_services.dart';

class Dog {
  final int? id;
  final String? name;
  final int? age;

  const Dog({
    required this.id,
    required this.name,
    required this.age,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  // toMap	permette di trasformare l’oggetto corrente in una Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  //override del metodo toString per ottenere facilmente una descrizione dell’oggetto
  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }

  //fromMapToObject	permette di trasformare una Map composta dalle caratteristiche
  // della classe in un oggetto di quella classe
  Map<String, dynamic> fromMap(Map<String, dynamic> map) {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }



}