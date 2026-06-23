import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripmatch/core/router/app_router.dart';
import 'package:tripmatch/core/theme/app_colors.dart';
import 'package:tripmatch/core/theme/app_text_styles.dart';
import 'package:tripmatch/data/repositories/trip_repository.dart';
import 'package:tripmatch/shared/utils/responsive.dart';
import 'package:tripmatch/shared/widgets/app_card.dart';
import 'package:tripmatch/shared/widgets/primary_button.dart';

class AdjustmentScreen extends StatelessWidget {
  const AdjustmentScreen({super.key, required this.repository});

  final TripRepository repository;

  @override
  Widget build(BuildContext context) {
    final plan = repository.adjustmentPlan;

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
              Text('두리가 조율안을\n준비했어요', style: AppTextStyles.h1),
              const SizedBox(height: 24),
              AppCard(
                color: AppColors.softBlue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.auto_awesome,
                            color: AppColors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text('AI 두리', style: AppTextStyles.sectionTitle),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      plan.aiMessage,
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text('조율안 요약', style: AppTextStyles.sectionTitle),
              const SizedBox(height: 12),
              ...plan.summaryPoints.asMap().entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: AppCard(
                    child: Row(
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: AppColors.softBlue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              '${entry.key + 1}',
                              style: AppTextStyles.chip.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(entry.value, style: AppTextStyles.h3),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              const SizedBox(height: 32),
              PrimaryButton(
                label: '일정 스타일 선택하기',
                onPressed: () => context.push(AppRoutes.scheduleStyle),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
