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
  List<Map<String, String>> lostItems = [];
  List<Map<String, String>> foundItems = [];
  List<Map<String, String>> claimedItems = [];

  void _addLostItem(Map<String, String> newItem) {
    setState(() {
      lostItems.insert(0, newItem);
    });
  }

  void _addFoundItem(Map<String, String> newItem) {
    setState(() {
      foundItems.insert(0, newItem);
    });
  }

  void _addClaimedItem(Map<String, String> item) {
    setState(() {
      claimedItems.add(item);
    });
  }

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
      FoundItemsScreen(items: foundItems, onClaim: _addClaimedItem),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Lost & Found')),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.account_circle, size: 60, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    "User Name",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "user@example.com",
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
            ListTile(
              leading: Icon(Icons.assignment_turned_in),
              title: Text('Claimed Items'),
              onTap: () => showClaimedItems(context),
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
        selectedItemColor: Colors.blue,
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
                        onNewItemPosted: _addLostItem,
                      ),
                ),
              );
            },
          ),
          SizedBox(height: 10),
          FloatingActionButton.extended(
            label: Text("Post Found Item"),
            icon: Icon(Icons.add),
            backgroundColor: Colors.green,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => PostItemScreen(
                        category: "found",
                        onNewItemPosted: _addFoundItem,
                      ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void showClaimedItems(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Claimed Items"),
            content:
                claimedItems.isEmpty
                    ? Text("No items claimed yet.")
                    : Column(
                      mainAxisSize: MainAxisSize.min,
                      children:
                          claimedItems.map((item) {
                            return ListTile(
                              leading: Image.network(
                                item['imageUrl']!,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              title: Text(item['title']!),
                              subtitle: Text(item['description']!),
                            );
                          }).toList(),
                    ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Close"),
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
    List<Map<String, String>> recentPosts = [...lostItems, ...foundItems];

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[50],
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Recent Posts",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Check the latest lost and found items.",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: recentPosts.length,
              itemBuilder: (context, index) {
                bool isLost = lostItems.contains(recentPosts[index]);
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                        child: Image.network(
                          recentPosts[index]['imageUrl']!,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recentPosts[index]['title']!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(recentPosts[index]['description']!),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    isLost
                                        ? Colors.redAccent
                                        : Colors.greenAccent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                isLost ? "Lost" : "Found",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
