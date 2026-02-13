import 'package:flash_notes/features/home/presentation/screens/chats_screen.dart';
import 'package:flash_notes/features/home/presentation/screens/conversation_screen.dart';
import 'package:flash_notes/features/home/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_notes/core/models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  UserModel? selectedUser;

  void openConversation(UserModel user) {
    setState(() {
      selectedUser = user;
      currentIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bodies = [
      ChatsScreen(onUserTap: openConversation),
      ConversationScreen(user: selectedUser),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: bodies[currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFF0F0F0), width: 1)),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (i) => setState(() => currentIndex = i),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/chats.png')),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/message.png')),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/profile_pic.png')),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
