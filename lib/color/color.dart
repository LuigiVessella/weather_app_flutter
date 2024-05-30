import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//qui non serve l'annotazione @riverpod in e nemmeno part in quanto andiamo manualmente a 
//definire il tipo di provider che vogliamo esporre

final colorProvider = StateProvider<Color>((ref) {
  return Colors.black;
});