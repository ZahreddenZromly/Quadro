import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseDataSource {
  static FirebaseFirestore db = FirebaseFirestore.instance;
  // final storageRef = FirebaseStorage.instance.ref();
  // FirebaseStorage storage = FirebaseStorage.instance;

  Future<List<String>> getCarBrands() async {
    try {
      print('You are heeeere ');
      final brandsSnapshot = await db.collection('Car Brands').get();
      print('You are heeeere ');
      return brandsSnapshot.docs.map((doc) => doc['name'] as String).toList();
    } catch (error) {
      // Handle errors gracefully (e.g., display an error message)
    }
    return [];
  }

  Future<List<String>> getCarModels(String brand) async {
    try {
      final modelsSnapshot = await db
          .collection('Car Brands')
          .doc(brand)
          .collection('models')
          .get();
      print('You are heeeere ');
      return modelsSnapshot.docs.map((doc) => doc['name'] as String).toList();
    } catch (error) {
      // Handle errors gracefully (e.g., display an error message)
    }
    return [];
  }

  // static Stream<QuerySnapshot<Map<String, dynamic>>> getTasks() {
  //   final Stream<QuerySnapshot<Map<String, dynamic>>> stream =
  //       db.collection('tasks').snapshots();

  //   return stream;
  // }

  /// task map should not contain the id
  // static Future<void> updateTask(
  //   String taskId,
  //   Map<String, dynamic> taskMap,
  // ) {
  //   return db.collection('tasks').doc(taskId).update(taskMap);
  // }
  static Future<void> createTowingRequest(
    String towingType,
    String model,
    String description,
  ) {
    print('$towingType' + description + model);
    return db.collection('towings').add({
      'type': towingType,
      'car_model': model,
      'description': description,
    });
  }

  static Future<void> createAppointmentRequest(
    // String towingType,
    String brand,
    String model,
    String description,
  ) {
    print(brand + description + model);
    return db.collection('appointment_requests').add({
      'brand': brand,
      'car_model': model,
      'description': description,
    });
  }
}
