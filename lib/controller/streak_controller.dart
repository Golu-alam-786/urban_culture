import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class StreakController extends GetxController {
  RxInt streakDays = 0.obs;
  RxInt dailyStreak = 0.obs;
  RxList<FlSpot> graphData =<FlSpot>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchStreakData();
  }

  Future<void> fetchStreakData() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    QuerySnapshot snapshot = await _firestore.collection('Urban_SkinCare').get();

    int tempStreakDays = 0;
    int tempDailyStreak = 0;
    List<FlSpot> tempGraphData = [];

    int dayIndex = 0;

    for (var doc in snapshot.docs) {
      int streakCount = 0;
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      data.forEach((key, value) {
        if (value == true) {
          streakCount += 1;
        }
      });

      if (streakCount > 0) {
        tempStreakDays += 1;
      }

      tempDailyStreak = streakCount;
      tempGraphData.add(FlSpot(dayIndex.toDouble(), streakCount.toDouble()));
      dayIndex++;
    }

    streakDays.value = tempStreakDays;
    dailyStreak.value = tempDailyStreak;
    graphData.assignAll(tempGraphData);

  }
}
