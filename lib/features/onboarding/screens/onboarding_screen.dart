import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripmatch/core/router/app_router.dart';
import 'package:tripmatch/core/theme/app_colors.dart';
import 'package:tripmatch/core/theme/app_text_styles.dart';
import 'package:tripmatch/data/mock/mock_trip_data.dart';
import 'package:tripmatch/shared/utils/responsive.dart';
import 'package:tripmatch/shared/widgets/app_card.dart';
import 'package:tripmatch/shared/widgets/primary_button.dart';
import 'package:tripmatch/shared/widgets/secondary_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final example = MockTripData.onboardingExample;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: Responsive.horizontalPadding,
          ),
          child: Column(
            children: [
              const SizedBox(height: 48),
              Text('TripMatch', style: AppTextStyles.logo),
              const SizedBox(height: 32),
              Text(
                '우리의 취향이\n만나는 여행',
                style: AppTextStyles.h1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                '각자의 여행 성향을 먼저 알아보고, 둘이 둘 다 만족할 수 있는 코스를 맞춰드려요.',
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              AppCard(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('매칭 예시', style: AppTextStyles.sectionTitle),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        _UserBadge(
                          label: example['user1']!,
                          color: AppColors.softBlue,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(Icons.favorite, color: AppColors.pointPink, size: 20),
                        ),
                        _UserBadge(
                          label: example['user2']!,
                          color: AppColors.softPink,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.softBlue,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '합의도 ${example['match']}',
                            style: AppTextStyles.h3.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            example['highlight']!,
                            style: AppTextStyles.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                label: '이미 계정이 있습니다',
                onPressed: () => context.push(AppRoutes.starting),
              ),
              const SizedBox(height: 12),
              SecondaryButton(
                label: '처음입니다',
                icon: Icons.waving_hand_outlined,
                onPressed: () => context.push(AppRoutes.signUp),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserBadge extends StatelessWidget {
  const _UserBadge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
