class TravelType {
  const TravelType({
    required this.name,
    required this.description,
    required this.tags,
    required this.warning,
    required this.emoji,
  });

  final String name;
  final String description;
  final List<String> tags;
  final String warning;
  final String emoji;

  TravelType copyWith({
    String? name,
    String? description,
    List<String>? tags,
    String? warning,
    String? emoji,
  }) {
    return TravelType(
      name: name ?? this.name,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      warning: warning ?? this.warning,
      emoji: emoji ?? this.emoji,
    );
  }
}
