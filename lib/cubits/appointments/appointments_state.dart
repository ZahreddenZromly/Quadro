// class TowingState{}
sealed class AppointmentState {
  // get getBrands => null;
}

class AppointmentStateLoading extends AppointmentState {}

class AppointmentStateLoaded extends AppointmentState {
  late final List<String>? brands;
  late final List<String>? models;
  late final String? selectedBrand;
  late final String? selectedModel;
  AppointmentStateLoaded({
    this.brands,
    this.models,
    this.selectedBrand,
    this.selectedModel,
  });

  AppointmentStateLoaded copyWith({
    List<String>? brands,
    List<String>? models,
    String? selectedBrand,
    String? selectedModel,
  }) {
    return AppointmentStateLoaded(
      brands: brands ?? this.brands,
      models: models ?? this.models,
      selectedBrand: selectedBrand ?? this.selectedBrand,
      selectedModel: selectedModel ?? this.selectedModel,
    );
  }
}
