import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripmatch/core/router/app_router.dart';
import 'package:tripmatch/core/theme/app_text_styles.dart';
import 'package:tripmatch/data/repositories/trip_repository.dart';
import 'package:tripmatch/features/schedule/widgets/itinerary_item_card.dart';
import 'package:tripmatch/shared/utils/responsive.dart';
import 'package:tripmatch/shared/widgets/primary_button.dart';

class EditableScheduleScreen extends StatefulWidget {
  const EditableScheduleScreen({super.key, required this.repository});

  final TripRepository repository;

  @override
  State<EditableScheduleScreen> createState() => _EditableScheduleScreenState();
}

class _EditableScheduleScreenState extends State<EditableScheduleScreen> {
  @override
  void initState() {
    super.initState();
    widget.repository.addListener(_onRepositoryChanged);
  }

  @override
  void dispose() {
    widget.repository.removeListener(_onRepositoryChanged);
    super.dispose();
  }

  void _onRepositoryChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.repository.itinerary;

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
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text('Day 1', style: AppTextStyles.chip),
                  const SizedBox(height: 8),
                  Text('함께 수정하는 최종 일정', style: AppTextStyles.h1),
                  const SizedBox(height: 8),
                  Text(
                    '장소별 우선순위를 조정할 수 있어요.',
                    style: AppTextStyles.body,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ReorderableListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: Responsive.horizontalPadding,
                ),
                itemCount: items.length,
                onReorder: widget.repository.updateItineraryOrder,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ItineraryItemCard(
                    key: ValueKey(item.id),
                    item: item,
                    index: index,
                    onPriorityChanged: (priority) {
                      widget.repository.updateItineraryPriority(
                        item.id,
                        priority,
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Responsive.horizontalPadding),
              child: PrimaryButton(
                label: '일정 완료하기',
                onPressed: () => context.push(AppRoutes.finalSchedule),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
