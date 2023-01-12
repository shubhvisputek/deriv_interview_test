import 'package:deriv_interview_test/price_tracker/cubit/price_tracker_cubit.dart';
import 'package:deriv_interview_test/price_tracker/cubit/price_tracker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceTrackerPage extends StatefulWidget {
  const PriceTrackerPage({super.key});

  @override
  State<PriceTrackerPage> createState() => _PriceTrackerState();
}

class _PriceTrackerState extends State<PriceTrackerPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<PriceTrackerCubit>();
      cubit.fetchPriceTracker();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Price Tracker"),
      ),
      body: BlocBuilder<PriceTrackerCubit, PriceTrackerState>(
        builder: (context, state) {
          if (state is InitPriceTrackerState ||
              state is LoadingPriceTrackerState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ResponsePriceTrackerState) {
            final priceTrackers = state.priceTrackers;
            return ListView.builder(
              itemCount: priceTrackers.length,
              itemBuilder: (context, index) {
                final priceTracker = priceTrackers[index];
                return ListTile(
                  title: Text(priceTracker.title),
                );
              },
            );
          } else if (state is ErrorPriceTrackerState) {
            return Text(state.message);
          }
          return Text(state.toString());
        },
      ),
    );
  }
}
