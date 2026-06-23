import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripmatch/core/router/app_router.dart';
import 'package:tripmatch/core/theme/app_text_styles.dart';
import 'package:tripmatch/data/repositories/trip_repository.dart';
import 'package:tripmatch/features/course/widgets/course_card.dart';
import 'package:tripmatch/shared/utils/responsive.dart';

class CourseRecommendationScreen extends StatelessWidget {
  const CourseRecommendationScreen({super.key, required this.repository});

  final TripRepository repository;

  @override
  Widget build(BuildContext context) {
    final courses = repository.courses;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: Responsive.horizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back),
              ),
              Text(
                '두 사람을 위한\n강릉 1박 2일 코스',
                style: AppTextStyles.h1,
              ),
              const SizedBox(height: 12),
              Text(
                '취향을 반영한 세 가지 추천 코스예요.',
                style: AppTextStyles.body,
              ),
              const SizedBox(height: 24),
              ...courses.map(
                (course) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: CourseCard(
                    course: course,
                    onTap: () {
                      repository.selectCourse(course);
                      context.push(AppRoutes.editSchedule);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
