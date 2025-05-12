import 'package:flutter/material.dart';
import 'package:reddit_app/core/constants/app_images.dart';
import 'package:reddit_app/domain/models/workout_model.dart';
import 'package:reddit_app/widgets/show_image_widget.dart';

class ProgramDetailScreen extends StatelessWidget {
  final WorkoutModel model;
  const ProgramDetailScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top image and back button
          Stack(
            children: [
              ShowImageWidget(
                image: model.image,
                height: MediaQuery.of(context).size.width * 1,
                width: double.infinity,
              ),
              Positioned(
                top: 30,
                left: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    model.title,
                    style:const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text.rich(
                    TextSpan(
                      text: 'Duration: ',
                      style: TextStyle(fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                          text: '4 weeks',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    model.details,
                    style:const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Workouts',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const _WorkoutRow(title: "Day 1: Full Body HIIT", duration: "36 min"),
                  const _WorkoutRow(title: "Day 2: Upper Body Burn", duration: "30 min"),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF6D60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Buy \$28.99',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WorkoutRow extends StatelessWidget {
  final String title;
  final String duration;

  const _WorkoutRow({
    required this.title,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
          Text(duration, style: const TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }
}
