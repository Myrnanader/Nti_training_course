import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/add_item_bottom_sheet.dart';
import 'widgets/home_header.dart';
import 'widgets/items_counter.dart';
import 'widgets/items_list.dart';
import 'widgets/loading_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/cubit/grocery_list_cubit.dart';
import '../logic/cubit/grocery_list_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2FAF6),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        shape: const CircleBorder(),
        onPressed: () => AddItemBottomSheet.show(context),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            const HomeHeader(),
            SizedBox(height: 6.h),
            const ItemsCounter(),
            SizedBox(height: 12.h),
            const _HomeBody(),
          ],
        ),
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroceryListCubit, GroceryListState>(
      builder: (context, state) {
        if (state is GroceryLoading) {
          return const LoadingList();
        }

        if (state is GroceryEmpty) {
          return Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Text(
              'No items yet ',
              style: TextStyle(fontSize: 16.sp),
            ),
          );
        }
        if (state is GroceryLoaded) {
          return ItemsList(items: state.items);
        }
        return const SizedBox();
      },
    );
  }
}
