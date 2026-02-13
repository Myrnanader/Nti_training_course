import 'package:hive_ce/hive.dart';

class HiveHelper<T> {
  final String boxName;

  HiveHelper(this.boxName);

  Future<Box<T>> _openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<T>(boxName);
    }
    return Hive.box<T>(boxName);
  }

  Future<void> addItem(T item) async {
    final box = await _openBox();
    await box.add(item);
  }

  Future<void> deleteItem(int index) async {
    final box = await _openBox();
    await box.deleteAt(index);
  }

  Future<T?> getItem(int index) async {
    final box = await _openBox();
    return box.getAt(index);
  }

  Future<List<T>> getAllItems() async {
    final box = await _openBox();
    return box.values.toList();
  }

  Future<void> clearAll() async {
    final box = await _openBox();
    await box.clear();
  }
}
