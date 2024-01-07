sealed class AppEvent{
  const AppEvent();
}

final class AppEventTapBottomBar extends AppEvent{
  final int index;
  const AppEventTapBottomBar(this.index);
}