import 'package:flutter/material.dart';

import '../../../widgets/mainlayout/main_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(body: Text('data'));
  }
}
