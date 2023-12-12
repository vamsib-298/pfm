import 'package:flutter/material.dart';
import 'package:pfm/screens/sigin.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({Key? key}) : super(key: key);

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<String> pageImages = [
    'assets/images/hen 1.png',
    'assets/images/hen2.png',
    'assets/images/hen 3.png',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView to display pages with different images
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: pageImages.map((imagePath) {
              return Image.asset(
                imagePath,
                fit: BoxFit.contain, // Adjust the fit based on your needs
              );
            }).toList(),
          ),
          // Skip button at the left bottom corner
          Positioned(
            left: 16.0,
            bottom: 16.0,
            child: Visibility(
              visible: _currentPage < pageImages.length - 1,
              child: ElevatedButton(
                onPressed: () {
                  // Jump to the last page
                  _pageController.jumpToPage(pageImages.length - 1);
                },
                child: const Text('Skip'),
              ),
            ),
          ),
          // Next/Sign In button at the right bottom corner
          Positioned(
            right: 16.0,
            bottom: 16.0,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the sign-in page
                if (_currentPage < pageImages.length - 1) {
                  // If not on the last page, go to the next page
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                } else {
                  // If on the last page, navigate to the sign-in page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInPage()),
                  );
                }
              },
              child: Text(
                  _currentPage < pageImages.length - 1 ? 'Next' : 'Sign In'),
            ),
          ),
          // Page indicator dots
          Positioned(
            bottom: 40.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pageImages.length,
                (index) => _buildDot(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: 12.0,
      height: 12.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}
