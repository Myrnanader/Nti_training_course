
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce/hive.dart';

import '../../models/grocery_item.dart';
import 'grocery_list_state.dart';

class GroceryListCubit extends Cubit<GroceryListState> {
  GroceryListCubit() : super(GroceryInitial());

  final Box<GroceryItem> box = Hive.box<GroceryItem>('grocery_box');

  void loadItems() {
    emit(GroceryLoading());

    final items = box.values.toList();

    if (items.isEmpty) {
      emit(GroceryEmpty());
    } else {
      emit(GroceryLoaded(items));
    }
  }

  void addItem(String name, String emoji) {
  if (name.isEmpty || emoji.isEmpty) return;

  box.add(
    GroceryItem(
      name: name,
      emoji: emoji,
    ),
  );

  loadItems();
}


  void deleteItem(int index) {
    box.deleteAt(index);
    loadItems();
  }
}
