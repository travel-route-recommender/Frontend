import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripmatch/core/router/app_router.dart';
import 'package:tripmatch/core/theme/app_colors.dart';
import 'package:tripmatch/core/theme/app_text_styles.dart';
import 'package:tripmatch/shared/utils/responsive.dart';
import 'package:tripmatch/shared/widgets/app_card.dart';
import 'package:tripmatch/shared/widgets/primary_button.dart';
import 'package:tripmatch/shared/widgets/secondary_button.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
              const Spacer(),
              Text('TripMatch', style: AppTextStyles.logo),
              const SizedBox(height: 24),
              Text(
                '언제 떠나볼까요?',
                style: AppTextStyles.h1,
              ),
              const SizedBox(height: 12),
              Text(
                '지금 바로 여행을 준비하거나, 나중에 다시 돌아와도 괜찮아요.',
                style: AppTextStyles.body,
              ),
              const SizedBox(height: 32),
              AppCard(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.softBlue,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.flight_takeoff,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        '바로 여행할래요 선택 시 동행자 초대 후\n새 일정을 바로 만들 수 있어요.',
                        style: AppTextStyles.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              PrimaryButton(
                label: '바로 여행할래요!',
                onPressed: () => context.push(AppRoutes.companionInvite),
              ),
              const SizedBox(height: 12),
              SecondaryButton(
                label: '다음에 여행할래요!',
                icon: Icons.home_outlined,
                onPressed: () => context.go(AppRoutes.home),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
