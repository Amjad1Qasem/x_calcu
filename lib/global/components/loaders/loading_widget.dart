import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            height: MediaQuery.sizeOf(context).height / 1.5,
            child: const Center(child: CircularProgressIndicator())));
  }
}
