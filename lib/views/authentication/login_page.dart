// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import '../../services/auth_service.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
//   late AnimationController _fadeController;
//   late AnimationController _slideController;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;

//   final Color mainGreen = const Color(0xFF06923E);

//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();

//   bool _loading = false;

//   @override
//   void initState() {
//     super.initState();

//     _fadeController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     );
//     _slideController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     );

//     _fadeAnimation = CurvedAnimation(
//       parent: _fadeController,
//       curve: Curves.easeIn,
//     );

//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, 0.3),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _slideController,
//       curve: Curves.easeOut,
//     ));

//     _fadeController.forward();
//     _slideController.forward();
//   }

//   @override
//   void dispose() {
//     _fadeController.dispose();
//     _slideController.dispose();
//     _usernameController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   Future<void> _handleLogin() async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() => _loading = true);

//     final authService = AuthService();
//     final result = await authService.login(
//       username: _usernameController.text.trim(),
//       password: _passwordController.text,
//     );

//     setState(() => _loading = false);

//     await showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         title: Text(result == 'Login successful' ? 'Success' : 'Login Failed'),
//         content: Text(result ?? 'Something went wrong'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(ctx).pop();
//               if (result == 'Login successful') {
//                 // Navigate to dashboard or home
//                 Navigator.pushReplacementNamed(context, '/homepage');
//               }
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Opacity(
//             opacity: 0.1,
//             child: Image.asset(
//               'assets/images/illution.png',
//               height: double.infinity,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           SafeArea(
//             child: FadeTransition(
//               opacity: _fadeAnimation,
//               child: SlideTransition(
//                 position: _slideAnimation,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 24),
//                   child: Form(
//                     key: _formKey,
//                     child: ListView(
//                       children: [
//                         const SizedBox(height: 10),
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: IconButton(
//                             icon: const Icon(Icons.arrow_back),
//                             onPressed: () => Navigator.pushReplacementNamed(context, '/homepage'),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         const Text(
//                           "Dear customer Welcome",
//                           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 30),
//                         _buildInputField(context, 'Enter your username', controller: _usernameController),
//                         _buildInputField(context, 'Enter your password', isPassword: true, controller: _passwordController),
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: TextButton(
//                             onPressed: () {},
//                             child: Text("Forgot Password?", style: TextStyle(color: mainGreen)),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         ElevatedButton(
//                           onPressed: _loading ? null : _handleLogin,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: mainGreen,
//                             minimumSize: const Size.fromHeight(50),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                           child: _loading
//                               ? const CircularProgressIndicator(color: Colors.white)
//                               : const Text('Login', style: TextStyle(fontSize: 16)),
//                         ),
//                         const SizedBox(height: 30),
//                         const Center(child: Text("Or Login with")),
//                         const SizedBox(height: 16),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             _buildSocialIcon(context, FontAwesomeIcons.facebookF),
//                             _buildSocialIcon(context, FontAwesomeIcons.google),
//                             _buildSocialIcon(context, FontAwesomeIcons.apple),
//                           ],
//                         ),
//                         const SizedBox(height: 40),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text("Don't have an account? "),
//                             GestureDetector(
//                               onTap: () => Navigator.pushNamed(context, '/register'),
//                               child: Text(
//                                 "Register Now",
//                                 style: TextStyle(color: mainGreen, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildInputField(BuildContext context, String hint,
//       {bool isPassword = false, required TextEditingController controller}) {
//     final theme = Theme.of(context);
//     final isDark = theme.brightness == Brightness.dark;

//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20),
//       child: TextFormField(
//         controller: controller,
//         obscureText: isPassword,
//         validator: (value) => value == null || value.isEmpty ? 'Required field' : null,
//         decoration: InputDecoration(
//           hintText: hint,
//           hintStyle: TextStyle(color: isDark ? Colors.grey.shade300 : Colors.grey.shade600),
//           filled: true,
//           fillColor: Colors.white,
//           contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide.none,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSocialIcon(BuildContext context, IconData icon) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;

//     return Container(
//       height: 50,
//       width: 50,
//       decoration: BoxDecoration(
//         color: isDark ? Colors.grey.shade900 : Colors.white,
//         border: Border.all(color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Icon(icon, size: 20, color: isDark ? Colors.white : Colors.black87),
//     );
//   }
// }








import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quickalert/quickalert.dart';
import '../../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final Color mainGreen = const Color(0xFF06923E);

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;
  String? _error;

  final _authService = AuthService();

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOut,
    ));

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _loading = true;
      _error = null;
    });

    final message = await _authService.login(
      username: _usernameController.text.trim(),
      password: _passwordController.text.trim(),
    );

    setState(() => _loading = false);

    if (message == "Login Successful") {
      return QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: message,
        confirmBtnText: 'Continue',
        confirmBtnColor: Colors.green,
      ).then((_) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      });
    } else {
      setState(() => _error = message);
      return QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: message ?? 'Login failed',
        confirmBtnText: 'Okay',
        confirmBtnColor: Colors.red,
      ).then((_) => setState(() => _error = null));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.1,
            child: Image.asset(
              'assets/images/illution.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ListView(
                    children: [
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pushReplacementNamed(context, '/homepage'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Dear customer Welcome",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30),
                      if (_error != null) ...[
                        Text(_error!, style: const TextStyle(color: Colors.red)),
                        const SizedBox(height: 10),
                      ],
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            _buildInputField(
                              context,
                              'Enter your username',
                              controller: _usernameController,
                            ),
                            _buildInputField(
                              context,
                              'Enter your password',
                              controller: _passwordController,
                              isPassword: true,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text("Forgot Password?", style: TextStyle(color: mainGreen)),
                              ),
                            ),
                            const SizedBox(height: 10),
                            _loading
                                ? const CircularProgressIndicator()
                                : ElevatedButton(
                                    onPressed: _handleLogin,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: mainGreen,
                                      minimumSize: const Size.fromHeight(50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: const Text('Login', style: TextStyle(fontSize: 16)),
                                  ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Center(child: Text("Or Login with")),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildSocialIcon(context, FontAwesomeIcons.facebookF),
                          _buildSocialIcon(context, FontAwesomeIcons.google),
                          _buildSocialIcon(context, FontAwesomeIcons.apple),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, '/register'),
                            child: Text(
                              "Register Now",
                              style: TextStyle(color: mainGreen, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInputField(BuildContext context, String hint,
      {bool isPassword = false, required TextEditingController controller}) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        validator: (value) {
          if (value == null || value.isEmpty) return 'Required';
          return null;
        },
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: isDark ? Colors.grey.shade300 : Colors.grey.shade600,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(BuildContext context, IconData icon) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade900 : Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, size: 20, color: isDark ? Colors.white : Colors.black87),
    );
  }
}




//  export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64export 
//  PATH=$JAVA_HOME/bin:$PATH
