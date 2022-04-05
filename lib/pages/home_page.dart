import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generic_restaurant_app/bloc/restaurant_bloc/restaurant_bloc.dart';
import 'package:generic_restaurant_app/pages/loading_page.dart';
import 'package:generic_restaurant_app/widgets/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoadedState) {
          return HomeWidget(sections: state.sections, settings: state.config);
        }
        return const LoadingScreen();
      },
    );
  }
}
