import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ngo_selling_app/about_us.dart';
import 'package:ngo_selling_app/cart_page.dart';
import 'package:ngo_selling_app/contact_page.dart';
import 'package:ngo_selling_app/product_page.dart';
import 'dart:async';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'gallery_page.dart';
import 'donate_page.dart';
import 'dashboard_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
void _copyToClipboard(BuildContext context) {
  Clipboard.setData(const ClipboardData(text: '+91 99211 87127'));
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Phone Number copied to clipboard'),
    ),
  );
}
class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  Timer? _timer;
  ValueNotifier<int> _pageIndexNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _startImageScrolling();
  }

  void _startImageScrolling() {
    const Duration imageDuration = Duration(seconds: 3);
    const Duration transitionDuration = Duration(milliseconds: 500);

    _timer = Timer.periodic(imageDuration + transitionDuration, (Timer timer) {
      if (_pageIndexNotifier.value < images.length - 1) {
        _pageIndexNotifier.value++;
      } else {
        // When reaching the last image, jump to the first image
        _pageController.jumpToPage(0);
        _pageIndexNotifier.value = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _pageIndexNotifier.value,
          duration: transitionDuration,
          curve: Curves.ease,
        );
      }
    });
  }

  List<String> images = [
    'assets/images/home-1.jpg',
    'assets/images/home-2.jpg',
    'assets/images/home-3.jpg',
  ];

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    _pageIndexNotifier.dispose(); // Dispose of the ValueNotifier
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            color: Colors.black,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Container(
          child: Image.asset(
            'assets/images/logo-01.png',
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          // Cart icon
          IconButton(
            icon: Icon(Icons.star_border_purple500),
            color: Colors.black,
            onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductsPage()));},
          ),
          // Wishlist icon
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartPage()));
            },
          ),
          // Products icon
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 10.0),
            Expanded(
              child: ListView(
                children: [
                  Image.asset(
                    'assets/images/logo-01.png',
                    scale: 1.4,
                  ),
                  Divider(),
                  ListTile(
                    title: Text('ABOUT US'),
                    trailing: Icon(Icons.info_outline_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutUsPage()));
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text('DONATE'),
                    trailing: Icon(Icons.health_and_safety_rounded),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DonatePage()),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text('PRODUCTS'),
                    trailing: Icon(Icons.star_border_purple500),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductsPage()));
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text('CART'),
                    trailing: Icon(Icons.shopping_cart_outlined),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartPage()));
                      // Open the cart page
                    },
                  ),
                ],
              ),
            ),
            // This container holds the align for the last tile
            const Divider(),
            Container(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  children: [
                    ListTile(
                      title: Text('OUR GALLERY'),
                      trailing: Icon(Icons.favorite),
                      iconColor: Colors.red,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GalleryPage()));
                      },
                    ),
                    const Divider(),
                    ListTile(
                      title: Text('CONTACT US'),
                      trailing: Icon(Icons.call),
                      iconColor: Colors.blue,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactUsPage()));
                        // Open the about us page
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              height: 200,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Image.asset(images[index]);
                    },
                    onPageChanged: (index) {
                      _pageIndexNotifier.value =
                          index; // Update the ValueNotifier
                    },
                  ),
                  PageViewIndicator(
                    pageIndexNotifier: _pageIndexNotifier,
                    length: images.length,
                    normalBuilder: (animationController) => Circle(
                      size: 8.0,
                      color: Colors.grey,
                    ),
                    highlightedBuilder: (animationController) {
                      return Builder(
                        builder: (context) {
                          return ScaleTransition(
                            scale: CurvedAnimation(
                              parent: animationController,
                              curve: Curves.ease,
                            ),
                            child: Circle(
                              size: 8.0,
                              color: Colors
                                  .blue, // Change this to your desired color
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to ANIKET Sevabhavi Sanstha',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'A registered charity dedicated to the welfare and rehabilitation of differently-abled individuals.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    'At ANIKET, we provide shelter, love, care, and education to those who are mentally challenged for life. Our products are made with anticipation, excitement, and a lot of love by our children.',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'How Your Purchase Impacts Lives:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'With every purchase, you support our mission to make the lives of these children whole. Your contribution bridges the gap for our children and their optimal care.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'For any query, please WhatsApp us on :',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue, // Change the color to your liking
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _copyToClipboard(context);
                      },
                      child: Text(
                        '+91 99211 87127',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Change the color to your liking
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Button section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProductsPage()));
                },
                child: Text('Support Our Cause'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
