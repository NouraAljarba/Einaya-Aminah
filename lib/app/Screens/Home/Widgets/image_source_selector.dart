import 'package:flutter/material.dart';

void imagePickerModal(BuildContext context,
    {VoidCallback? onCameraTap, VoidCallback? onGalleryTap}) {
  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 220,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            
          ),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.black),
                title: const Text("Camera",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: onCameraTap,
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.photo_library, color: Colors.black),
                title: const Text("Gallery",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: onGalleryTap,
              ),
            ],
          ),
        );
      });
}
