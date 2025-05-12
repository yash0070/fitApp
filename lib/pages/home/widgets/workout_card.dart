import 'package:flutter/material.dart';
import 'package:reddit_app/domain/models/workout_model.dart';
import 'package:reddit_app/pages/product/product_details.dart';
import 'package:reddit_app/theme/colors.dart';
import 'package:reddit_app/widgets/show_image_widget.dart';

class WorkoutCard extends StatelessWidget {
  final WorkoutModel model;

  const WorkoutCard({super.key,
    required this.model
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ProgramDetailScreen(model: model)),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShowImageWidget(image: model.image),
            const SizedBox(height: 6),
            Text(
              model.title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.darkText,
              ),
            )
          ],
        ),
      ),
    );
  }
}