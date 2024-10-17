
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<File ?>pickImageFromGallery(BuildContext context)async{
  File? image;
  try{
    final pickedImage=await ImagePicker().pickImage(source: ImageSource.gallery);

    if(pickedImage != null){
      image=File(pickedImage.path);
    }
  }
  catch(e){
    throw Exception(e);
  }
  return image;
}

  int getCurrentTimeInMillis() {
int currentTimeMillis = DateTime.now().millisecondsSinceEpoch;

// Convert to string
String currentTimeStr = currentTimeMillis.toString();

// Get the last 8 digits
String last8Digits = currentTimeStr.substring(currentTimeStr.length - 8);

return int.parse(last8Digits);

}