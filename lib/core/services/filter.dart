import 'dart:io';
import 'dart:ui';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:bitmap/bitmap.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as image;
import 'package:path_provider/path_provider.dart';

class FilterService {
  static Future<File> applyFilter(
      File imageSource, Color color, BlendMode blendMode) async {
    ui.Image image = await getUiImage(imageSource);

    final recorder = ui.PictureRecorder();
    var rect = Rect.fromPoints(const Offset(0.0, 0.0),
        Offset(image.width.toDouble(), image.height.toDouble()));
    final canvas = Canvas(recorder, rect);

    Size outputSize = rect.size;
    Paint paint = Paint();

    paint.colorFilter = ColorFilter.mode(color, blendMode);

    //Image
    Size inputSize = Size(image.width.toDouble(), image.height.toDouble());
    final FittedSizes fittedSizes =
        applyBoxFit(BoxFit.contain, inputSize, outputSize);
    final Size sourceSize = fittedSizes.source;
    final Rect sourceRect =
        Alignment.center.inscribe(sourceSize, Offset.zero & inputSize);

    canvas.drawImageRect(image, sourceRect, rect, paint);

    final picture = recorder.endRecording();
    final img = await picture.toImage(image.width, image.height);

    ByteData? byteData =
        await img.toByteData(format: ui.ImageByteFormat.rawUnmodified);
    Bitmap bitmap = Bitmap.fromHeadless(
        image.width, image.height, byteData!.buffer.asUint8List());
    Uint8List headedIntList = bitmap.buildHeaded();

    final tempDir = await getApplicationDocumentsDirectory();
    File file = await File('${tempDir.path}/image.png').create();
    file.writeAsBytesSync(headedIntList);

    return file;
  }

  static Future<ui.Image> getUiImage(File file) async {
    final Uint8List fileUnit8 = file.readAsBytesSync();

    final ByteData assetImageByteData = fileUnit8.buffer.asByteData();

    image.Image? baseSizeImage =
        image.decodeImage(assetImageByteData.buffer.asUint8List());
    image.Image resizeImage = image.copyResize(baseSizeImage as image.Image,
        width: baseSizeImage.width, height: baseSizeImage.height);
    ui.Codec codec =
        await ui.instantiateImageCodec(image.encodePng(resizeImage) as dynamic);
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }
}
