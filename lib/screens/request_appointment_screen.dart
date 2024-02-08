import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadro/cubits/appointments/appointments_cubit.dart';
import 'package:quadro/cubits/appointments/appointments_state.dart';
import 'package:quadro/cubits/towing_request/towing_cubit.dart';
import 'package:quadro/cubits/towing_request/towing_state.dart';
import 'package:quadro/screens/request_appoinment_form.dart';
import 'package:quadro/screens/request_towing_form.dart';

class RequestAppointmentScreen extends StatelessWidget {
  const RequestAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppointmentCubit>().state;
    return Scaffold(
      body: Center(
        child: switch (state) {
          AppointmentStateLoaded() => RequestAppointmentForm(state: state),
          AppointmentStateLoading() => const CircularProgressIndicator(),
          // TaskStateError(error: final error) => Text(error.toString()),

          AppointmentState() => null,
        },
      ),
    );
  }
}
