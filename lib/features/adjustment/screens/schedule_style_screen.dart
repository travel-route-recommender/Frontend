import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripmatch/core/router/app_router.dart';
import 'package:tripmatch/core/theme/app_text_styles.dart';
import 'package:tripmatch/data/models/match_result.dart';
import 'package:tripmatch/data/repositories/trip_repository.dart';
import 'package:tripmatch/shared/utils/responsive.dart';
import 'package:tripmatch/shared/widgets/option_card.dart';
import 'package:tripmatch/shared/widgets/primary_button.dart';

class ScheduleStyleScreen extends StatefulWidget {
  const ScheduleStyleScreen({super.key, required this.repository});

  final TripRepository repository;

  @override
  State<ScheduleStyleScreen> createState() => _ScheduleStyleScreenState();
}

class _ScheduleStyleScreenState extends State<ScheduleStyleScreen> {
  ScheduleStyleType? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.repository.selectedScheduleStyle;
  }

  @override
  Widget build(BuildContext context) {
    final styles = widget.repository.scheduleStyles;

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
              Text('일정 스타일을\n선택해주세요', style: AppTextStyles.h1),
              const SizedBox(height: 12),
              Text(
                'J처럼 계획하거나, P처럼 여유롭게 볼 수 있어요.',
                style: AppTextStyles.body,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.separated(
                  itemCount: styles.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final style = styles[index];
                    return OptionCard(
                      label: style.title,
                      subtitle: '${style.description}\n예: ${style.example}',
                      isSelected: _selected == style.type,
                      onTap: () {
                        setState(() => _selected = style.type);
                        widget.repository.selectScheduleStyle(style.type);
                      },
                    );
                  },
                ),
              ),
              PrimaryButton(
                label: '추천 코스 보기',
                onPressed: _selected != null
                    ? () => context.push(AppRoutes.courses)
                    : null,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
