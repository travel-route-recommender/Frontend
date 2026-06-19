import 'package:flutter/material.dart';
import 'package:tripmatch/core/theme/app_text_styles.dart';
import 'package:tripmatch/shared/widgets/app_card.dart';
import 'package:tripmatch/shared/widgets/tag_chip.dart';

class MatchSummaryCard extends StatelessWidget {
  const MatchSummaryCard({
    super.key,
    required this.title,
    required this.items,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
  });

  final String title;
  final List<String> items;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 20),
              const SizedBox(width: 8),
              Text(title, style: AppTextStyles.sectionTitle),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: items.map((item) => TagChip(label: item)).toList(),
          ),
        ],
      ),
    );
  }
}
