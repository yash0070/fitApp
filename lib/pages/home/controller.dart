import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reddit_app/domain/models/workout_model.dart';

class HomeController extends GetxController {
  Rx<WorkoutModel?> workout = Rx<WorkoutModel?>(null);
  RxBool isLoading = false.obs;

  /// Fetch data from firebase and show data
  RxList<WorkoutModel> workoutList = <WorkoutModel>[].obs;
  Future<void> fetchWorkoutList() async {
    try {
      isLoading.value = true;
      final querySnapshot =
      await FirebaseFirestore.instance.collection('workouts').get();

      final workouts = querySnapshot.docs.map((doc) {
        return WorkoutModel.fromMap(doc.data());
      }).toList();

      workoutList.assignAll(workouts);
    } catch (e) {
      print('Error fetching workouts: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchWorkoutList();
  }
}
