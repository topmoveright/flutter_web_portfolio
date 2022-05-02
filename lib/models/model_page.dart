import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModelPage {
  final String subject;
  final String route;
  final Widget page;
  final Bindings? bindings;

  const ModelPage({
    required this.subject,
    required this.route,
    required this.page,
    this.bindings,
  });
}
