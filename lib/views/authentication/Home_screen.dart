import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _imageController;
  late AnimationController _textController;
  late Animation<double> _imageAnimation;
  late Animation<double> _textFade;

  @override
  void initState() {
    super.initState();

    // Animation for image
    _imageController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _imageAnimation = CurvedAnimation(
      parent: _imageController,
      curve: Curves.easeOut,
    );

    // Animation for text & buttons
    _textController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    _textFade = CurvedAnimation(
      parent: _textController,
      curve: Curves.easeIn,
    );

    _imageController.forward();
    _textController.forward();
  }

  @override
  void dispose() {
    _imageController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Animated Illustration
            ScaleTransition(
              scale: _imageAnimation,
              child: Image.asset(
                'assets/images/illution.png',
                height: 340,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 20),

            // Animated Heading & Subtext
            FadeTransition(
              opacity: _textFade,
              child: Column(
                children: const [
                  Text(
                    'Shop Smarter, Live Better',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF06923E),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Discover quality products at your fingertips, delivered to your door.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Buttons with animation
            FadeTransition(
              opacity: _textFade,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/login'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF06923E),
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/register'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF06923E),
                        side: const BorderSide(color: Color(0xFF06923E)),
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
