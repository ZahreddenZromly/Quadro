// class TowingState{}
sealed class TowingState {
  // get getBrands => null;
}

class TowingStateLoading extends TowingState {}

class TowingStateLoaded extends TowingState {
  late final List<String>? brands;
  late final List<String>? models;
  late final String? selectedBrand;
  late final String? selectedModel;
  late final String? type;
  // List<String> get getbrands => this.brands;
  TowingStateLoaded({
    this.brands,
    this.models,
    this.selectedBrand,
    this.selectedModel,
    this.type,
  });

  TowingStateLoaded copyWith({
    List<String>? brands,
    List<String>? models,
    String? selectedBrand,
    String? selectedModel,
    String? type,
  }) {
    return TowingStateLoaded(
      brands: brands ?? this.brands,
      models: models ?? this.models,
      selectedBrand: selectedBrand ?? this.selectedBrand,
      selectedModel: selectedModel ?? this.selectedModel,
      type: type ?? this.type,
    );
  }
}

// enum FilterBy {
//   completed,
//   uncompleted,
//   all,
// }

// class TowingStateLoaded extends TowingState {
//   final List<TowingRequestModel> allTowings;
//   // late final List<Task> completed;
//   // late final List<Task> uncompleted;
//   // final FilterBy filterBy;

//   TowingStateLoaded({required this.allTowings});
//   // {
//   //   completed = allTasks.where((task) => task.completed).toList();
//   //   uncompleted = allTasks.where((task) => !task.completed).toList();
//   // }

//   // List<Task> getViewList() => switch (filterBy) {
//   //       FilterBy.completed => completed,
//   //       FilterBy.uncompleted => uncompleted,
//   //       FilterBy.all => allTasks,
//   //     };

//   TowingStateLoaded copyWith({
//     List<TowingRequestModel>? allTowings,
//     // FilterBy? filterBy,
//   }) {
//     return TowingStateLoaded(
//       allTowings: allTowings ?? this.allTowings,
//       // filterBy: filterBy ?? this.filterBy,
//     );
//   }
// }

class TowingStateError extends TowingState {
  // final Object error;

  // TowingStateError({required this.error});
}
