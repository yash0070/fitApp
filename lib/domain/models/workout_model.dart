class WorkoutModel {
  final String id;
  final String title;
  final String image;
  final String details;

  WorkoutModel({
    required this.id,
    required this.title,
    required this.image,
    required this.details,
  });

  factory WorkoutModel.fromMap(Map<String, dynamic> data) {
    return WorkoutModel(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      image: data['image'] ?? '',
      details: data['details'] ?? '',
    );
  }
}
