import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

enum TowingType { tug, pull }

class CarModel {
  final String name;

  CarModel({required this.name});
  factory CarModel.fromFirestore(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return CarModel(
      name: data['name'],
    );
  }
}

class TowingRequestModel {
  TowingRequestModel(
    this.description,
    this.imageFile,
    this.towingType,
    this.model,
  );

  final TowingType towingType;
  final CarModel model;
  final String description;
  final File imageFile;
}
