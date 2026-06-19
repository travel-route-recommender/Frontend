import 'package:flutter/material.dart';
import 'package:tripmatch/core/theme/app_colors.dart';
import 'package:tripmatch/core/theme/app_text_styles.dart';
import 'package:tripmatch/data/models/travel_type.dart';
import 'package:tripmatch/shared/utils/responsive.dart';
import 'package:tripmatch/shared/widgets/tag_chip.dart';

class TravelTypeCard extends StatelessWidget {
  const TravelTypeCard({
    super.key,
    required this.travelType,
    this.compact = false,
  });

  final TravelType travelType;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(compact ? 20 : 28),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
        borderRadius: BorderRadius.circular(Responsive.cardRadiusLarge),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(travelType.emoji, style: const TextStyle(fontSize: 32)),
          const SizedBox(height: 12),
          Text(
            travelType.name,
            style: AppTextStyles.cardTitle.copyWith(
              fontSize: compact ? 18 : 22,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            travelType.description,
            style: AppTextStyles.cardSubtitle.copyWith(
              fontSize: compact ? 14 : 15,
              color: AppColors.white.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: travelType.tags
                .map(
                  (tag) => TagChip(
                    label: tag,
                    backgroundColor: AppColors.white.withValues(alpha: 0.2),
                    textColor: AppColors.white,
                  ),
                )
                .toList(),
          ),
          if (!compact) ...[
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: AppColors.white.withValues(alpha: 0.9),
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      travelType.warning,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
