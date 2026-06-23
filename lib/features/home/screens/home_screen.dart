import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripmatch/core/router/app_router.dart';
import 'package:tripmatch/core/theme/app_colors.dart';
import 'package:tripmatch/core/theme/app_text_styles.dart';
import 'package:tripmatch/data/repositories/trip_repository.dart';
import 'package:tripmatch/features/home/widgets/home_menu_card.dart';
import 'package:tripmatch/shared/utils/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.repository});

  final TripRepository repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: Responsive.horizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('TripMatch', style: AppTextStyles.logo),
                  IconButton(
                    onPressed: () => context.push(AppRoutes.myPage),
                    icon: const Icon(Icons.person_outline),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text('안녕하세요 👋', style: AppTextStyles.h1),
              const SizedBox(height: 8),
              Text(
                '오늘은 어떤 여행을 준비해볼까요?',
                style: AppTextStyles.body,
              ),
              const SizedBox(height: 32),
              HomeMenuCard(
                icon: Icons.sync,
                title: '조율 중인 일정 보러가기',
                subtitle: '진행 중인 여행 일정을 이어서 확인해요',
                iconBackgroundColor: AppColors.softBlue,
                onTap: () => context.push(AppRoutes.ongoingTrips),
              ),
              const SizedBox(height: 12),
              HomeMenuCard(
                icon: Icons.explore_outlined,
                title: '다른 사람들 일정 구경가기',
                subtitle: '다른 여행자들의 코스를 둘러봐요',
                iconBackgroundColor: AppColors.softPink,
                iconColor: AppColors.pointPink,
                onTap: () => context.push(AppRoutes.browseTrips),
              ),
              const SizedBox(height: 12),
              HomeMenuCard(
                icon: Icons.add_circle_outline,
                title: '새 여행 일정 짜러가기',
                subtitle: '성향 진단부터 일정 완성까지 한 번에',
                iconBackgroundColor: AppColors.softBlue,
                onTap: () {
                  repository.resetQuiz();
                  repository.skipCompanionInvite();
                  context.push(AppRoutes.quiz);
                },
              ),
              const SizedBox(height: 12),
              HomeMenuCard(
                icon: Icons.person_outline,
                title: '마이페이지',
                subtitle: '내 정보와 여행 기록을 확인해요',
                onTap: () => context.push(AppRoutes.myPage),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
