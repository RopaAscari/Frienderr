import 'package:freezed_annotation/freezed_annotation.dart';

part 'cubit_state.freezed.dart';

@freezed
class CurrentState<T> with _$CurrentState {
  const factory CurrentState.idle() = Idle;

  const factory CurrentState.loading() = Loading;

  const factory CurrentState.data({@Default(null) T? data}) = Data<T>;

  const factory CurrentState.error({@Default(null) String? error}) = Error;
}
