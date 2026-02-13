import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../logic/cubit/grocery_list_cubit.dart';
import '../../logic/cubit/grocery_list_state.dart';

class ItemsCounter extends StatelessWidget {
  const ItemsCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroceryListCubit, GroceryListState>(
      buildWhen: (prev, curr) =>
          curr is GroceryLoaded || curr is GroceryEmpty,
      builder: (context, state) {
        final count =
            state is GroceryLoaded ? state.items.length : 0;

        return Text(
          '$count items in your list',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey,
          ),
        );
      },
    );
  }
}
