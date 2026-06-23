import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripmatch/core/router/app_router.dart';
import 'package:tripmatch/core/theme/app_colors.dart';
import 'package:tripmatch/core/theme/app_text_styles.dart';
import 'package:tripmatch/data/repositories/trip_repository.dart';
import 'package:tripmatch/shared/utils/responsive.dart';
import 'package:tripmatch/shared/widgets/app_card.dart';
import 'package:tripmatch/shared/widgets/primary_button.dart';
import 'package:tripmatch/shared/widgets/secondary_button.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key, required this.repository});

  final TripRepository repository;

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = repository.isLoggedIn;

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
              Text('마이페이지', style: AppTextStyles.h1),
              const SizedBox(height: 24),
              AppCard(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: AppColors.softBlue,
                      child: Icon(
                        isLoggedIn ? Icons.person : Icons.person_outline,
                        color: AppColors.primary,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isLoggedIn
                                ? repository.userName
                                : '게스트',
                            style: AppTextStyles.h3,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            isLoggedIn
                                ? repository.userEmail
                                : '로그인하면 일정을 저장할 수 있어요',
                            style: AppTextStyles.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _MenuTile(
                icon: Icons.sync,
                title: '조율 중인 일정',
                onTap: () => context.push(AppRoutes.ongoingTrips),
              ),
              _MenuTile(
                icon: Icons.history,
                title: '완료한 여행',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('준비 중이에요')),
                  );
                },
              ),
              _MenuTile(
                icon: Icons.settings_outlined,
                title: '설정',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('준비 중이에요')),
                  );
                },
              ),
              const SizedBox(height: 32),
              if (isLoggedIn)
                SecondaryButton(
                  label: '로그아웃',
                  onPressed: () {
                    repository.logout();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('로그아웃되었어요')),
                    );
                    context.pop();
                  },
                )
              else
                PrimaryButton(
                  label: '로그인하기',
                  onPressed: () => context.push(AppRoutes.login),
                ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title, style: AppTextStyles.h3),
        trailing: const Icon(
          Icons.chevron_right,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
