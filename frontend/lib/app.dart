import 'package:flutter/material.dart';
import 'package:tripmatch/core/router/app_router.dart';
import 'package:tripmatch/core/theme/app_theme.dart';
import 'package:tripmatch/data/repositories/trip_repository.dart';

class TripMatchApp extends StatelessWidget {
  const TripMatchApp({super.key, required this.tripRepository});

  final TripRepository tripRepository;

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(tripRepository: tripRepository);

    return MaterialApp.router(
      title: 'TripMatch',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: appRouter.router,
    );
  }
}
