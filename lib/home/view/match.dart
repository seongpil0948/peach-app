import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '홈스크린 입니다',
          ),
          GoNextScreen(),
          MaxGap(8),
        ],
      ),
    );
  }
}

class GoNextScreen extends StatelessWidget {
  const GoNextScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.go('/next');
        },
        child: const Text(
          '다음 화면으로 이동',
        ));
  }
}
