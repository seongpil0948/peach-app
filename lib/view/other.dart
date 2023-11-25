import 'package:flutter/material.dart';

class NextView extends StatelessWidget {
  const NextView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('넥스트 스크린'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '넥스트 입니다',
            ),
          ],
        ),
      ),
    );
  }
}
