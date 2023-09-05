import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/presentation/viewModel/viewModel.dart';
import 'package:test_app/presentation/widget/animation_duration_widget.dart';

import 'widget/button_widget.dart';
import 'widget/circle_widget.dart';

part 'widget/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: const HomeBody(),
    );
  }
}
