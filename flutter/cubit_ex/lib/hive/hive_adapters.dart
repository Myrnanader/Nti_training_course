import 'package:hive_ce/hive_ce.dart';
import '../models/grocery_item.dart';

@GenerateAdapters([
  AdapterSpec<GroceryItem>(),
])
part 'hive_adapters.g.dart';
