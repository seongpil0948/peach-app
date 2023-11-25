import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peach_app/home/bloc/home_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('홈 스크린'),
      ),
      body: child,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/next');
        },
        tooltip: 'Go Next',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const HomeNavBar(key: Key('home_nav_bar')),
    );
  }
}

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, int>(
      selector: (state) {
        return state.selectedPageIndex;
      },
      builder: (context, selectedPageIndex) {
        return NavigationBar(
          onDestinationSelected: (int index) {
            context.read<HomeBloc>().add(SelectPageIndex(index));
          },
          indicatorColor: Colors.amber,
          selectedIndex: selectedPageIndex,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          backgroundColor: Theme.of(context).colorScheme.surface,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Badge(child: Icon(Icons.notifications_sharp)),
              label: 'Notifications',
            ),
            NavigationDestination(
              icon: Badge(
                label: Text('2'),
                child: Icon(Icons.messenger_sharp),
              ),
              label: 'Messages',
            ),
          ],
        );
      },
    );
  }
}
