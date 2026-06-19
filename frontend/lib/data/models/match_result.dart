class MatchResult {
  const MatchResult({
    required this.compatibilityScore,
    required this.matchingAreas,
    required this.adjustmentAreas,
    required this.avoidAreas,
    required this.summary,
  });

  final int compatibilityScore;
  final List<String> matchingAreas;
  final List<String> adjustmentAreas;
  final List<String> avoidAreas;
  final String summary;
}

class AdjustmentPlan {
  const AdjustmentPlan({
    required this.aiMessage,
    required this.summaryPoints,
  });

  final String aiMessage;
  final List<String> summaryPoints;
}

enum ScheduleStyleType { jType, pType }

class ScheduleStyle {
  const ScheduleStyle({
    required this.type,
    required this.title,
    required this.description,
    required this.example,
  });

  final ScheduleStyleType type;
  final String title;
  final String description;
  final String example;
}
