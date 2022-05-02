import 'dart:io';
import 'package:flutter/material.dart';

class UploadProgress extends StatefulWidget {
  final File file;
  const UploadProgress({Key? key, required this.file}) : super(key: key);

  @override
  State<UploadProgress> createState() => _UploadProgressState();
}

class _UploadProgressState extends State<UploadProgress> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Padding(
          child: ListTile(
            dense: true,
            leading: ClipRRect(
              child: Image.file(
                widget.file,
                width: 40,
                height: 40,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            title: Text('Uploading', style: TextStyle(color: Colors.white)),
            subtitle: LinearProgressIndicator(
              value: 0.5,
              color: Colors.amber[600],
              backgroundColor: Colors.grey[800],
            ),
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: -4),
          ),
          padding: EdgeInsets.only(bottom: 5)),
    );
  }
}
