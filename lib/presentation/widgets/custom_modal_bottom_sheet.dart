import 'package:flutter/material.dart';
import 'package:food_app/presentation/widgets/loading_bottom_sheet.dart';

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

Future<void> loadingModalSheet(BuildContext context) async {
  await showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    context: context,
    builder: (ctx) => const LoadingBottomSheet(),
  );
}
