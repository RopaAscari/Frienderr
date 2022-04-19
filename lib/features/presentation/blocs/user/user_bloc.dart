import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/usecases/user/get_platform_users_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';

part 'user_state.dart';
part 'user_event.dart';
part 'user_bloc.freezed.dart';

@injectable
class UserBloc extends HydratedBloc<UserEvent, UserState> {
  final GetPlatformUsersUseCase _getPlatformUsersUseCase;
  UserBloc(this._getPlatformUsersUseCase) : super(UserState()) {
    on<_SetUser>(_setUser);
    on<_FetchAppUsers>(_fetchAppUsers);
  }

  UserState get initialState {
    return UserState();
  }

  @override
  UserState fromJson(Map<String, dynamic> json) {
    try {
      final user = UserModel.fromJson(json);
      // emit(state.copyWith(user: user));
      return UserState(user: user);
    } catch (_) {
      return null as UserState;
    }
  }

  @override
  Map<String, dynamic> toJson(UserState state) {
    return state.user.toJson();
  }

  void _setUser(_SetUser event, Emitter<UserState> emit) {
    emit(state.copyWith(user: event.user));
  }

  Future<void> _fetchAppUsers(
      _FetchAppUsers event, Emitter<UserState> emit) async {
    final failureOrSucesss =
        await _getPlatformUsersUseCase(GetPlatformUsersParams());
    return failureOrSucesss.fold((error) {
      emit(state.copyWith(platformUsers: []));
    }, (platformUsers) {
      emit(state.copyWith(platformUsers: platformUsers));
    });
  }
}
