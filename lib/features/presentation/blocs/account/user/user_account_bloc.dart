import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/domain/entities/account.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/usecases/quick/get_user_snaps.dart';
import 'package:frienderr/features/domain/usecases/user/get_user_usecase.dart';
import 'package:frienderr/features/presentation/screens/account/user_account.dart';
import 'package:frienderr/features/domain/usecases/post/get_user_posts_usecase.dart';
import 'package:frienderr/features/domain/usecases/following/get_following_usercase.dart';
import 'package:frienderr/features/domain/usecases/followers/get_account_followers_usecase.dart';

part 'user_account_state.dart';
part 'user_account_event.dart';
part 'user_account_bloc.freezed.dart';

@injectable
class UserAccountBloc extends Bloc<UserAccountEvent, UserAccountState> {
  final GetUserUseCase _getUserUseCase;
  final GetUserSnapsUseCase _getSnapsUseCase;
  final GetUserPostsUseCase _getPostsUseCase;
  final GetFollowingUseCase _getFollowingUseCase;
  final GetAccountFollowersUseCase _getFollowersUseCase;

  UserAccountBloc(this._getPostsUseCase, this._getFollowersUseCase,
      this._getFollowingUseCase, this._getSnapsUseCase, this._getUserUseCase)
      : super(const UserAccountState()) {
    on<_GetUserAccount>(_getUserAccount);
  }

  Future<void> _getUserAccount(
      _GetUserAccount event, Emitter<UserAccountState> emit) async {
    try {
      emit(state.copyWith(currentState: UserAccountStatus.loading));
      final Account account = await _getAccount(uid: event.uid);

      emit(state.copyWith(
          account: account, currentState: UserAccountStatus.loaded));
    } catch (e) {
      emit(state.copyWith(currentState: UserAccountStatus.error));
    }
  }

  Future<Account> _getAccount({required String uid}) async {
    final Either<Failure, UserEntity> _etiherAccountUser =
        await _getUserUseCase(GetUserParams(uid: uid));

    final _user = _etiherAccountUser.fold((l) => const UserModel(), (r) => r);

    final Either<Failure, List<PostEntity>> _etiherPosts =
        await _getPostsUseCase(GetUserPostsParams(uid));

    List<PostEntity> _posts =
        _etiherPosts.fold((l) => [].cast<PostEntity>(), (r) => r);

    _posts = _posts.map((post) => post.copyWith(user: _user)).toList();

    final Either<Failure, List<QuickEntity>> _etiherSnaps =
        await _getSnapsUseCase(GetUserSnapsParams(uid: uid));

    List<QuickEntity> _snaps =
        _etiherSnaps.fold((l) => [].cast<QuickEntity>(), (r) => r);

    _snaps = _snaps.map((snap) => snap.copyWith(user: _user)).toList();

    final Either<Failure, List<String>> _etiherFollowing =
        await _getFollowingUseCase(GetFollowingParams(uid));

    final _following =
        _etiherFollowing.fold((l) => [].cast<String>(), (r) => r);

    final Either<Failure, List<String>> _etiherFollowers =
        await _getFollowersUseCase(GetAccountFollowersParams(uid));

    final _followers =
        _etiherFollowers.fold((l) => [].cast<String>(), (r) => r);

    return Account(
      user: _user,
      snaps: _snaps,
      posts: _posts,
      followers: _followers,
      following: _following,
    );
  }
}
