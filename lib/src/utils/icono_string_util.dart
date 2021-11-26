import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Icon getIcon(String iconName) {
  return Icon(_icons[iconName], color: Colors.blue);
}

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open
};
