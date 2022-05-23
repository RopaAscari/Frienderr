import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/account.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/presentation/screens/account/account.dart';

part 'account_state.dart';
part 'account_event.dart';
part 'account_bloc.freezed.dart';

@injectable
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(const AccountState());
  /*final GetPostsUseCase _getPostsUseCase;
  final GetSnapUseCase _getSnapsUseCase;
  final GetUserUseCase _getUserUseCase;
  final GetFollowingUseCase _getFollowingUseCase;
  final GetPFollowersUseCase _getFollowersUseCase;

  AccountBloc(this._getPostsUseCase, this._getFollowersUseCase,
      this._getFollowingUseCase, this._getSnapsUseCase, this._getUserUseCase)
      : super(const AccountState()) {
    on<_GetUserAccount>(_getUserAccount);
    on<_GetProfileAccount>(_getProfileAccount);
  }

  Future<void> _getUserAccount(
      _GetUserAccount event, Emitter<AccountState> emit) async {
    final Account account = await _getAccount(uid: event.uid);

    state.copyWith(userAccount: account);
  }

  Future<void> _getProfileAccount(
      _GetProfileAccount event, Emitter<AccountState> emit) async {}

  Future<Account> _getAccount({required String uid}) async {
    final Either<Failure, List<PostEntity>> _etiherPosts =
        await _getPostsUseCase(GetPostParams(uid));

    final _posts = _etiherPosts.fold((l) => [].cast<PostEntity>(), (r) => r);

    final Either<Failure, List<QuickEntity>> _etiherSnaps =
        await _getSnapsUseCase(GetSnapsParams(uid));

    final _snaps = _etiherSnaps.fold((l) => [].cast<QuickEntity>(), (r) => r);

    final Either<Failure, UserModel> _etiherAccountUser =
        await _getSnapsUseCase(GetAccountUserParams(uid));

    final _user = _etiherAccountUser.fold((l) => const UserModel(), (r) => r);

    final Either<Failure, List<String>> _etiherFollowing =
        await _getFollowingUseCase(GetAccountFollowingParams(uid));

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
  }*/
}
