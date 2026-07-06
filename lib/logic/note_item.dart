import 'package:flutter/material.dart';

class DynamicItemModel {
  final TextEditingController nameController;
  final TextEditingController amountController;
  final TextEditingController descriptionController;

  DynamicItemModel({
    String name = '',
    String amount = '',
    String description = '',
  }) : nameController = TextEditingController(text: name),
       amountController = TextEditingController(text: amount),
       descriptionController = TextEditingController(text: description);

  void dispose() {
    nameController.dispose();
    amountController.dispose();
    descriptionController.dispose();
  }
}
