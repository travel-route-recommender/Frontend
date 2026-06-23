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

class CompanionInviteScreen extends StatefulWidget {
  const CompanionInviteScreen({super.key, required this.repository});

  final TripRepository repository;

  @override
  State<CompanionInviteScreen> createState() => _CompanionInviteScreenState();
}

class _CompanionInviteScreenState extends State<CompanionInviteScreen> {
  bool _wantsInvite = false;
  bool _invited = false;
  final _inputController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _startTripPlanning() {
    widget.repository.resetQuiz();
    context.go(AppRoutes.quiz);
  }

  void _confirmInvite() {
    final input = _inputController.text.trim();
    if (input.isEmpty) return;

    widget.repository.setCompanionInvite(input);
    setState(() => _invited = true);
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
              Text(
                '동행자와 함께\n여행할까요?',
                style: AppTextStyles.h1,
              ),
              const SizedBox(height: 12),
              Text(
                '함께하면 취향을 맞춘 일정을 더 정확하게 만들 수 있어요.',
                style: AppTextStyles.body,
              ),
              const SizedBox(height: 32),
              if (!_wantsInvite) ...[
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '동행자를 초대하시겠어요?',
                        style: AppTextStyles.h3,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '초대 링크나 전화번호를 보내면\n상대방도 성향 진단을 진행할 수 있어요.',
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                  label: '네, 초대할게요',
                  onPressed: () => setState(() => _wantsInvite = true),
                ),
                const SizedBox(height: 12),
                SecondaryButton(
                  label: '아니요, 혼자 진행할게요',
                  onPressed: () {
                    widget.repository.skipCompanionInvite();
                    _startTripPlanning();
                  },
                ),
              ] else if (!_invited) ...[
                AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '초대 링크 또는 전화번호',
                        style: AppTextStyles.sectionTitle,
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _inputController,
                        decoration: InputDecoration(
                          hintText: 'tripmatch.com/invite/abc123 또는 010-0000-0000',
                          hintStyle: AppTextStyles.bodySmall,
                          filled: true,
                          fillColor: AppColors.background,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: AppColors.border),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: AppColors.border),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: AppColors.primary,
                              width: 2,
                            ),
                          ),
                        ),
                        onSubmitted: (_) => _confirmInvite(),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '아무 값이나 입력해도 초대 완료로 처리돼요. (데모)',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                  label: '초대 보내기',
                  onPressed: _confirmInvite,
                ),
              ] else ...[
                AppCard(
                  color: AppColors.softBlue,
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '동행자 초대 완료!',
                              style: AppTextStyles.h3.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _inputController.text.trim(),
                              style: AppTextStyles.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                  label: '새 여행 일정 짜러가기',
                  onPressed: _startTripPlanning,
                ),
              ],
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
