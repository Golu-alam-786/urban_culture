import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:urban_culture/controller/skin_care_controller.dart';
import 'package:urban_culture/views/screens/daily_routine/widgets/image_picker_dialog.dart';
import 'package:urban_culture/views/screens/daily_routine/widgets/routine_list_tile.dart';
import 'package:urban_culture/views/utils/constants/app_colors.dart';
import 'package:urban_culture/views/utils/customs_widgets/nav_bar_widget.dart';

class RoutineScreen extends StatelessWidget {
  RoutineScreen({super.key});

  final SkinCareController _controller = Get.put(SkinCareController());
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source, String docId, bool isChecked) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      _controller.setImageLoading(docId, true);
      String imageUrl = await _uploadImage(File(image.path));
      _controller.setImageLoading(docId, false);
      await _controller.updateDailySkinRoutine(
        id: docId,
        time: DateTime.now().toString(),
        image: imageUrl,
        isChecked: isChecked,
      );
    }
  }

  Future<String> _uploadImage(File imageFile) async {
    try {
      String fileName = '${DateTime.now().millisecondsSinceEpoch}_${imageFile.uri.pathSegments.last}';
      Reference storageReference = FirebaseStorage.instance.ref().child('images/$fileName');
      UploadTask uploadTask = storageReference.putFile(imageFile);

      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        double progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
        print('Upload is $progress% complete');
      });

      String downloadURL = await (await uploadTask).ref.getDownloadURL();
      print('Download URL: $downloadURL');
      return downloadURL;
    } catch (e) {
      print('Error uploading image: $e');
      return '';
    }
  }

  void _showImageSourceDialog(BuildContext context, String docId, bool isChecked) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ImagePickerDialog(
          onCameraTap: () {
            Navigator.of(context).pop();
            _pickImage(ImageSource.camera, docId, isChecked);
          },
          onGalleryTap: () {
            Navigator.of(context).pop();
            _pickImage(ImageSource.gallery, docId, isChecked);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenColor,
      appBar: NavbarWidget(title: "Daily Skincare"),
      body: Obx(() {
        if (_controller.skinCareItems.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: _controller.skinCareItems.map((doc) {
            bool loading = _controller.imageLoading[doc.id] ?? false;

            return RoutineListTile(
              title: doc.get('title') as String? ?? 'No Title',
              subTitle: doc.get('subTitle') as String? ?? 'No Subtitle',
              imageUrl: doc.get('image') as String? ?? '',
              time: DateTime.tryParse(doc.get('time') as String) ?? DateTime.now(),
              isChecked: doc.get('isChecked') as bool? ?? false,
              loading: loading,
              onCheckboxChanged: (bool? value) async {
                if (value != null) {
                  await _controller.updateDailySkinRoutine(
                    id: doc.id,
                    time: DateTime.now().toString(),
                    image: doc.get('image') as String? ?? '',
                    isChecked: value,
                  );
                }
              },
              onImageTap: () => _showImageSourceDialog(context, doc.id, doc.get('isChecked') as bool),
            );
          }).toList(),
        );
      }),
    );
  }
}
