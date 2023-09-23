import 'package:flutter/material.dart';

class ShoppingHomePage extends StatefulWidget {
  @override
  State<ShoppingHomePage> createState() => _ShoppingHomePageState();
}

class _ShoppingHomePageState extends State<ShoppingHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    ShoppingHomePage(),
    SearchScreen(),
    SearchScreen(),
    SearchScreen(),
    SearchScreen(),
  ];
  int notificationCount = 5;

  final List<Map<String, String>> products = [
    {
      "product_name": "Product A",
      "image_url": "assets/2.png",
    },
    {
      "product_name": "Product B",
      "image_url": "assets/3.png",
    },
    {
      "product_name": "Product C",
      "image_url": "assets/4.png",
    },
    {
      "product_name": "Product D",
      "image_url": "assets/5.png",
    },
    {
      "product_name": "Product E",
      "image_url": "assets/6.png",
    },
  ];

  final store = {
    "products": [
      {
        "image": "assets/5.png",
        "originalPrice": 49.99,
        "price": 39.99,
        "discount_percent": 20,
        "itemName": "Product 1",
        "ratings": 4.5
      },
      {
        "image": "assets/6.png",
        "originalPrice": 29.99,
        "price": 24.99,
        "discount_percent": 17,
        "itemName": "Product 2",
        "ratings": 4.2
      },
      {
        "image": "assets/7.png",
        "originalPrice": 79.99,
        "price": 64.99,
        "discount_percent": 19,
        "itemName": "Product 3",
        "ratings": 4.8
      },
      {
        "image": "assets/7.png",
        "originalPrice": 79.99,
        "price": 64.99,
        "discount_percent": 19,
        "itemName": "Product 4",
        "ratings": 4.8
      },
      {
        "image": "assets/7.png",
        "originalPrice": 79.99,
        "price": 64.99,
        "discount_percent": 19,
        "itemName": "Product 5",
        "ratings": 4.8
      },
      {
        "image": "assets/6.png",
        "originalPrice": 29.99,
        "price": 24.99,
        "discount_percent": 17,
        "itemName": "Product 2",
        "ratings": 4.2
      },
      {
        "image": "assets/7.png",
        "originalPrice": 79.99,
        "price": 64.99,
        "discount_percent": 19,
        "itemName": "Product 3",
        "ratings": 4.8
      },
      {
        "image": "assets/7.png",
        "originalPrice": 79.99,
        "price": 64.99,
        "discount_percent": 19,
        "itemName": "Product 4",
        "ratings": 4.8
      },
      {
        "image": "assets/7.png",
        "originalPrice": 79.99,
        "price": 64.99,
        "discount_percent": 19,
        "itemName": "Product 5",
        "ratings": 4.8
      },
      {
        "image": "assets/6.png",
        "originalPrice": 29.99,
        "price": 24.99,
        "discount_percent": 17,
        "itemName": "Product 2",
        "ratings": 4.2
      },
      {
        "image": "assets/7.png",
        "originalPrice": 79.99,
        "price": 64.99,
        "discount_percent": 19,
        "itemName": "Product 3",
        "ratings": 4.8
      },
      {
        "image": "assets/7.png",
        "originalPrice": 79.99,
        "price": 64.99,
        "discount_percent": 19,
        "itemName": "Product 4",
        "ratings": 4.8
      },
      {
        "image": "assets/7.png",
        "originalPrice": 79.99,
        "price": 64.99,
        "discount_percent": 19,
        "itemName": "Product 5",
        "ratings": 4.8
      }
    ]
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Center(
            child: Text(
              'purva',
              style: TextStyle(
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                  fontFamily: 'font1'),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                size: 32.0,
                color: Colors.orange,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/1.png',
                  width: double.infinity,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 90.0,
                          height: 90.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage(products[index]["image_url"]!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(products[index]["product_name"]!),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Top Picks',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: store["products"]!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image.asset(
                                store["products"]?[index]["image"] as String,
                                fit: BoxFit.cover,
                                height: 100,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                store["products"]?[index]["itemName"] as String,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '\₹${store["products"]?[index]["originalPrice"]}',
                                        style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        '\₹${store["products"]?[index]["price"]}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${store["products"]?[index]["discount_percent"]}% Off',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                color: Colors.green,
                                padding: EdgeInsets.all(2),
                                child: Text(
                                  '${store["products"]?[index]["ratings"]}★',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          child: Stack(
            children: [
              ClipOval(
                child: Material(
                  color: Colors.orange,
                  child: InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: 64,
                      height: 64,
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '$notificationCount',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 6,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () => _onTabTapped(0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.home,
                      color: _selectedIndex == 0 ? Colors.orange : Colors.grey,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        color:
                            _selectedIndex == 0 ? Colors.orange : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => _onTabTapped(1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: _selectedIndex == 1 ? Colors.orange : Colors.grey,
                    ),
                    Text(
                      'Wishlist',
                      style: TextStyle(
                        color:
                            _selectedIndex == 1 ? Colors.orange : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => _onTabTapped(2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '',
                      style: TextStyle(
                        color:
                            _selectedIndex == 2 ? Colors.orange : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => _onTabTapped(3),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.note_alt_outlined,
                      color: _selectedIndex == 3 ? Colors.orange : Colors.grey,
                    ),
                    Text(
                      'Orders',
                      style: TextStyle(
                        color:
                            _selectedIndex == 3 ? Colors.orange : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => _onTabTapped(4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.person,
                      color: _selectedIndex == 4 ? Colors.orange : Colors.grey,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color:
                            _selectedIndex == 4 ? Colors.orange : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search Screen'),
    );
  }
}
