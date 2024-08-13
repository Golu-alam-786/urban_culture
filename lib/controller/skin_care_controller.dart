import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SkinCareController extends GetxController {
  var skinCareItems = <QueryDocumentSnapshot>[].obs;
  var imageLoading = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSkinCareItems();
  }

  void fetchSkinCareItems() {
    FirebaseFirestore.instance.collection("Urban_SkinCare").snapshots().listen((snapshot) {
      skinCareItems.value = snapshot.docs;
    });
  }

  Future<void> updateDailySkinRoutine({
    required String id,
    required String time,
    required String image,
    required bool isChecked,
  }) async {
    try {
      await FirebaseFirestore.instance.collection("Urban_SkinCare").doc(id).update({
        "image": image,
        "isChecked": isChecked,
        "time": time,
      });
    } catch (e) {
      print("Error updating skin routine: $e");
    }
  }

  void setImageLoading(String docId, bool loading) {
    imageLoading[docId] = loading;
  }
}
