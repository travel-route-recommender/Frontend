import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripmatch/core/router/app_router.dart';
import 'package:tripmatch/core/theme/app_colors.dart';
import 'package:tripmatch/core/theme/app_text_styles.dart';
import 'package:tripmatch/data/repositories/trip_repository.dart';
import 'package:tripmatch/shared/utils/responsive.dart';
import 'package:tripmatch/shared/widgets/app_card.dart';
import 'package:tripmatch/shared/widgets/primary_button.dart';

class OngoingTripDetailScreen extends StatelessWidget {
  const OngoingTripDetailScreen({
    super.key,
    required this.repository,
    required this.tripId,
  });

  final TripRepository repository;
  final String tripId;

  static const _stepLabels = [
    '여행 성향 퀴즈',
    '개인 성향 결과',
    '매칭 결과',
    'AI 조율안',
    '일정 스타일 선택',
    '추천 코스',
    '일정 편집',
    '최종 일정',
  ];

  static const _stepRoutes = [
    AppRoutes.quiz,
    AppRoutes.travelTypeResult,
    AppRoutes.matchResult,
    AppRoutes.adjustment,
    AppRoutes.scheduleStyle,
    AppRoutes.courses,
    AppRoutes.editSchedule,
    AppRoutes.finalSchedule,
  ];

  @override
  Widget build(BuildContext context) {
    final trip = repository.getOngoingTrip(tripId);

    if (trip == null) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: Text('일정을 찾을 수 없어요.', style: AppTextStyles.body),
          ),
        ),
      );
    }

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
              Text(trip.title, style: AppTextStyles.h1),
              const SizedBox(height: 8),
              Text(trip.destination, style: AppTextStyles.body),
              const SizedBox(height: 24),
              AppCard(
                color: AppColors.softBlue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('진행 요약', style: AppTextStyles.sectionTitle),
                    const SizedBox(height: 8),
                    Text(trip.summary, style: AppTextStyles.body),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text('진행 단계', style: AppTextStyles.sectionTitle),
              const SizedBox(height: 12),
              ...List.generate(_stepLabels.length, (index) {
                final stepNumber = index + 1;
                final isCompleted = stepNumber < trip.currentStep;
                final isCurrent = stepNumber == trip.currentStep;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: AppCard(
                    color: isCurrent ? AppColors.softBlue : null,
                    child: Row(
                      children: [
                        Icon(
                          isCompleted
                              ? Icons.check_circle
                              : isCurrent
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_off,
                          color: isCompleted || isCurrent
                              ? AppColors.primary
                              : AppColors.textSecondary,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            _stepLabels[index],
                            style: AppTextStyles.h3.copyWith(
                              color: isCurrent
                                  ? AppColors.primary
                                  : AppColors.textPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              const SizedBox(height: 16),
              PrimaryButton(
                label: '이어서 진행하기',
                onPressed: () {
                  final routeIndex = (trip.currentStep - 1)
                      .clamp(0, _stepRoutes.length - 1);
                  context.push(_stepRoutes[routeIndex]);
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
