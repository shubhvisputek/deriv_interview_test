import 'package:deriv_interview_test/price_tracker/cubit/price_tracker_cubit.dart';
import 'package:deriv_interview_test/price_tracker/views/price_tracker_page.dart';
import 'package:deriv_interview_test/repository/price_tracker_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PriceTrackerCubit(PriceTrackerRepository()),
      child: const MaterialApp(
        home: PriceTrackerPage(),
      ),
    );
  }
}
