import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xFF004F8C),
        elevation: 0,
        title: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              border: InputBorder.none,
              icon: Icon(Icons.search),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF004F8C)),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                final args = ModalRoute.of(context)?.settings.arguments;
                Navigator.pushNamed(
                  context,
                  '/profile-setting',
                  arguments: args is String ? args : null,
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explore Jobs',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.85,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: _jobCategories.map((item) {
                return GestureDetector(
                  onTap: () {
                    if (item['name'] == 'Websites') {
                      Navigator.pushNamed(context, '/websites');
                    } else {
                      Navigator.pushNamed(
                        context,
                        '/category-details',
                        arguments: item['name'],
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF4AC5DE),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          item['icon']!,
                          width: 48,
                          height: 48,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item['name']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/Logo.png', width: 80, height: 80),
                Row(
                  children: [
                    IconButton(
                      icon: Image.asset('assets/images/instagram.png', width: 30),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset('assets/images/facebook.png', width: 30),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            final args = ModalRoute.of(context)?.settings.arguments;
            Navigator.pushNamed(
              context,
              '/profile-setting',
              arguments: args is String ? args : null,
            );
          }
        },
      ),
    );
  }

  final List<Map<String, String>> _jobCategories = const [
    {'name': 'Websites', 'icon': 'assets/images/website.png'},
    {'name': 'Applications', 'icon': 'assets/images/mobile.png'},
    {'name': 'AI Specialist', 'icon': 'assets/images/ai.png'},
    {'name': 'Game development', 'icon': 'assets/images/games.png'},
    {'name': 'Software development', 'icon': 'assets/images/software.png'},
    {'name': 'Support & Cybersecurity', 'icon': 'assets/images/cybersecurity.png'},
    {'name': 'API/Backend', 'icon': 'assets/images/api.png'},
    {'name': 'Embedded system', 'icon': 'assets/images/embeddedsystem.png'},
    {'name': 'IT', 'icon': 'assets/images/it.png'},
    {'name': 'E-commerce development', 'icon': 'assets/images/ecommerce.png'},
    {'name': 'Data Science', 'icon': 'assets/images/datascience.png'},
    {'name': 'System Testing', 'icon': 'assets/images/systemtesting.png'},
  ];
}
