import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripmatch/core/theme/app_colors.dart';
import 'package:tripmatch/core/theme/app_text_styles.dart';
import 'package:tripmatch/data/mock/mock_trip_data.dart';
import 'package:tripmatch/shared/utils/responsive.dart';
import 'package:tripmatch/shared/widgets/app_card.dart';
import 'package:tripmatch/shared/widgets/tag_chip.dart';

class BrowseTripsScreen extends StatelessWidget {
  const BrowseTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final publicTrips = MockTripData.publicTrips;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
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
                    '다른 사람들\n일정 구경하기',
                    style: AppTextStyles.h1,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '다른 여행자들이 만든 코스를 참고해보세요.',
                    style: AppTextStyles.body,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: Responsive.horizontalPadding,
                ),
                itemCount: publicTrips.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final trip = publicTrips[index];
                  return AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.softBlue,
                              child: Text(
                                trip['author']!.substring(0, 1),
                                style: AppTextStyles.chip.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(trip['author']!, style: AppTextStyles.h3),
                                  Text(
                                    trip['destination']!,
                                    style: AppTextStyles.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              trip['likes']!,
                              style: AppTextStyles.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(trip['title']!, style: AppTextStyles.h3),
                        const SizedBox(height: 8),
                        Text(trip['summary']!, style: AppTextStyles.body),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: trip['tags']!
                              .split(',')
                              .map((tag) => TagChip(label: tag.trim()))
                              .toList(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
