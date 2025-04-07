import 'package:flutter/material.dart';
import 'lost_items_screens.dart';
import 'found_item_screen.dart';
import 'post_item_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Dummy Data for Lost and Found Items (for now, using static data)
  List<Map<String, String>> lostItems = [
    {
      'title': 'Money Bag',
      'description': 'A brown leather money bag with a zipper.',
      'imageUrl': 'assets/images/Money_bag.jpg',
    },
    {
      'title': 'TWS',
      'description': 'A pair of wireless earphones, black color.',
      'imageUrl': 'assets/images/TWS.jpg',
    },
    {
      'title': 'Mobile',
      'description': 'An iPhone 13, space gray, with a cracked screen.',
      'imageUrl': 'assets/images/mobile.jpg',
    },
  ];

  List<Map<String, String>> foundItems = [
    {
      'title': 'Umbrella',
      'description': 'A red umbrella, slightly worn, found near the park.',
      'imageUrl': 'assets/images/umbrella.jpg',
    },
    {
      'title': 'Id Card',
      'description': 'A student ID card, Daffodil International University.',
      'imageUrl': 'assets/images/Id_card.jpg',
    },
    {
      'title': 'Calculator',
      'description':
          'A scientific calculator, brand Casio, found in the classroom.',
      'imageUrl': 'assets/images/calculator.jpg',
    },
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeContent(lostItems: lostItems, foundItems: foundItems),
      LostItemsScreen(items: lostItems),
      FoundItemsScreen(items: foundItems),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Lost & Found')),
        backgroundColor: Color(0xFF007BFF), // Professional blue
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF007BFF),
              ), // Primary blue
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.account_circle, size: 60, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    "Tamim Iqbal",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Tamim@gmail.com",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ProfileScreen()),
                  ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SettingsScreen()),
                  ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Lost Items',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Found Items',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF007BFF), // Primary blue
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            label: Text("Post Lost Item"),
            icon: Icon(Icons.add),
            backgroundColor: Colors.red,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => PostItemScreen(
                        category: "lost",
                        onNewItemPosted: (newItem) {
                          setState(() {
                            lostItems.insert(0, newItem);
                          });
                        },
                      ),
                ),
              );
            },
          ),
          SizedBox(height: 10),
          FloatingActionButton.extended(
            label: Text("Post Found Item"),
            icon: Icon(Icons.add),
            backgroundColor: Color(0xFF28A745), // Vibrant green
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => PostItemScreen(
                        category: "found",
                        onNewItemPosted: (newItem) {
                          setState(() {
                            foundItems.insert(0, newItem);
                          });
                        },
                      ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final List<Map<String, String>> lostItems;
  final List<Map<String, String>> foundItems;

  HomeContent({required this.lostItems, required this.foundItems});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Recent Posts Text
          Container(
            padding: EdgeInsets.all(8),
            color: Colors.blue[100],
            child: Text(
              "Recent Posts",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          // Lost Items Container Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildItemContainer(
                'Money Bag',
                'A brown leather money bag with a zipper.',
                'assets/images/Money_bag.jpg',
              ),
              _buildItemContainer(
                'TWS',
                'A pair of wireless earphones, black color.',
                'assets/images/TWS.jpg',
              ),
              _buildItemContainer(
                'Mobile',
                'An iPhone 13, space gray, with a cracked screen.',
                'assets/images/mobile.jpg',
              ),
            ],
          ),
          SizedBox(height: 20),
          // Found Items Container Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildItemContainer(
                'Umbrella',
                'A red umbrella, slightly worn, found near the park.',
                'assets/images/umbrella.jpg',
              ),
              _buildItemContainer(
                'Id Card',
                'A student ID card, Daffodil International University.',
                'assets/images/Id_card.jpg',
              ),
              _buildItemContainer(
                'Calculator',
                'A scientific calculator, brand Casio, found in the classroom.',
                'assets/images/calculator.jpg',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItemContainer(
    String title,
    String description,
    String imageUrl,
  ) {
    return Container(
      width: 100, // Adjust size as necessary
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(imageUrl, height: 80, width: 80, fit: BoxFit.cover),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
