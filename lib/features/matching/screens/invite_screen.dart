import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:tripmatch/core/router/app_router.dart';
import 'package:tripmatch/core/theme/app_colors.dart';
import 'package:tripmatch/core/theme/app_text_styles.dart';
import 'package:tripmatch/data/repositories/trip_repository.dart';
import 'package:tripmatch/features/result/widgets/travel_type_card.dart';
import 'package:tripmatch/shared/utils/responsive.dart';
import 'package:tripmatch/shared/widgets/app_card.dart';
import 'package:tripmatch/shared/widgets/primary_button.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({super.key, required this.repository});

  final TripRepository repository;

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  bool _isWaiting = true;

  @override
  void initState() {
    super.initState();
    _simulatePartnerResponse();
  }

  void _simulatePartnerResponse() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _isWaiting = false);
    });
  }

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
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back),
              ),
              Text('동행자와 여행 케미를\n맞춰볼까요?', style: AppTextStyles.h1),
              const SizedBox(height: 12),
              Text(
                '서로의 선택은 결과 공개 전까지 보이지 않아요.',
                style: AppTextStyles.body,
              ),
              const SizedBox(height: 24),
              Text('나의 성향', style: AppTextStyles.sectionTitle),
              const SizedBox(height: 12),
              TravelTypeCard(
                travelType: widget.repository.myTravelType,
                compact: true,
              ),
              const SizedBox(height: 24),
              Text('동행자', style: AppTextStyles.sectionTitle),
              const SizedBox(height: 12),
              _isWaiting
                  ? AppCard(child: _WaitingCard())
                  : TravelTypeCard(
                      travelType: widget.repository.partnerTravelType,
                      compact: true,
                    ),
              const SizedBox(height: 24),
              Text('초대 링크', style: AppTextStyles.sectionTitle),
              const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.repository.inviteLink,
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(text: widget.repository.inviteLink),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('링크가 복사되었어요')),
                        );
                      },
                      icon: const Icon(Icons.copy, color: AppColors.primary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              if (!_isWaiting)
                PrimaryButton(
                  label: '매칭 결과 확인하기',
                  onPressed: () => context.push(AppRoutes.matchResult),
                )
              else
                PrimaryButton(
                  label: '응답 대기 중...',
                  onPressed: null,
                ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _WaitingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '동행자 응답 대기 중',
          style: AppTextStyles.h3,
        ),
        const SizedBox(height: 8),
        Text(
          '상대방이 여행 성향 진단을 완료하면\n결과를 확인할 수 있어요.',
          style: AppTextStyles.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
