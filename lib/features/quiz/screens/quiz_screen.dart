import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripmatch/core/router/app_router.dart';
import 'package:tripmatch/core/theme/app_text_styles.dart';
import 'package:tripmatch/data/repositories/trip_repository.dart';
import 'package:tripmatch/features/quiz/widgets/quiz_option_tile.dart';
import 'package:tripmatch/shared/utils/responsive.dart';
import 'package:tripmatch/shared/widgets/progress_header.dart';
import 'package:tripmatch/shared/widgets/tag_chip.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.repository});

  final TripRepository repository;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final questions = widget.repository.quizQuestions;
    final question = questions[_currentIndex];
    final selectedId = widget.repository.quizAnswers[question.id];

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Responsive.horizontalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      if (_currentIndex > 0) {
                        setState(() => _currentIndex--);
                      } else {
                        context.pop();
                      }
                    },
                    icon: const Icon(Icons.arrow_back),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(height: 16),
                  ProgressHeader(
                    current: _currentIndex + 1,
                    total: questions.length,
                  ),
                  const SizedBox(height: 24),
                  Text('나도 몰랐던 여행 취향 찾기', style: AppTextStyles.h2),
                  const SizedBox(height: 8),
                  Text(
                    '여행에서 진짜 중요하게 생각하는 기준을 골라주세요.',
                    style: AppTextStyles.body,
                  ),
                  const SizedBox(height: 32),
                  Text(question.question, style: AppTextStyles.h3),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: Responsive.horizontalPadding,
                ),
                itemCount: question.options.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final option = question.options[index];
                  return QuizOptionTile(
                    label: option.label,
                    isSelected: selectedId == option.id,
                    onTap: () => _onOptionSelected(option.id),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Responsive.horizontalPadding),
              child: TagChip(label: question.category),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _onOptionSelected(String optionId) {
    final questions = widget.repository.quizQuestions;
    final question = questions[_currentIndex];

    widget.repository.saveQuizAnswer(question.id, optionId);

    if (_currentIndex < questions.length - 1) {
      setState(() => _currentIndex++);
    } else {
      context.push(AppRoutes.travelTypeResult);
    }
  }
}
