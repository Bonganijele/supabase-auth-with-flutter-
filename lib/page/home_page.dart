import 'package:cooklink/auth/auth_service.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authService = AuthService();
  int _selectedIndex = 0;

  void logout() async {
    await authService.signOut();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // get user email
    final currentEmail = authService.getCurrentUserEmail();

    // List of widgets for each screen
    final List<Widget> _pages = [
      Center(child: Text("Home - $currentEmail")),
      const Center(child: Text("Page 2")),
      const Center(child: Text("Page 3")),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent, // Set AppBar color to blue accent
        title: const Text("CookLink", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications, color: Colors.black),
          ),

          const SizedBox(width: 8),

          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => SettingsPage()),
              // );
              // Add horizontal lines (|||) icon action
            },
            icon: const Icon(Icons.menu, color: Colors.black),
          ),
          // CircleAvatar(
          //   backgroundImage: NetworkImage("your-image-url"), // or use AssetImage
          // ),
        ],
      ),
      body: _pages[_selectedIndex], // Display selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor:
            Colors.blueAccent, // Set selected item color to blue accent
        unselectedItemColor: Colors.black, // Set unselected item color to black
        backgroundColor:
            Colors.white, // Set BottomNavigationBar background color to white
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Videos'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Status'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Friends'),
        ],
      ),
    );
  }
}
