import 'package:best_architecture_challenge/infrastructure/injectable.dart';
import 'package:best_architecture_challenge/presentation/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();

  runApp(MyApp());
}
