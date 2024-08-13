import 'package:flutter/material.dart';
import '../../../utils/constants/app_image.dart';

class ImageDisplay extends StatelessWidget {
  final String imageUrl;
  final bool loading;
  final VoidCallback onTap;

  const ImageDisplay({
    Key? key,
    required this.imageUrl,
    required this.loading,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: loading
          ? CircularProgressIndicator()
          : imageUrl.isNotEmpty
          ? Container(
        width: 60,
        height: 60,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: progress.expectedTotalBytes != null
                            ? progress.cumulativeBytesLoaded / (progress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      )
          : Image.asset(
        AppImage.cameraImage,
        width: 27,
        height: 27,
      ),
    );
  }
}
