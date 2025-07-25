
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  void _onIntroEnd(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/homepage');
  }

  PageViewModel buildPage({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return PageViewModel(
      useScrollView: false,
      titleWidget: const SizedBox.shrink(),
      bodyWidget: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF06923E), Color.fromARGB(255, 6, 164, 69)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, size: 48, color: Colors.white),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: const Color(0xFF06923E),
      pages: [
        buildPage(
          icon: Icons.person_outline,
          title: "CREATE PROFILE",
          description:
              "Build your profile to access personalized services and track your activity.",
        ),
        buildPage(
          icon: Icons.book_online_outlined,
          title: "BOOK SERVICES",
          description:
              "Easily book and manage services right from your dashboard anytime.",
        ),
        buildPage(
          icon: Icons.check_circle_outline,
          title: "CONFIRM AND TRACK",
          description:
              "Confirm bookings and track progress with real-time notifications.",
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showSkipButton: true,
      skip: const Text('SKIP', style: TextStyle(color: Colors.white)),
      next: const Text('NEXT', style: TextStyle(color: Colors.white)),
      done: const Text('DONE', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      dotsDecorator: DotsDecorator(
        activeColor: Colors.white,
        color: Colors.white24,
        size: const Size(10.0, 10.0),
        activeSize: const Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }
}
