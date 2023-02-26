import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateNewEventController extends ChangeNotifier {}

final createNewEventControllerProvider = ChangeNotifierProvider(
  (ref) {
    return CreateNewEventController();
  },
);
