import 'package:flutter/material.dart';

import 'image_picker_bottom_sheet.dart';

Future<void> imagePickerModalSheet(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
    ),
    builder: (ctx) => ImagePickerBottomSheet(),
  );
}
