import 'package:flutter/material.dart';
import 'package:tripmatch/core/theme/app_colors.dart';
import 'package:tripmatch/core/theme/app_text_styles.dart';

class TagChip extends StatelessWidget {
  const TagChip({
    super.key,
    required this.label,
    this.backgroundColor,
    this.textColor,
  });

  final String label;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.softBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label.startsWith('#') ? label : '#$label',
        style: AppTextStyles.chip.copyWith(color: textColor ?? AppColors.primary),
      ),
    );
  }
}
