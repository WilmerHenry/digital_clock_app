import 'dart:async';

class ClockController {
  final StreamController<DateTime> _clockStreamController =
      StreamController<DateTime>.broadcast();
  Timer? _timer;

  Stream<DateTime> get timeStream => _clockStreamController.stream;

  void startClock() {
    if (_timer != null) return; // Prevent multiple timers

    _clockStreamController.add(DateTime.now());

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_clockStreamController.isClosed) {
        _clockStreamController.add(DateTime.now());
      }
    });
  }

  void stopClock() {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    stopClock();
    _clockStreamController.close();
  }
}
