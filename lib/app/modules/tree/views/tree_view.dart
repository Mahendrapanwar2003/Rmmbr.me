import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tree_controller.dart';

class TreeView extends GetView<TreeController> {
  const TreeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TreeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TreeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
