// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // Red Header with Profile Info
//           Stack(
//             children: [
//               Container(
//                 height: 250,
//                 decoration: const BoxDecoration(
//                   color: Color(0xFF06923E),
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(40),
//                     bottomRight: Radius.circular(40),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 40,
//                 left: 20,
//                 child: Icon(Icons.menu, color: Colors.white),
//               ),
//               Positioned(
//                 top: 40,
//                 right: 20,
//                 child: Row(
//                   children: [
//                     Stack(
//                       alignment: Alignment.topRight,
//                       children: [
//                         Icon(Icons.notifications_none, color: Colors.white, size: 28),
//                         Container(
//                           width: 16,
//                           height: 16,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: const Center(
//                             child: Text("5", style: TextStyle(fontSize: 10, color: Colors.red)),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(width: 16),
//                     Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 28),
//                   ],
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.center,
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 100),
//                     Stack(
//                       children: [
//                         const CircleAvatar(
//                           radius: 50,
//                           backgroundImage: AssetImage('assets/images/bed5.jpeg'), // Use your actual image
//                         ),
//                         Positioned(
//                           bottom: 0,
//                           right: 0,
//                           child: Container(
//                             decoration: const BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                             ),
//                             padding: const EdgeInsets.all(4),
//                             child: const Icon(Icons.edit, size: 16, color: Colors.blue),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       "Reuben Limbu",
//                       style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 20),

//           // List Items
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               children: const [
//                 ProfileListItem(title: "Personal Info"),
//                 ProfileListItem(title: "Bank Account Info"),
//                 ProfileListItem(title: "Return Address Info"),
//                 ProfileListItem(title: "Change Password"),
//                 ProfileListItem(title: "Change Email Address"),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProfileListItem extends StatelessWidget {
//   final String title;
//   const ProfileListItem({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       contentPadding: const EdgeInsets.symmetric(vertical: 4),
//       title: Text(title, style: const TextStyle(fontSize: 16)),
//       trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//       onTap: () {
//         // Add navigation here if needed
//       },
//     );
//   }
// }import 'package:flutter/material.dart';





import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Curved Header like "Setting"
          Stack(
            children: [
              ClipPath(
                clipper: TopCurveClipper(),
                child: Container(
                  height: 250,
                  color: const Color(0xFF06923E),
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: const Icon(Icons.menu, color: Colors.white),
              ),
              Positioned(
                top: 40,
                right: 20,
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        const Icon(Icons.notifications_none, color: Colors.white, size: 28),
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text("5", style: TextStyle(fontSize: 10, color: Colors.red)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 28),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/images/bed5.jpeg'),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(4),
                            child: const Icon(Icons.edit, size: 16, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Reuben Limbu",
                      style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // List Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: const [
                ProfileListItem(title: "Personal Info"),
                ProfileListItem(title: "Bank Account Info"),
                ProfileListItem(title: "Return Address Info"),
                ProfileListItem(title: "Change Password"),
                ProfileListItem(title: "Change Email Address"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final String title;
  const ProfileListItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Add navigation here if needed
      },
    );
  }
}

// Custom Clipper like in "Setting"
class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
