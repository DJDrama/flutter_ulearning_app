sealed class HomePageEvent{
  const HomePageEvent();
}

final class HomePagePageSwipe extends HomePageEvent{
  final int pageIndex;
  const HomePagePageSwipe(this.pageIndex);
}