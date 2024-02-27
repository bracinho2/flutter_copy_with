import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_copy_with/cubit/cubit.dart';
import 'package:flutter_copy_with/state/state.dart';

class CubitExamplePage extends StatefulWidget {
  const CubitExamplePage({super.key});

  @override
  State<CubitExamplePage> createState() => _CubitExamplePageState();
}

class _CubitExamplePageState extends State<CubitExamplePage> {
  final bloc = MyStateController();

  @override
  void initState() {
    super.initState();
    bloc.init();
  }

  void listener(context, state) {
    if (state is MySuccessState) {
      final showSnackBar = state.showSnackBar;
      final initialNumber = state.initialNumber;
      if (showSnackBar) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('My Snack Bar Note $initialNumber =)'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyStateController, MyState>(
      bloc: bloc,
      listener: listener,
      builder: (context, state) {
        return switch (state) {
          MyInitialState() => const Scaffold(
              body: Center(
                child: Text('My Initial State'),
              ),
            ),
          MyLoadingState() => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          MySuccessState(
            :final showSnackBar,
            :final initialNumber,
            :final words,
          ) =>
            Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => bloc.changeMyState(),
                      child: const Text(
                        'Click Me',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('My Variables'),
                    Text('Show Snack Bar: $showSnackBar'),
                    Text('Initial Number: $initialNumber'),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('My Words'),
                    ...words.map(
                      (w) => Text(w),
                    ),
                  ],
                ),
              ),
            ),
          MyErrorState() => const Center(),
        };
      },
    );
  }
}
