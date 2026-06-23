import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripmatch/core/router/app_router.dart';
import 'package:tripmatch/core/theme/app_colors.dart';
import 'package:tripmatch/core/theme/app_text_styles.dart';
import 'package:tripmatch/data/repositories/trip_repository.dart';
import 'package:tripmatch/features/matching/widgets/match_summary_card.dart';
import 'package:tripmatch/shared/utils/responsive.dart';
import 'package:tripmatch/shared/widgets/primary_button.dart';

class MatchResultScreen extends StatelessWidget {
  const MatchResultScreen({super.key, required this.repository});

  final TripRepository repository;

  @override
  Widget build(BuildContext context) {
    final result = repository.matchResult;

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
              Text('두 사람의 여행 매칭 결과', style: AppTextStyles.h1),
              const SizedBox(height: 24),
              _CompatibilityBar(score: result.compatibilityScore),
              const SizedBox(height: 24),
              MatchSummaryCard(
                title: '잘 맞는 부분',
                items: result.matchingAreas,
                icon: Icons.favorite,
                iconColor: AppColors.pointPink,
                backgroundColor: AppColors.softPink,
              ),
              const SizedBox(height: 12),
              MatchSummaryCard(
                title: '조율이 필요한 부분',
                items: result.adjustmentAreas,
                icon: Icons.tune,
                iconColor: AppColors.primary,
                backgroundColor: AppColors.softBlue,
              ),
              const SizedBox(height: 12),
              MatchSummaryCard(
                title: '피하면 좋은 요소',
                items: result.avoidAreas,
                icon: Icons.block,
                iconColor: AppColors.textSecondary,
                backgroundColor: AppColors.background,
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.softBlue,
                  borderRadius: BorderRadius.circular(Responsive.cardRadius),
                ),
                child: Text(
                  result.summary,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                label: '조율안 확인하기',
                onPressed: () => context.push(AppRoutes.adjustment),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _CompatibilityBar extends StatelessWidget {
  const _CompatibilityBar({required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '$score',
              style: AppTextStyles.h1.copyWith(
                fontSize: 48,
                color: AppColors.primary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 4),
              child: Text(
                '%',
                style: AppTextStyles.h2.copyWith(color: AppColors.primary),
              ),
            ),
            const Spacer(),
            Text('합의도', style: AppTextStyles.sectionTitle),
          ],
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 12,
            child: Stack(
              children: [
                Container(color: AppColors.softBlue),
                FractionallySizedBox(
                  widthFactor: score / 100,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.primary, AppColors.pointPink],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
