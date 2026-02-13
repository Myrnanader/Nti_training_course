import 'package:cubit_ex/models/grocery_item.dart';

abstract class GroceryListState {}

class GroceryInitial extends GroceryListState {}

class GroceryLoading extends GroceryListState {}

class GroceryEmpty extends GroceryListState {}

class GroceryLoaded extends GroceryListState {
  final List<GroceryItem> items;
  GroceryLoaded(this.items);
}
