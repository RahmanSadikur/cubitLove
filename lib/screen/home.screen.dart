import 'package:cubiclove/cubit/internet.cubit/internet.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state == InternetState.gained) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Connected")));
            } else if (state == InternetState.lost) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Not Connected")));
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Loading...")));
            }
          },
          builder: (context, state) {
            if (state == InternetState.gained) {
              return const Text("Connected");
            } else if (state == InternetState.lost) {
              return const Text("Not Connected");
            } else {
              return const Text("Loading...");
            }
          },
        ),
      )),
    );
  }
}
