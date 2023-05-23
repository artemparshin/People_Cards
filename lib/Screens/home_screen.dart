import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:people_cards_test/Icons/sort_icons.dart';
import 'package:people_cards_test/Widgets/user_card.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import '../Blocs/cubit/screen_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScreenStateCubit(),
      child: Builder(builder: (context) {
        var bloc = context.read<ScreenStateCubit>();
        return Scaffold(
            appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        bloc.sortByAge();
                      },
                      icon: const Icon(
                        SortIcons.sort_numeric_down,
                        color: Colors.black,
                      )),
                  IconButton(
                      onPressed: () {
                        bloc.sortByName();
                      },
                      icon: const Icon(
                        SortIcons.sort_alpha_down,
                        color: Colors.black,
                      ))
                ],
                centerTitle: false,
                backgroundColor: Color(0xFFF2DDDD),
                title: const Text(
                  "User List",
                  style: TextStyle(color: Color(0xFF000000)),
                )),
            body: BlocBuilder<ScreenStateCubit, ScreenState>(
              bloc: context.read<ScreenStateCubit>(),
              builder: (context, state) {
                if (bloc.state is ScreenStateIsLoaded) {
                  var users = (bloc.state as ScreenStateIsLoaded).users;
                  var cards = users
                      .map((user) => UserCard(
                          key: ValueKey(user.photo.photoUrl), user: user))
                      .toList();
                  return ReorderableGridView.count(
                    padding: EdgeInsets.all(20.0),
                    dragWidgetBuilder: (index, _) => cards[index],
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    onReorder: (oldIndex, newIndex) {
                      bloc.dragByTap(oldIndex, newIndex);
                    },
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    children: cards,
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ));
      }),
    );
  }
}
