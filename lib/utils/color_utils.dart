// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
// This function converts a hexadecimal color string to a Color object
hexStringToColor(String hexColor) {
  // Convert the hexadecimal color string to uppercase and remove any '#'
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  // Check if the hexadecimal color string has 6 characters (RGB format)
  if (hexColor.length == 6) {
    // If it has 6 characters, add 'FF' at the beginning (alpha value)
    hexColor = "FF" + hexColor;
  }
  // Parse the hexadecimal color string into an integer and convert it to a Color object
  return Color(int.parse(hexColor, radix: 16));
}
