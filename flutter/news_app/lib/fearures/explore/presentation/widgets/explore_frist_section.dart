import 'package:flutter/material.dart';

class ExploreFristSection extends StatelessWidget {
  const ExploreFristSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.height * 0.5,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Image.asset('assets/images/explore.png', fit: BoxFit.cover),
            ),
            SizedBox(height: 8),
            Text(
              'Apple Unveils Revolutionary AI Features',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text('Mr. Lana Kub', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
