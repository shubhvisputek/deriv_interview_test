import 'package:deriv_interview_test/model/price_tracker_model.dart';

abstract class PriceTrackerState {}

class InitPriceTrackerState extends PriceTrackerState {}

class LoadingPriceTrackerState extends PriceTrackerState {}

class ErrorPriceTrackerState extends PriceTrackerState {
  final String message;
  ErrorPriceTrackerState(this.message);
}

class ResponsePriceTrackerState extends PriceTrackerState {
  final List<PriceTracker> priceTrackers;
  ResponsePriceTrackerState(this.priceTrackers);
}
