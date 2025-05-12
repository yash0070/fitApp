import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reddit_app/core/constants/app_images.dart';
import 'package:reddit_app/pages/login/controller.dart';
import '../../theme/colors.dart';
import '../../widgets/loader.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 1),
              const Center(
                child: Text('SWEAT',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      height: 1.2,
                    )),
              ),
              const Center(
                child: Text('IT OUT',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      height: 0.7,
                    )),
              ),
              const Spacer(flex: 2),
              const Center(
                child: Text(
                  'Log in to your account',
                  style: TextStyle(fontSize: 18, color: AppColors.darkText),
                ),
              ),
              const SizedBox(height: 24),
              Obx(() => controller.isLoading.value
                  ? const Loader()
                  : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.darkText,
                    minimumSize: const Size.fromHeight(50),
                    side: BorderSide(
                        color: AppColors.subtext.withOpacity(0.3)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: Image.asset(AppImages.googleImage, height: 40),
                  label: const Text('Continue with Google'),
                  onPressed: controller.signInWithGoogle,
                ),
              )),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.subtext.withOpacity(0.1),
                    foregroundColor: AppColors.darkText,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Log in with Email'),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Upcoming")),
                    );
                  },
                ),
              ),
              const Spacer(flex: 1),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Don’t have an account? Sign up",
                    style: TextStyle(color: AppColors.subtext),
                  ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:reddit_app/core/utils.dart';
// import 'package:reddit_app/pages/home/home_page.dart';
// import 'package:reddit_app/theme/colors.dart';
// import 'package:reddit_app/widgets/loader.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//
//   bool isLoading = false;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<UserCredential?> signInWithGoogle() async {
//     setState(() {});
//     isLoading = true;
//     try {
//       // Trigger the authentication flow
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//       if (googleUser == null) return null;
//
//       // Obtain auth details
//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//
//       // Create a new credential
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       isLoading = false;
//       // Sign in with Firebase
//       setState(() {});
//       return await _auth.signInWithCredential(credential);
//     } catch (e) {
//       isLoading = false;
//       setState(() {});
//       print('Google sign-in failed: $e');
//       return null;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [const Spacer(flex: 1),
//               const Center(
//                 child: Text(
//                   'SWEAT',
//                   style: TextStyle(
//                     fontSize: 60,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.primary,
//                     height: 1.2,
//                   ),
//                 ),
//               ),
//               const Center(
//                 child: Text(
//                   'IT OUT',
//                   style: TextStyle(
//                       fontSize: 60,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.primary,
//                       height: 0.7
//                   ),
//                 ),
//               ),
//               const Spacer(flex: 2),
//               const Center(
//                 child: Text(
//                   'Log in to your account',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: AppColors.darkText,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 24),
//               isLoading
//                   ? const Loader()
//                   : Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: ElevatedButton.icon(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     foregroundColor: AppColors.darkText,
//                     minimumSize: const Size.fromHeight(50),
//                     side: BorderSide(
//                         color: AppColors.subtext.withOpacity(0.3)),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   icon: Image.asset(
//                     'assets/google.png',
//                     height: 24,
//                   ),
//                   label: const Text('Continue with Google'),
//                   onPressed: () async {
//                     setState(() {
//                       isLoading = true;
//                     });
//                     final userCredential =
//                     await signInWithGoogle();
//                     if (userCredential != null) {
//                       // Navigate or show success
//                       print('Signed in as ${userCredential.user?.displayName}');
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => HomeScreen(
//                             name: userCredential.user?.displayName??"",
//                           ),
//                         ),
//                       );
//                     } else {
//                       isLoading = false;
//                       // Handle failure
//                       showSnackBar(context,"Google Sign-in failed");
//                     }
//                     setState(() {
//                     });
//                   },
//                 ),
//               ),
//               const SizedBox(height: 24),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal:20.0),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.subtext.withOpacity(0.1),
//                     foregroundColor: AppColors.darkText,
//                     minimumSize: const Size.fromHeight(50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: const Text('Log in with Email'),
//                   onPressed: () {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                           content: Text("Upcoming")),
//                     );
//                     // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(
//                     //   name: ,
//                     // )));
//                   },
//                 ),
//               ),
//               const Spacer(flex: 1),
//               Center(
//                 child: TextButton(
//                   onPressed: () {},
//                   child:const Text(
//                     "Don’t have an account? Sign up",
//                     style: TextStyle(color: AppColors.subtext),
//                   ),
//                 ),
//               ),
//               const Spacer(flex: 2),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }