import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickerProvider extends ChangeNotifier {
  XFile? imageFile;
  String? imageFilePath;
  void setImageFile(XFile? value) {
    imageFile = value;
    notifyListeners();
  }

  void setImagePath(String path) {
    imageFilePath = path;
    notifyListeners();
  }
}
