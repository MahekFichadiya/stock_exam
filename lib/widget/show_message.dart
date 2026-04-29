import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowMessage {
  final BuildContext context;
  final String? message;
  ShowMessage({required this.context, this.message});

  void show() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message!), dismissDirection: DismissDirection.startToEnd));
  }
}
