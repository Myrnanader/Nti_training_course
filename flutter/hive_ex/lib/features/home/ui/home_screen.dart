import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:hive_ex/core/theme/color_manager.dart';

import '../../../core/helpers/hive_helper.dart';
import '../../../core/models/note_model.dart';
import '../../../core/routing/routes.dart';
import '../widgets/note_card.dart';
import 'empty_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveHelper.notesBox.listenable(),
      builder: (context, Box<NoteModel> box, _) {
        final notes = box.values.toList();

        if (notes.isEmpty) {
          return const EmptyHome();
        }

        return Scaffold(
          appBar: AppBar(title: const Text("Notes")),
          body: GridView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: notes.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 16.w,
              childAspectRatio: 0.78,
            ),
            itemBuilder: (context, index) {
              return NoteCard(
                note: notes[index],
                index: index,
                onTap: () {
                  context.go(Routes.noteDetails, extra: notes[index]);
                },
              );
            },
          ),

          floatingActionButton: SizedBox(
            width: 72.w,
            height: 72.w,
            child: FloatingActionButton(
              onPressed: () => context.go(Routes.newNote),
              backgroundColor: ColorManager.primary,
              shape: const CircleBorder(),
              child: Icon(Icons.add, size: 34.sp, color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
