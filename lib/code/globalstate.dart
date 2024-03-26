import 'package:flutter/material.dart';

class GlobalState {
  final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
  final Map<dynamic, dynamic> data = <dynamic, dynamic>{};

  static GlobalState instance = GlobalState._();

  GlobalState._();

  set(key, value) => data[key] = value;
  get(key) => data[key];
}