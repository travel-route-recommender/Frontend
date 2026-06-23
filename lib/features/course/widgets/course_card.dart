import 'package:flutter/material.dart';
import 'package:tripmatch/core/theme/app_colors.dart';
import 'package:tripmatch/core/theme/app_text_styles.dart';
import 'package:tripmatch/data/models/itinerary_item.dart';
import 'package:tripmatch/shared/widgets/app_card.dart';
import 'package:tripmatch/shared/widgets/tag_chip.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.course,
    required this.onTap,
  });

  final CourseRecommendation course;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(course.title, style: AppTextStyles.h3),
              ),
              if (course.isRecommended)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.pointPink,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '추천',
                    style: AppTextStyles.chip.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(course.subtitle, style: AppTextStyles.bodySmall),
          const SizedBox(height: 12),
          Text(
            course.places.join(' → '),
            style: AppTextStyles.body.copyWith(
              color: AppColors.textPrimary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Wrap(
                spacing: 8,
                children: course.tags.map((t) => TagChip(label: t)).toList(),
              ),
              const Spacer(),
              Text(
                '합의도 ${course.compatibilityScore}%',
                style: AppTextStyles.chip.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
