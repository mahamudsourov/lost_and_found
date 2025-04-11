import 'package:flutter/material.dart';
import 'lost_items_screens.dart';
import 'found_item_screen.dart';
import 'post_item_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  final Function(bool)? toggleTheme;

  const HomeScreen({super.key, this.toggleTheme});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> lostItems = [
    {
      'title': 'Money Bag',
      'description':
          'A brown leather money bag with a zipper. \nLost Item Post \nPosted By: Tamim Iqbal\nContact Info: 016562356',
      'imageUrl': 'assets/images/Money_bag.jpg',
      'poster': 'Tamim Iqbal',
      'timeAgo': '5 hours ago',
    },
    {
      'title': 'TWS',
      'description':
          'A pair of wireless earphones, black color. \nLost Item Post \nPosted By: Sourov \nContact Info: 016567152',
      'imageUrl': 'assets/images/TWS.jpg',
      'poster': 'Sourov',
      'timeAgo': '2 days ago',
    },
    {
      'title': 'Mobile',
      'description':
          'An iPhone 13, space gray, with a cracked screen. \nLost Item Post \nPosted By: Taifur \nContact Info: 0197267221',
      'imageUrl': 'assets/images/mobile.jpg',
      'poster': 'Taifur',
      'timeAgo': '1 week ago',
    },
  ];

  List<Map<String, String>> foundItems = [
    {
      'title': 'Umbrella',
      'description':
          'A red umbrella, slightly worn, found near the park. \nFound Item Post \nPosted By: Shuvo \nContact Info: 015862723',
      'imageUrl': 'assets/images/umbrella.jpg',
      'poster': 'Shuvo',
      'timeAgo': '2 days ago',
    },
    {
      'title': 'Id Card',
      'description':
          'A student ID card, Daffodil International University.\nFound Item Post \nPosted By: Nahid \nContact Info: 018623567',
      'imageUrl': 'assets/images/Id_card.jpg',
      'poster': 'Nahid',
      'timeAgo': '4 months ago',
    },
    {
      'title': 'Calculator',
      'description':
          'A scientific calculator, brand Casio, found in the classroom.\nFound Item Post \nPosted By: Turzo \nContact Info: 0175234567',
      'imageUrl': 'assets/images/calculator.jpg',
      'poster': 'Turzo',
      'timeAgo': '1 day ago',
    },
  ];

  int _selectedIndex = 0;
  TextEditingController _searchController = TextEditingController();

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
        title: const Center(child: Text('Lost & Found')),
        backgroundColor: Theme.of(context).colorScheme.primary,
        // Removed the search icon here
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 60,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Tamim Iqbal",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const Text(
                    "Tamim@gmail.com",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ProfileScreen()),
                  ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) =>
                              SettingsScreen(toggleTheme: widget.toggleTheme),
                    ),
                  ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
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
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            label: const Text("Post Lost Item"),
            icon: const Icon(Icons.add),
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
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            label: const Text("Post Found Item"),
            icon: const Icon(Icons.add),
            backgroundColor: const Color(0xFF28A745),
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

  const HomeContent({
    super.key,
    required this.lostItems,
    required this.foundItems,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Search bar is located here.
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search by caption...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          // Recent Posts Text
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.blue[100],
            child: const Text(
              "Recent Posts",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          // Lost Items Container Row
          Expanded(
            child: ListView.builder(
              itemCount: lostItems.length,
              itemBuilder: (context, index) {
                return _buildItemPost(
                  lostItems[index]['poster']!,
                  lostItems[index]['description']!,
                  lostItems[index]['imageUrl']!,
                  lostItems[index]['timeAgo']!,
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          // Heading for Found Items Section
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.blue[100],
            child: const Text(
              "Lost & Found Items",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          // Found Items Container Row
          Expanded(
            child: ListView.builder(
              itemCount: foundItems.length,
              itemBuilder: (context, index) {
                return _buildItemPost(
                  foundItems[index]['poster']!,
                  foundItems[index]['description']!,
                  foundItems[index]['imageUrl']!,
                  foundItems[index]['timeAgo']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Build each post container with image, description, like/comment/share buttons
  Widget _buildItemPost(
    String poster,
    String description,
    String imageUrl,
    String timeAgo,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Poster's Name and Time
          Row(
            children: [
              const CircleAvatar(radius: 20, backgroundColor: Colors.blue),
              const SizedBox(width: 10),
              Text(
                poster,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Text(
                timeAgo,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Item Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),

          // Item Description
          Text(description, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 10),

          // Like, Comment, Share buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.favorite_border, size: 16, color: Colors.red),
                  SizedBox(width: 5),
                  Text('0', style: TextStyle(fontSize: 14)),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.comment_outlined, size: 16, color: Colors.grey),
                  SizedBox(width: 5),
                  Text('0', style: TextStyle(fontSize: 14)),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.share_outlined, size: 16, color: Colors.blue),
                  SizedBox(width: 5),
                  Text('0', style: TextStyle(fontSize: 14)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
