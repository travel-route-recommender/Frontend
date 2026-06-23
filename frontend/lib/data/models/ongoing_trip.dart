class OngoingTrip {
  const OngoingTrip({
    required this.id,
    required this.title,
    required this.destination,
    required this.status,
    required this.progressLabel,
    required this.lastUpdated,
    required this.summary,
    required this.currentStep,
  });

  final String id;
  final String title;
  final String destination;
  final String status;
  final String progressLabel;
  final String lastUpdated;
  final String summary;
  final int currentStep;
}
