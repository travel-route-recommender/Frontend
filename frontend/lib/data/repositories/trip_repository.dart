import 'package:flutter/foundation.dart';
import 'package:tripmatch/data/mock/mock_trip_data.dart';
import 'package:tripmatch/data/models/itinerary_item.dart';
import 'package:tripmatch/data/models/match_result.dart';
import 'package:tripmatch/data/models/quiz_question.dart';
import 'package:tripmatch/data/models/travel_type.dart';

/// 앱 전역 상태. 추후 Riverpod Provider로 교체하기 쉽도록 ChangeNotifier로 분리.
class TripRepository extends ChangeNotifier {
  TripRepository();

  final Map<String, String> _quizAnswers = {};
  ScheduleStyleType? _selectedScheduleStyle;
  CourseRecommendation? _selectedCourse;
  final List<ItineraryItem> _itinerary = List.from(MockTripData.defaultItinerary);

  List<QuizQuestion> get quizQuestions => MockTripData.quizQuestions;
  TravelType get myTravelType => MockTripData.myTravelType;
  TravelType get partnerTravelType => MockTripData.partnerTravelType;
  MatchResult get matchResult => MockTripData.matchResult;
  AdjustmentPlan get adjustmentPlan => MockTripData.adjustmentPlan;
  List<ScheduleStyle> get scheduleStyles => MockTripData.scheduleStyles;
  List<CourseRecommendation> get courses => MockTripData.courses;
  FinalScheduleSummary get finalSummary => MockTripData.finalSummary;
  String get inviteLink => MockTripData.inviteLink;

  Map<String, String> get quizAnswers => Map.unmodifiable(_quizAnswers);
  ScheduleStyleType? get selectedScheduleStyle => _selectedScheduleStyle;
  CourseRecommendation? get selectedCourse => _selectedCourse;
  List<ItineraryItem> get itinerary => List.unmodifiable(_itinerary);

  void saveQuizAnswer(String questionId, String optionId) {
    _quizAnswers[questionId] = optionId;
    notifyListeners();
  }

  void selectScheduleStyle(ScheduleStyleType type) {
    _selectedScheduleStyle = type;
    notifyListeners();
  }

  void selectCourse(CourseRecommendation course) {
    _selectedCourse = course;
    notifyListeners();
  }

  void updateItineraryOrder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) newIndex -= 1;
    final item = _itinerary.removeAt(oldIndex);
    _itinerary.insert(newIndex, item);
    notifyListeners();
  }

  void updateItineraryPriority(String id, PriorityLevel priority) {
    final index = _itinerary.indexWhere((item) => item.id == id);
    if (index == -1) return;
    _itinerary[index] = _itinerary[index].copyWith(priority: priority);
    notifyListeners();
  }

  void resetQuiz() {
    _quizAnswers.clear();
    notifyListeners();
  }
}
