mixin StreakCounterMixin {
  int _streakCounter = 0;

  int get streakCounter => _streakCounter;
  set streakCounter(int value) => _streakCounter = value;
}
