import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class UploadProgress extends StatefulWidget {
  final File? file;
  final Widget? leading;
  const UploadProgress({Key? key, this.file, this.leading}) : super(key: key);

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
            leading: widget.leading,
            title:
                const Text('Uploading', style: TextStyle(color: Colors.white)),
            subtitle: LinearProgressIndicator(
              value: 0.5,
              color: Colors.amber[600],
              backgroundColor: Colors.grey[800],
            ),
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0.0, vertical: -4),
          ),
          padding: const EdgeInsets.only(bottom: 5)),
    );
  }
}
