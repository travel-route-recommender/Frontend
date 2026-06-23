import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripmatch/data/repositories/trip_repository.dart';
import 'package:tripmatch/features/adjustment/screens/adjustment_screen.dart';
import 'package:tripmatch/features/adjustment/screens/schedule_style_screen.dart';
import 'package:tripmatch/features/auth/screens/login_screen.dart';
import 'package:tripmatch/features/auth/screens/sign_up_screen.dart';
import 'package:tripmatch/features/course/screens/course_recommendation_screen.dart';
import 'package:tripmatch/features/home/screens/browse_trips_screen.dart';
import 'package:tripmatch/features/home/screens/home_screen.dart';
import 'package:tripmatch/features/home/screens/ongoing_trip_detail_screen.dart';
import 'package:tripmatch/features/home/screens/ongoing_trips_screen.dart';
import 'package:tripmatch/features/matching/screens/companion_invite_screen.dart';
import 'package:tripmatch/features/matching/screens/invite_screen.dart';
import 'package:tripmatch/features/matching/screens/match_result_screen.dart';
import 'package:tripmatch/features/onboarding/screens/onboarding_screen.dart';
import 'package:tripmatch/features/onboarding/screens/starting_screen.dart';
import 'package:tripmatch/features/profile/screens/my_page_screen.dart';
import 'package:tripmatch/features/quiz/screens/quiz_screen.dart';
import 'package:tripmatch/features/result/screens/travel_type_result_screen.dart';
import 'package:tripmatch/features/schedule/screens/editable_schedule_screen.dart';
import 'package:tripmatch/features/schedule/screens/final_schedule_screen.dart';

abstract final class AppRoutes {
  static const String onboarding = '/';
  static const String starting = '/starting';
  static const String companionInvite = '/companion-invite';
  static const String home = '/home';
  static const String login = '/login';
  static const String signUp = '/sign-up';
  static const String ongoingTrips = '/ongoing-trips';
  static const String browseTrips = '/browse-trips';
  static const String myPage = '/my-page';
  static const String quiz = '/quiz';
  static const String travelTypeResult = '/travel-type-result';
  static const String invite = '/invite';
  static const String matchResult = '/match-result';
  static const String adjustment = '/adjustment';
  static const String scheduleStyle = '/schedule-style';
  static const String courses = '/courses';
  static const String editSchedule = '/edit-schedule';
  static const String finalSchedule = '/final-schedule';

  static String ongoingTripDetail(String id) => '/ongoing-trips/$id';
}

class AppRouter {
  AppRouter({required this.tripRepository});

  final TripRepository tripRepository;

  late final GoRouter router = GoRouter(
    initialLocation: AppRoutes.onboarding,
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.starting,
        builder: (context, state) => const StartingScreen(),
      ),
      GoRoute(
        path: AppRoutes.companionInvite,
        builder: (context, state) =>
            CompanionInviteScreen(repository: tripRepository),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => HomeScreen(repository: tripRepository),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) {
          final redirectTo = state.uri.queryParameters['redirect'];
          return LoginScreen(
            repository: tripRepository,
            redirectTo: redirectTo,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (context, state) =>
            SignUpScreen(repository: tripRepository),
      ),
      GoRoute(
        path: AppRoutes.ongoingTrips,
        builder: (context, state) =>
            OngoingTripsScreen(repository: tripRepository),
      ),
      GoRoute(
        path: '/ongoing-trips/:id',
        builder: (context, state) {
          final tripId = state.pathParameters['id']!;
          return OngoingTripDetailScreen(
            repository: tripRepository,
            tripId: tripId,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.browseTrips,
        builder: (context, state) => const BrowseTripsScreen(),
      ),
      GoRoute(
        path: AppRoutes.myPage,
        builder: (context, state) => MyPageScreen(repository: tripRepository),
      ),
      GoRoute(
        path: AppRoutes.quiz,
        builder: (context, state) => QuizScreen(repository: tripRepository),
      ),
      GoRoute(
        path: AppRoutes.travelTypeResult,
        builder: (context, state) =>
            TravelTypeResultScreen(repository: tripRepository),
      ),
      GoRoute(
        path: AppRoutes.invite,
        builder: (context, state) => InviteScreen(repository: tripRepository),
      ),
      GoRoute(
        path: AppRoutes.matchResult,
        builder: (context, state) =>
            MatchResultScreen(repository: tripRepository),
      ),
      GoRoute(
        path: AppRoutes.adjustment,
        builder: (context, state) =>
            AdjustmentScreen(repository: tripRepository),
      ),
      GoRoute(
        path: AppRoutes.scheduleStyle,
        builder: (context, state) =>
            ScheduleStyleScreen(repository: tripRepository),
      ),
      GoRoute(
        path: AppRoutes.courses,
        builder: (context, state) =>
            CourseRecommendationScreen(repository: tripRepository),
      ),
      GoRoute(
        path: AppRoutes.editSchedule,
        builder: (context, state) =>
            EditableScheduleScreen(repository: tripRepository),
      ),
      GoRoute(
        path: AppRoutes.finalSchedule,
        builder: (context, state) =>
            FinalScheduleScreen(repository: tripRepository),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('페이지를 찾을 수 없습니다: ${state.uri}'),
      ),
    ),
  );
}
