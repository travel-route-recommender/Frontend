import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripmatch/core/router/app_router.dart';
import 'package:tripmatch/core/theme/app_text_styles.dart';
import 'package:tripmatch/data/repositories/trip_repository.dart';
import 'package:tripmatch/features/result/widgets/travel_type_card.dart';
import 'package:tripmatch/shared/utils/responsive.dart';
import 'package:tripmatch/shared/widgets/primary_button.dart';

class TravelTypeResultScreen extends StatelessWidget {
  const TravelTypeResultScreen({super.key, required this.repository});

  final TripRepository repository;

  @override
  Widget build(BuildContext context) {
    final travelType = repository.myTravelType;

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
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('공유 기능은 준비 중이에요')),
                      );
                    },
                    icon: const Icon(Icons.share_outlined),
                  ),
                ],
              ),
              Text('당신의 여행 성향 카드', style: AppTextStyles.h1),
              const SizedBox(height: 24),
              TravelTypeCard(travelType: travelType),
              if (repository.companionInvited) ...[
                const SizedBox(height: 16),
                Text(
                  '동행자 초대 완료: ${repository.companionInviteInput}',
                  style: AppTextStyles.bodySmall,
                ),
              ],
              const SizedBox(height: 32),
              PrimaryButton(
                label: '매칭 결과 보기',
                onPressed: () => context.push(AppRoutes.matchResult),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
