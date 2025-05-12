import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reddit_app/core/constants/app_images.dart';
import 'package:reddit_app/pages/home/controller.dart';
import 'package:reddit_app/pages/home/widgets/workout_card.dart';
import 'package:reddit_app/pages/login/login.dart';
import 'package:reddit_app/pages/product/product_details.dart';
import 'package:reddit_app/theme/colors.dart';
import 'package:reddit_app/widgets/loader.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  const HomeScreen({super.key, required this.name});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int _currentIndex = 0;

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.subtext,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Programs"),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Workouts"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: SafeArea(
        child: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    switch (_currentIndex) {
      case 0:
        return _programsContainer();
      case 1:
        return _workoutsContainer();
      case 2:
        return _profileContainer();
      default:
        return const SizedBox();
    }
  }

  Widget _programsContainer() {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Welcome, ${widget.name}!",
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkText,
                  ),
                ),
                InkWell(
                  onTap: () {
                    signOut();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                  child: const Icon(Icons.logout),
                ),
              ],
            ),
            Obx(() => controller.workoutList.isNotEmpty ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        AppImages.fitnessImage,
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Start Program',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  "Programs",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkText,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 200,
                  child: Obx(
                        () => ListView.builder(
                      itemCount: controller.workoutList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final workout = controller.workoutList[index];
                        return WorkoutCard(
                            model: workout,
                        );
                      },
                    ),
                  ),
                ),
                const Text(
                  "Workouts",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkText,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 200,
                  child: Obx(
                        () => ListView.builder(
                      itemCount: controller.workoutList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final workout = controller.workoutList[index];
                        return WorkoutCard(
                          model: workout,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ) :
           const Loader())
          ],
        ),
      ),
    );
  }

  Widget _workoutsContainer() {
    return Container(
      color: Colors.blue[50],
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Workouts",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.darkText,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 200,
            child: Obx(
                  () => ListView.builder(
                itemCount: controller.workoutList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final workout = controller.workoutList[index];
                  return WorkoutCard(
                    model: workout,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileContainer() {
    return Container(
      color: Colors.green[50],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome, ${widget.name}",
              style: const TextStyle(fontSize: 24, color: AppColors.darkText),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}


