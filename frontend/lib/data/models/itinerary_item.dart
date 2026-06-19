enum PriorityLevel { must, optional, skip }

class ItineraryItem {
  const ItineraryItem({
    required this.id,
    required this.placeName,
    required this.startTime,
    required this.endTime,
    required this.tags,
    required this.reason,
    this.priority = PriorityLevel.optional,
    this.day = 1,
  });

  final String id;
  final String placeName;
  final String startTime;
  final String endTime;
  final List<String> tags;
  final String reason;
  final PriorityLevel priority;
  final int day;

  ItineraryItem copyWith({
    String? id,
    String? placeName,
    String? startTime,
    String? endTime,
    List<String>? tags,
    String? reason,
    PriorityLevel? priority,
    int? day,
  }) {
    return ItineraryItem(
      id: id ?? this.id,
      placeName: placeName ?? this.placeName,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      tags: tags ?? this.tags,
      reason: reason ?? this.reason,
      priority: priority ?? this.priority,
      day: day ?? this.day,
    );
  }
}

class CourseRecommendation {
  const CourseRecommendation({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.places,
    required this.tags,
    required this.compatibilityScore,
    required this.isRecommended,
  });

  final String id;
  final String title;
  final String subtitle;
  final List<String> places;
  final List<String> tags;
  final int compatibilityScore;
  final bool isRecommended;
}

class FinalScheduleSummary {
  const FinalScheduleSummary({
    required this.title,
    required this.description,
    required this.preferences,
    required this.dayPlans,
  });

  final String title;
  final String description;
  final Map<String, int> preferences;
  final Map<String, String> dayPlans;
}
