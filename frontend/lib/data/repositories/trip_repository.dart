import 'package:flutter/foundation.dart';
import 'package:tripmatch/data/mock/mock_trip_data.dart';
import 'package:tripmatch/data/models/itinerary_item.dart';
import 'package:tripmatch/data/models/match_result.dart';
import 'package:tripmatch/data/models/ongoing_trip.dart';
import 'package:tripmatch/data/models/quiz_question.dart';
import 'package:tripmatch/data/models/travel_type.dart';

/// 앱 전역 상태. 추후 Riverpod Provider로 교체하기 쉽도록 ChangeNotifier로 분리.
class TripRepository extends ChangeNotifier {
  TripRepository();

  final Map<String, String> _quizAnswers = {};
  ScheduleStyleType? _selectedScheduleStyle;
  CourseRecommendation? _selectedCourse;
  final List<ItineraryItem> _itinerary = List.from(MockTripData.defaultItinerary);

  bool _isLoggedIn = false;
  String _userName = '게스트';
  String _userEmail = '';
  bool _companionInvited = false;
  String? _companionInviteInput;

  List<QuizQuestion> get quizQuestions => MockTripData.quizQuestions;
  TravelType get myTravelType => MockTripData.myTravelType;
  TravelType get partnerTravelType => MockTripData.partnerTravelType;
  MatchResult get matchResult => MockTripData.matchResult;
  AdjustmentPlan get adjustmentPlan => MockTripData.adjustmentPlan;
  List<ScheduleStyle> get scheduleStyles => MockTripData.scheduleStyles;
  List<CourseRecommendation> get courses => MockTripData.courses;
  FinalScheduleSummary get finalSummary => MockTripData.finalSummary;
  String get inviteLink => MockTripData.inviteLink;

  bool get isLoggedIn => _isLoggedIn;
  String get userName => _userName;
  String get userEmail => _userEmail;
  bool get companionInvited => _companionInvited;
  String? get companionInviteInput => _companionInviteInput;
  List<OngoingTrip> get ongoingTrips => MockTripData.ongoingTrips;

  Map<String, String> get quizAnswers => Map.unmodifiable(_quizAnswers);
  ScheduleStyleType? get selectedScheduleStyle => _selectedScheduleStyle;
  CourseRecommendation? get selectedCourse => _selectedCourse;
  List<ItineraryItem> get itinerary => List.unmodifiable(_itinerary);

  OngoingTrip? getOngoingTrip(String id) {
    for (final trip in ongoingTrips) {
      if (trip.id == id) return trip;
    }
    return null;
  }

  void login(String email, String password) {
    _isLoggedIn = true;
    _userEmail = email.isEmpty ? 'demo@tripmatch.com' : email;
    _userName = _userEmail.split('@').first;
    notifyListeners();
  }

  void signUp({
    required String name,
    required String email,
    required String password,
  }) {
    _isLoggedIn = true;
    _userEmail = email.isEmpty ? 'demo@tripmatch.com' : email;
    _userName = name.isEmpty ? _userEmail.split('@').first : name;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _userName = '게스트';
    _userEmail = '';
    notifyListeners();
  }

  void setCompanionInvite(String input) {
    _companionInvited = true;
    _companionInviteInput = input;
    notifyListeners();
  }

  void skipCompanionInvite() {
    _companionInvited = false;
    _companionInviteInput = null;
    notifyListeners();
  }

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
