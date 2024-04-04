


import 'package:ecobioweb/roots/trunk/branches/managements/Roles/models/Role.dart';
import 'package:flutter/foundation.dart';

class RolesProvider with ChangeNotifier , DiagnosticableTreeMixin {


  bool _disposed = false;


 void initState(){
   // _roles.addAll(rols);
  //
  //   fetchItems().whenComplete(() => print("roleScreen"));
  //
  // }
  //
  // Future<void>  fetchItems() async {
  //   final loadDatarole=getroleList();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  ///MAP ROLES
  final Map<String, Role> _rolesItem= {};

  Map<String,Role> get rolesItems{

    return {..._rolesItem};
  }

  /// LIST roles
  final List<Role> _roles=[];

    List<Role>? roles  =[];

  List<Role> get getRoles{
    return _roles;
  }

 static List<String> rolesListItems=[];

///role OBJECT
  Role? role;

  //TODO ROLE DB JSON


  ///LOAD ROLES
  List<Role>? initilizeLoadListRoles(){

    List<Role> rols=[
      Role(id: "1", name: "admin", description: "admin", isVisible: true, notes: " administration", image: "imagePath1"),
      Role(id: "2", name: "market", description: "market", isVisible: true, notes: "Market", image: "imagePath2"),
      Role(id: "3", name: "client", description: "client", isVisible: true, notes: "client", image: "imagePath3"),
      Role(id: "4", name: "dealer", description: "dealer", isVisible: true, notes: "dealer", image: "imagePath4"),
      Role(id: "5", name: "supplier", description: "supplier", isVisible: true, notes: "supplier", image: "imagePath5"),
      Role(id: "6", name: "marketGestion", description: "marketGestion", isVisible: true, notes: "marketGestion", image: "imagePath6"),
      Role(id: "7", name: "printExcel", description: "printExcel", isVisible: true, notes: "printExcel", image: "imagePath7"),
    ];

       _roles.addAll(rols);

    roles!.addAll(_roles);


    /// ROLES
    for(Role role in roles!){
      rolesListItems.add(role.name!);
     /// _rolesItem.putIfAbsent(role.id.toString(), role as Role Function());
    }

    return  roles!;
  }


  
}