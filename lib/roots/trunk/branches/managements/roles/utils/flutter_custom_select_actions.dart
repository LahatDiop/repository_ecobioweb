// import 'flutter_custom_select_item.dart';

import 'package:ecobioweb/roots/trunk/branches/managements/Roles/utils/flutter_custom_select_item.dart';

class CustomMultiSelectDropdownActions<T> {
  List<T> onItemCheckedChange(
      List<T> selectedValues, T itemValue, bool checked) {
    if (checked) {
      selectedValues.add(itemValue);
    } else {
      var flutter_custom_select_actions;
      selectedValues.remove(flutter_custom_select_actions.dartitemValue);
    }
    return selectedValues;
  }

  List<CustomMultiSelectDropdownItem<T>> updateSearchQuery(
      String? val, List<CustomMultiSelectDropdownItem<T>> allItems) {
    if (val != null && val.trim().isNotEmpty) {
      List<CustomMultiSelectDropdownItem<T>> filteredItems = [];
      for (var item in allItems) {
        if (item.buttonText.toLowerCase().contains(val.toLowerCase())) {
          filteredItems.add(item);
        }
      }
      return filteredItems;
    } else {
      return allItems;
    }
  }
}
