class HomePageState {
  // Immutable
  final int pageIndex;

  const HomePageState({this.pageIndex = 0});

  HomePageState copyWith({int? index}) {
    return HomePageState(pageIndex: index ?? pageIndex);
  }
}
