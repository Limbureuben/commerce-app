import 'package:ecommerce_app/views/authentication/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController _controller = PageController(viewportFraction: 0.8);
  final List<String> images = [
    'assets/images/bed2.jpeg',
    'assets/images/bed5.jpeg',
    'assets/images/bed6.jpeg',
  ];


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startAutoScroll());
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_controller.hasClients) {
        int nextPage = _controller.page!.round() + 1;
        if (nextPage >= images.length) {
          _controller.jumpToPage(0); // no animation for seamless loop
        } else {
          _controller.animateToPage(
            nextPage,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
        _startAutoScroll(); // recursive loop
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9), // light green
      appBar: AppBar(
        backgroundColor: const Color(0xFF06923E),
        title: const Text('E-COMMERCE'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Carousel
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _controller,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  final image = images[index];
                  return AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      double scale = 1.0;
                      if (_controller.position.haveDimensions) {
                        scale = (_controller.page! - index).abs();
                        scale = (1 - (scale * 0.3)).clamp(0.8, 1.0);
                      }
                      return Transform.scale(
                        scale: scale,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Image.asset(
                              image,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => const Center(
                                child: Icon(Icons.broken_image, size: 60, color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                onPageChanged: (index) {
                  setState(() {
                  });
                },
              ),
            ),

            const SizedBox(height: 12),

            SmoothPageIndicator(
              controller: _controller,
              count: images.length,
              effect: WormEffect(
                activeDotColor: const Color(0xFF06923E),
                dotColor: Colors.grey.shade300,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),

            const SizedBox(height: 30),
            const SizedBox(height: 12),

            const Text(
              'Empowering your business with seamless e-commerce solutions.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF06923E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                  shadowColor: Colors.greenAccent,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context) => HomeScreen()),
                    );
                },
                child: const Text(
                  'START SHOPPING',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
