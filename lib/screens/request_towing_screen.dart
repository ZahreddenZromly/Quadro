import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadro/cubits/towing_request/towing_cubit.dart';
import 'package:quadro/cubits/towing_request/towing_state.dart';
import 'package:quadro/screens/request_towing_form.dart';

class RequestTowingScreen extends StatelessWidget {
  const RequestTowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TowingCubit>().state;
    return Scaffold(
      body: Center(
        child: switch (state) {
          TowingStateLoaded() => RequestTowingForm(state: state),
          TowingStateLoading() => const CircularProgressIndicator(),
          // TaskStateError(error: final error) => Text(error.toString()),

          TowingState() => null,
        },
      ),
    );
  }
}
