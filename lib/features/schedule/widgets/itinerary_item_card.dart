import 'package:flutter/material.dart';
import 'package:tripmatch/core/theme/app_colors.dart';
import 'package:tripmatch/core/theme/app_text_styles.dart';
import 'package:tripmatch/data/models/itinerary_item.dart';
import 'package:tripmatch/shared/widgets/app_card.dart';
import 'package:tripmatch/shared/widgets/tag_chip.dart';

class ItineraryItemCard extends StatelessWidget {
  const ItineraryItemCard({
    super.key,
    required this.item,
    required this.index,
    required this.onPriorityChanged,
  });

  final ItineraryItem item;
  final int index;
  final ValueChanged<PriorityLevel> onPriorityChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReorderableDragStartListener(
                  index: index,
                  child: const Icon(
                    Icons.drag_handle,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.placeName, style: AppTextStyles.h3),
                      const SizedBox(height: 4),
                      Text(
                        '${item.startTime} - ${item.endTime}',
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: item.tags.map((t) => TagChip(label: t)).toList(),
            ),
            const SizedBox(height: 12),
            Text(item.reason, style: AppTextStyles.bodySmall),
            const SizedBox(height: 12),
            Row(
              children: [
                _PriorityButton(
                  label: '꼭 가기',
                  isSelected: item.priority == PriorityLevel.must,
                  onTap: () => onPriorityChanged(PriorityLevel.must),
                ),
                const SizedBox(width: 8),
                _PriorityButton(
                  label: '가능하면',
                  isSelected: item.priority == PriorityLevel.optional,
                  onTap: () => onPriorityChanged(PriorityLevel.optional),
                ),
                const SizedBox(width: 8),
                _PriorityButton(
                  label: '-',
                  isSelected: item.priority == PriorityLevel.skip,
                  onTap: () => onPriorityChanged(PriorityLevel.skip),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PriorityButton extends StatelessWidget {
  const _PriorityButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.softBlue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: AppTextStyles.chip.copyWith(
            color: isSelected ? AppColors.white : AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
