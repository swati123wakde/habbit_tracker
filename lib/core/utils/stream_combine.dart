import 'dart:async';

/// Minimal `combineLatest` for two streams (avoids pulling in rxdart).
/// Emits once both sources have produced a value, then on every new value.
Stream<R> combineLatest2<A, B, R>(
    Stream<A> streamA,
    Stream<B> streamB,
    R Function(A a, B b) combiner,
    ) {
  late final StreamController<R> controller;
  StreamSubscription<A>? subA;
  StreamSubscription<B>? subB;
  late A lastA;
  late B lastB;
  var hasA = false;
  var hasB = false;
  var completed = 0;

  void emit() {
    if (!hasA || !hasB) return;
    try {
      controller.add(combiner(lastA, lastB));
    } catch (e, st) {
      controller.addError(e, st);
    }
  }

  void onDone() {
    completed++;
    if (completed == 2) controller.close();
  }

  controller = StreamController<R>(
    onListen: () {
      subA = streamA.listen(
            (value) {
          lastA = value;
          hasA = true;
          emit();
        },
        onError: controller.addError,
        onDone: onDone,
      );
      subB = streamB.listen(
            (value) {
          lastB = value;
          hasB = true;
          emit();
        },
        onError: controller.addError,
        onDone: onDone,
      );
    },
    onPause: () {
      subA?.pause();
      subB?.pause();
    },
    onResume: () {
      subA?.resume();
      subB?.resume();
    },
    onCancel: () async {
      await subA?.cancel();
      await subB?.cancel();
    },
  );

  return controller.stream;
}
