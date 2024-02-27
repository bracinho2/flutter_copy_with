sealed class MyState {}

class MyInitialState extends MyState {}

class MyLoadingState extends MyState {}

class MySuccessState extends MyState {
  final bool showSnackBar;
  final int initialNumber;
  final List<String> words;

  MySuccessState({
    this.showSnackBar = false,
    this.initialNumber = 0,
    required this.words,
  });

  MySuccessState copyWith({
    bool? showSnackBar,
    int? initialNumber,
    List<String>? words,
  }) {
    return MySuccessState(
      showSnackBar: showSnackBar ?? this.showSnackBar,
      initialNumber: initialNumber ?? this.initialNumber,
      words: words ?? this.words,
    );
  }
}

class MyErrorState extends MyState {}
