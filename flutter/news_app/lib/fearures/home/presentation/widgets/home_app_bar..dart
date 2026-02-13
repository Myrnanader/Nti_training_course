import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/theming/app_fonts.dart';
import 'package:news_app/core/theming/color_manager.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    String formattedDate = DateFormat("EEEE, d MMMM yyyy").format(date);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(color: ColorManager.appBarColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(formattedDate, style: AppFonts.font20w700),

            Text('☀️ Sunny 32oC'),
          ],
        ),
      ),
    );
  }
}
