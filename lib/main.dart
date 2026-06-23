import 'package:flutter/material.dart';
import 'package:tripmatch/app.dart';
import 'package:tripmatch/data/repositories/trip_repository.dart';

void main() {
  final tripRepository = TripRepository();
  runApp(TripMatchApp(tripRepository: tripRepository));
}
