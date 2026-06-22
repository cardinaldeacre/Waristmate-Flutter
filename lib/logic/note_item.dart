import 'package:flutter/material.dart';

class DynamicItemModel {
  final TextEditingController nameController;
  final TextEditingController amountController;

  DynamicItemModel({String name = '', String amount = ''})
    : nameController = TextEditingController(text: name),
      amountController = TextEditingController(text: amount);

  void dispose() {
    nameController.dispose();
    amountController.dispose();
  }
}
