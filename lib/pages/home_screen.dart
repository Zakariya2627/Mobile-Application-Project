import 'package:flutter/material.dart';
import 'package:semester_project_flutter/pages/complete_order_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _showSearchResults = false;

  // Sample data for categories
  final List<String> categories = [
    'Fashion',
    'Electronics',
    'Appliances',
    'Beauty',
    'Fun',
  ];

  // Sample data for brands
  final List<String> brands = [
    'Bonanza',
    'adidas',
    'Maria.b',
    'Levels',
    'Zara',
  ];

  // Sample data for all products (for search)
  final List<Map<String, dynamic>> allProducts = [
    {
      'name': 'Adidas white sneakers for men',
      'price': '\$68',
      'originalPrice': '\$138',
      'discount': '50% OFF',
      'rating': 4.8,
      'reviews': 692,
      'isFavorite': false,
      'image':
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/skwgyqrbfzhu6uyeh0gg/air-max-270-mens-shoes-KkLcGR.png',
    },
    {
      'name': 'Nike black running shoes for men',
      'price': '\$75',
      'originalPrice': '\$30',
      'discount': '20% OFF',
      'rating': 4.2,
      'reviews': 412,
      'isFavorite': false,
      'image':
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/skwgyqrbfzhu6uyeh0gg/air-max-270-mens-shoes-KkLcGR.png',
    },
    {
      'name': 'Alien Solly Regular fit cotton shirt',
      'price': '\$35',
      'rating': 4.4,
      'reviews': 412,
      'isFavorite': false,
      'image':
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/skwgyqrbfzhu6uyeh0gg/air-max-270-mens-shoes-KkLcGR.png',
    },
    {
      'name': 'Calvin Klein Regular fit slim fit shirt',
      'price': '\$52',
      'rating': 4.2,
      'reviews': 214,
      'isFavorite': false,
      'image':
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/skwgyqrbfzhu6uyeh0gg/air-max-270-mens-shoes-KkLcGR.png',
    },
  ];

  // Filter products based on search query
  List<Map<String, dynamic>> get filteredProducts {
    if (_searchQuery.isEmpty) return allProducts;
    return allProducts
        .where(
          (product) => product['name'].toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ),
        )
        .toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            _showSearchResults
                ? TextField(
                  controller: _searchController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Search products...',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          _searchQuery = '';
                          _searchController.clear();
                          _showSearchResults = false;
                        });
                      },
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                )
                : const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                _showSearchResults = true;
              });
            },
          ),
        ],
      ),
      body: _showSearchResults ? _buildSearchResults() : _buildHomeContent(),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      //   type: BottomNavigationBarType.fixed,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_cart),
      //       label: 'Cart',
      //     ),
      //     BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Orders'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      //   ],
      // ),
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categories Section
            const Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Text(categories[index])),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Brands Section
            const Text(
              'By Brand',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: brands.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 60,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                    ),
                    child: Center(child: Text(brands[index])),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Hot Selling Section
            const Text(
              'Hot Selling Footwear',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: allProducts.length,
                itemBuilder: (context, index) {
                  final product = allProducts[index];
                  return Container(
                    width: 180,
                    margin: const EdgeInsets.only(right: 15),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(product['image']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: IconButton(
                                    icon: Icon(
                                      product['isFavorite']
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color:
                                          product['isFavorite']
                                              ? Colors.red
                                              : Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        allProducts[index]['isFavorite'] =
                                            !allProducts[index]['isFavorite'];
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product['name'],
                              style: const TextStyle(fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  product['price'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                if (product['originalPrice'] != null) ...[
                                  const SizedBox(width: 5),
                                  Text(
                                    product['originalPrice'],
                                    style: TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                                if (product['discount'] != null) ...[
                                  const SizedBox(width: 5),
                                  Text(
                                    product['discount'],
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 14),
                                Text(
                                  ' ${product['rating']} (${product['reviews']})',
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Recommended Section
            const Text(
              'Recommended for you',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: allProducts.length,
              itemBuilder: (context, index) {
                final product = allProducts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => CompleteOrderScreen(),
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 110,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(product['image']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 5,
                                child: IconButton(
                                  icon: Icon(
                                    product['isFavorite']
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color:
                                        product['isFavorite']
                                            ? Colors.red
                                            : Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      allProducts[index]['isFavorite'] =
                                          !allProducts[index]['isFavorite'];
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product['name'],
                            style: const TextStyle(fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product['price'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 14),
                              Text(
                                ' ${product['rating']} (${product['reviews']})',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    return filteredProducts.isEmpty
        ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search_off, size: 50, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                'No products found',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
        )
        : ListView.builder(
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return ListTile(
              leading: Image.network(
                product['image'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product['name']),
              subtitle: Text(product['price']),
              trailing: IconButton(
                icon: Icon(
                  product['isFavorite']
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: product['isFavorite'] ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    product['isFavorite'] = !product['isFavorite'];
                  });
                },
              ),
              onTap: () {
                // Handle product tap
              },
            );
          },
        );
  }
}
