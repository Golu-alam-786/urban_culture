import 'dart:convert';

DailyRoutineModel dailyRoutineModelFromJson(String str) => DailyRoutineModel.fromJson(json.decode(str));

String dailyRoutineModelToJson(DailyRoutineModel data) => json.encode(data.toJson());

class DailyRoutineModel {
  bool? isChecked;
  String? title;
  String? subTitle;
  List<String>? image;
  String? time;

  DailyRoutineModel({
    this.isChecked,
    this.title,
    this.subTitle,
    this.image,
    this.time,
  });

  factory DailyRoutineModel.fromJson(Map<String, dynamic> json) => DailyRoutineModel(
    isChecked: json["isChecked"],
    title: json["title"],
    subTitle: json["subTitle"],
    image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "isChecked": isChecked,
    "title": title,
    "subTitle": subTitle,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
    "time": time,
  };
}
