import 'package:flutter/material.dart';
import 'package:tripmatch/shared/widgets/option_card.dart';

class QuizOptionTile extends StatelessWidget {
  const QuizOptionTile({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OptionCard(
      label: label,
      isSelected: isSelected,
      onTap: onTap,
    );
  }
}
