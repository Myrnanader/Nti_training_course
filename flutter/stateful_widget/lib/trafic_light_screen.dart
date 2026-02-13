import 'package:flutter/material.dart';

class TrafficLightWidget extends StatefulWidget {
  const TrafficLightWidget({super.key});

  @override
  State<TrafficLightWidget> createState() => _TrafficLightWidgetState();
}

class _TrafficLightWidgetState extends State<TrafficLightWidget> {
  int currentIndex = 0;
  final List<String> colors = ['RED', 'YELLOW', 'GREEN'];

  void changeLight() {
    setState(() {
      currentIndex = (currentIndex + 1) % colors.length;
    });
  }

  Color getColor(String color) {
    switch (color) {
      case 'RED':
        return Colors.red;
      case 'YELLOW':
        return Colors.yellow;
      case 'GREEN':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentColor = colors[currentIndex];

    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        title: const Text(
          'Traffic Light',
          style: TextStyle(color: Color(0xffFFFFFF)),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            Text(
              currentColor,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: getColor(currentColor),
              ),
            ),
            const SizedBox(height: 38),
            Container(
              width: 112,
              height: 210,
              decoration: BoxDecoration(
                color: Color(0xff222222),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: colors.map((color) {
                  return Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentColor == color
                          ? getColor(color)
                          : Colors.grey.shade800,
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 250),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: getColor(currentColor), width: 2),
                ),
                backgroundColor: Color(0xff2B9DEE33),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                elevation: 4,
                minimumSize: Size(350, 56)
              ),
              onPressed: changeLight,
              child: Text(
                'CHANGE LIGHT',
                style: TextStyle(
                  color: getColor(currentColor),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),

      
    );
  }
}
