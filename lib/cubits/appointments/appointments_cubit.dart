import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quadro/cubits/appointments/appointments_state.dart';
import 'package:quadro/firebase/firebase_datasource.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  AppointmentCubit() : super(AppointmentStateLoading()) {
    fetchRequestData();
    print('Hello');
  }
  // List<String> brands = [];
  Future<void> fetchRequestData() async {
    // emit(TowingStateLoading());
    FirebaseDataSource ds = FirebaseDataSource();
    List<String> brands = await ds.getCarBrands();
    List<String> models = await ds.getCarModels(brands[0]);
    emit(AppointmentStateLoaded(
      brands: brands,
      models: models,
      selectedBrand: brands[0],
      selectedModel: models[0],
    ));
  }

  List<String> getCarBrands() {
    FirebaseDataSource ds = FirebaseDataSource();

    ds.getCarBrands().then((brands) {
      return brands;
    }).catchError((error) {
      // Handle error gracefully
    });
    return [];
  }

  void select_a_model(selectedModel) {
    final loaded = state as AppointmentStateLoaded;
    emit(loaded.copyWith(selectedModel: selectedModel));
  }

  Future<void> getCarModels(String brand) async {
    FirebaseDataSource().getCarModels(brand).then((models) {
      final loaded = state as AppointmentStateLoaded;
      emit(loaded.copyWith(
        models: models,
        selectedBrand: brand,
        selectedModel: models[0],
      ));
    }).catchError((error) {
      // Handle error gracefully
    });
  }

  Future<void> createAppoinmentRequest({
    brand,
    model,
    description,
  }) {
    return FirebaseDataSource.createAppointmentRequest(
      brand,
      model,
      description,
    );
  }
  // StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _tasksSub;

  // void changeFilter(FilterBy filterBy) {
  //   if (state is TaskStateLoaded) {
  //     final loaded = state as TaskStateLoaded;
  //     emit(loaded.copyWith(filterBy: filterBy));
  //   }
  // }

  // @override
  // Future<void> close() async {
  //   super.close();
  //   _tasksSub?.cancel();
  // }

  // Future<void> changeTaskState({
  //   required String id,
  //   required bool completed,
  // }) {
  //   return FirebaseDataSource.updateTask(
  //     id,
  //     {
  //       'completed': completed,
  //     },
  //   );
  // }

  // Future<void> fetchTasks() async {
  //   emit(TaskStateLoading());
  //   try {
  //     _tasksSub = FirebaseDataSource.getTasks().listen((event) {
  //       final listOfTasks = event.docs.map(
  //         (doc) {
  //           final taskMap = doc.data();
  //           final taskMapWithId = {
  //             ...taskMap,
  //             'id': doc.id,
  //           };
  //           return Task.fromJson(taskMapWithId);
  //         },
  //       ).toList();

  //       emit(TaskStateLoaded(allTasks: listOfTasks));
  //     });
  //   } on Exception catch (e) {
  //     emit(TaskStateError(error: e));
  //   }
  // }
}
