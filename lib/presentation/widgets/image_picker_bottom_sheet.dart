import 'package:flutter/material.dart';
import 'package:food_app/constants/pallete.dart';

import 'custom_card.dart';
import 'custom_outlined_button.dart';

enum PhotoSource {
  camera,
  gallery,
}

class ImagePickerBottomSheet extends StatefulWidget {
  const ImagePickerBottomSheet({Key? key}) : super(key: key);

  @override
  _ImagePickerBottomSheetState createState() => _ImagePickerBottomSheetState();
}

class _ImagePickerBottomSheetState extends State<ImagePickerBottomSheet> {
  PhotoSource? photoSource;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(20),
      height: 350,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCard(
                      backgroundColor: photoSource == PhotoSource.camera
                          ? Palette.primary
                          : null,
                      onTap: () {
                        setState(() {
                          photoSource = PhotoSource.camera;
                        });
                      },
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: 50,
                          color: photoSource == PhotoSource.camera
                              ? Colors.white
                              : Palette.primary,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Take a Picture',
                          style: TextStyle(
                            fontSize: 20,
                            color: photoSource == PhotoSource.camera
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    CustomCard(
                      backgroundColor: photoSource == PhotoSource.gallery
                          ? Palette.primary
                          : null,
                      onTap: () {
                        setState(() {
                          photoSource = PhotoSource.gallery;
                        });
                      },
                      children: [
                        Icon(
                          Icons.apps_sharp,
                          size: 50,
                          color: photoSource == PhotoSource.gallery
                              ? Colors.white
                              : Palette.primary,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'From Gallery',
                          style: TextStyle(
                            fontSize: 20,
                            color: photoSource == PhotoSource.gallery
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomOutlinedButton(
              primaryColor: Palette.primary,
              borderColor: Palette.primary,
              text: 'Cancel',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
