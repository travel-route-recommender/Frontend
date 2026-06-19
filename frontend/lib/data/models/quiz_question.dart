class QuizOption {
  const QuizOption({
    required this.id,
    required this.label,
  });

  final String id;
  final String label;
}

class QuizQuestion {
  const QuizQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.category,
  });

  final String id;
  final String question;
  final List<QuizOption> options;
  final String category;
}
