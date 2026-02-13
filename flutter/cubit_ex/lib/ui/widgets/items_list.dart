import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/grocery_list_cubit.dart';
import '../../models/grocery_item.dart';
import 'grocery_tile.dart';

class ItemsList extends StatelessWidget {
  final List<GroceryItem> items;

  const ItemsList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, index) {
          final item = items[index];

          return Dismissible(
            key: ValueKey('${item.name}-$index'),
            direction: DismissDirection.horizontal,

            background: _buildSwipeBackground(alignment: Alignment.centerLeft),

            secondaryBackground: _buildSwipeBackground(
              alignment: Alignment.centerRight,
            ),

            onDismissed: (_) {
              context.read<GroceryListCubit>().deleteItem(index);
            },

            child: GroceryTile(
              title: item.name,
              emoji: item.emoji,
              onDelete: () {
                context.read<GroceryListCubit>().deleteItem(index);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildSwipeBackground({required Alignment alignment}) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: alignment,
      child: const Icon(Icons.delete, color: Colors.white),
    );
  }
}
