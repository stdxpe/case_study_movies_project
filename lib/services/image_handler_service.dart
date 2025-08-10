import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

class ImageHandlerService {
  final ImagePicker _picker = ImagePicker();

  Future<String?> pickImageFromGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        return pickedFile.path;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<File> resizeAndCompressImage(String path) async {
    final file = File(path);
    final bytes = await file.readAsBytes();
    final image = img.decodeImage(bytes);
    if (image == null) throw Exception('Cannot decode image');
    final resized = img.copyResize(image, width: 240);
    final jpg = img.encodeJpg(resized, quality: 60);
    final tempDir = Directory.systemTemp;
    final compressedFile = await File(
      '${tempDir.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.jpg',
    ).writeAsBytes(jpg);
    return compressedFile;
  }
}
