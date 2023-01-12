import 'package:deriv_interview_test/price_tracker/cubit/price_tracker_state.dart';
import 'package:deriv_interview_test/repository/price_tracker_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceTrackerCubit extends Cubit<PriceTrackerState> {
  final PriceTrackerRepository _repository;
  PriceTrackerCubit(this._repository) : super(InitPriceTrackerState());

  Future<void> fetchPriceTracker() async {
    emit(LoadingPriceTrackerState());
    try {
      final response = await _repository.getAll();
      emit(ResponsePriceTrackerState(response));
    } catch (e) {
      emit(ErrorPriceTrackerState(e.toString()));
    }
  }
}
