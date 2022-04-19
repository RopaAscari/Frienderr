// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/data/providers/auth_provider.dart' as _i6;
import '../../features/data/providers/chat_provider.dart' as _i9;
import '../../features/data/providers/comment_provider.dart' as _i12;
import '../../features/data/providers/followers_provider.dart' as _i15;
import '../../features/data/providers/following_provider.dart' as _i18;
import '../../features/data/providers/notification_provider.dart' as _i21;
import '../../features/data/providers/post_provider.dart' as _i24;
import '../../features/data/providers/quick_provider.dart' as _i27;
import '../../features/data/providers/story_provider.dart' as _i30;
import '../../features/data/providers/user_provider.dart' as _i33;
import '../../features/data/repositories/auth_repository_impl.dart' as _i8;
import '../../features/data/repositories/chat_repository_impl.dart' as _i11;
import '../../features/data/repositories/comment_repository_impl.dart' as _i14;
import '../../features/data/repositories/followers_repository_impl.dart'
    as _i17;
import '../../features/data/repositories/following_repository_impl.dart'
    as _i20;
import '../../features/data/repositories/notification_repository.dart' as _i23;
import '../../features/data/repositories/post_repository_impl.dart' as _i26;
import '../../features/data/repositories/quick_repository_impl.dart' as _i29;
import '../../features/data/repositories/story_repository_impl.dart' as _i32;
import '../../features/data/repositories/user_repository.dart' as _i35;
import '../../features/domain/repositiories/auth_repository.dart' as _i7;
import '../../features/domain/repositiories/chat_repository.dart' as _i10;
import '../../features/domain/repositiories/comment_repository.dart' as _i13;
import '../../features/domain/repositiories/followers_repository.dart' as _i16;
import '../../features/domain/repositiories/following_repository.dart' as _i19;
import '../../features/domain/repositiories/notification_repository.dart'
    as _i22;
import '../../features/domain/repositiories/post_repository.dart' as _i25;
import '../../features/domain/repositiories/quick_repository.dart' as _i28;
import '../../features/domain/repositiories/story_repository.dart' as _i31;
import '../../features/domain/repositiories/user_repository.dart' as _i34;
import '../../features/domain/usecases/auth/authenticate_usecase.dart' as _i48;
import '../../features/domain/usecases/auth/create_account_usecase.dart'
    as _i49;
import '../../features/domain/usecases/auth/get_user_id_usecase.dart' as _i61;
import '../../features/domain/usecases/auth/recover_password_usecase.dart'
    as _i39;
import '../../features/domain/usecases/auth/sign_out_usecase.dart' as _i43;
import '../../features/domain/usecases/auth/verify_and_update_username.dart'
    as _i46;
import '../../features/domain/usecases/auth/verify_authentication_usecase.dart'
    as _i47;
import '../../features/domain/usecases/auth/verify_username_existence_usecase.dart'
    as _i38;
import '../../features/domain/usecases/chat/get_chats_usecase.dart' as _i51;
import '../../features/domain/usecases/comment/get_comments_usecase.dart'
    as _i52;
import '../../features/domain/usecases/comment/post_comment_usecase.dart'
    as _i37;
import '../../features/domain/usecases/followers/get_followers_usercase.dart'
    as _i53;
import '../../features/domain/usecases/following/get_following_usercase.dart'
    as _i54;
import '../../features/domain/usecases/notification/send_comment_notification_usecase.dart'
    as _i40;
import '../../features/domain/usecases/notification/send_follow_notification_usecase.dart'
    as _i41;
import '../../features/domain/usecases/notification/send_like_notification_usecase.dart'
    as _i42;
import '../../features/domain/usecases/post/delete_post_usecase.dart' as _i50;
import '../../features/domain/usecases/post/like_post_usecase.dart' as _i36;
import '../../features/domain/usecases/post/unlike_post_usecase.dart' as _i45;
import '../../features/domain/usecases/quick/get_quicks.dart' as _i59;
import '../../features/domain/usecases/story/get_story_stream_usecase.dart'
    as _i60;
import '../../features/domain/usecases/timeline/get_paginated_posts_usecase.dart'
    as _i55;
import '../../features/domain/usecases/timeline/get_post_stream_usecase.dart'
    as _i57;
import '../../features/domain/usecases/timeline/get_posts_usecase.dart' as _i58;
import '../../features/domain/usecases/user/get_platform_users_usecase.dart'
    as _i56;
import '../../features/presentation/blocs/authenticate/authenticate_bloc.dart'
    as _i68;
import '../../features/presentation/blocs/chat/chat_bloc.dart' as _i69;
import '../../features/presentation/blocs/comment/comment_bloc.dart' as _i70;
import '../../features/presentation/blocs/followers/followers_bloc.dart'
    as _i71;
import '../../features/presentation/blocs/following/following_bloc.dart'
    as _i72;
import '../../features/presentation/blocs/notification/notification_bloc.dart'
    as _i62;
import '../../features/presentation/blocs/post/post_bloc.dart' as _i63;
import '../../features/presentation/blocs/quick/quick_bloc.dart' as _i64;
import '../../features/presentation/blocs/story/story_bloc.dart' as _i65;
import '../../features/presentation/blocs/theme/theme_bloc.dart' as _i44;
import '../../features/presentation/blocs/timeline/timeline_bloc.dart' as _i66;
import '../../features/presentation/blocs/user/user_bloc.dart' as _i67;
import '../../features/presentation/navigation/app_router.dart' as _i3;
import 'register_module.dart' as _i73; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AppRouter>(() => registerModule.appRouter);
  gh.factory<_i4.FirebaseAuth>(() => registerModule.authInstance);
  gh.factory<_i5.FirebaseFirestore>(() => registerModule.firestore);
  gh.lazySingleton<_i6.IAuthRemoteDataProvider>(() =>
      _i6.AuthRemoteDataProvider(
          get<_i4.FirebaseAuth>(), get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i7.IAuthRepository>(
      () => _i8.AuthRepository(get<_i6.IAuthRemoteDataProvider>()));
  gh.lazySingleton<_i9.IChatRemoteDataProvider>(
      () => _i9.ChatRemoteDataProvider(get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i10.IChatRepository>(
      () => _i11.ChatRepository(get<_i9.IChatRemoteDataProvider>()));
  gh.lazySingleton<_i12.ICommentRemoteDataProvider>(
      () => _i12.CommentRemoteDataProvider(get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i13.ICommentRepository>(
      () => _i14.CommentRepository(get<_i12.ICommentRemoteDataProvider>()));
  gh.lazySingleton<_i15.IFollowersRemoteDataProvider>(
      () => _i15.FollowersRemoteDataProvider(get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i16.IFollowersRepository>(
      () => _i17.FollowersRepository(get<_i15.IFollowersRemoteDataProvider>()));
  gh.lazySingleton<_i18.IFollowingRemoteDataProvider>(
      () => _i18.FollowingRemoteDataProvider(get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i19.IFollowingRepository>(
      () => _i20.FollowingRepository(get<_i18.IFollowingRemoteDataProvider>()));
  gh.lazySingleton<_i21.INotificationRemoteDataProvider>(
      () => _i21.NotificationRemoteDataProvider(get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i22.INotificationRepository>(() =>
      _i23.NotificationRepository(get<_i21.INotificationRemoteDataProvider>()));
  gh.lazySingleton<_i24.IPostRemoteDataProvider>(
      () => _i24.PostRemoteDataProvider(get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i25.IPostRepository>(
      () => _i26.PostRepository(get<_i24.IPostRemoteDataProvider>()));
  gh.lazySingleton<_i27.IQuickRemoteDataProvider>(
      () => _i27.QuickRemoteDataProvider(get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i28.IQuickRepository>(
      () => _i29.QuickRepository(get<_i27.IQuickRemoteDataProvider>()));
  gh.lazySingleton<_i30.IStoryDataRemoteProvider>(
      () => _i30.StoryDataRemoteProvider(get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i31.IStoryRepository>(
      () => _i32.StoryRepository(get<_i30.IStoryDataRemoteProvider>()));
  gh.lazySingleton<_i33.IUserDataRemoteProvider>(
      () => _i33.UserDataRemoteProvider(get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i34.IUserRepository>(
      () => _i35.UserRepository(get<_i33.IUserDataRemoteProvider>()));
  gh.lazySingleton<_i36.LikePostUseCase>(
      () => _i36.LikePostUseCase(get<_i25.IPostRepository>()));
  gh.lazySingleton<_i37.PostCommentUseCase>(
      () => _i37.PostCommentUseCase(get<_i13.ICommentRepository>()));
  gh.lazySingleton<_i38.RecoverPasswordUseCase>(
      () => _i38.RecoverPasswordUseCase(get<_i7.IAuthRepository>()));
  gh.lazySingleton<_i39.RecoverPasswordUseCase>(
      () => _i39.RecoverPasswordUseCase(get<_i7.IAuthRepository>()));
  gh.lazySingleton<_i40.SendCommentNotificationUseCase>(() =>
      _i40.SendCommentNotificationUseCase(get<_i22.INotificationRepository>()));
  gh.lazySingleton<_i41.SendFollowNotificationUseCase>(() =>
      _i41.SendFollowNotificationUseCase(get<_i22.INotificationRepository>()));
  gh.lazySingleton<_i42.SendLikeNotificationUseCase>(() =>
      _i42.SendLikeNotificationUseCase(get<_i22.INotificationRepository>()));
  gh.lazySingleton<_i43.SignOutUseCase>(
      () => _i43.SignOutUseCase(get<_i7.IAuthRepository>()));
  gh.factory<_i44.ThemeBloc>(() => _i44.ThemeBloc());
  gh.lazySingleton<_i45.UnLikePostUseCase>(
      () => _i45.UnLikePostUseCase(get<_i25.IPostRepository>()));
  gh.lazySingleton<_i46.VerifyAndUpdateUsernameUseCase>(
      () => _i46.VerifyAndUpdateUsernameUseCase(get<_i7.IAuthRepository>()));
  gh.lazySingleton<_i47.VerifyAuthenticationUseCase>(
      () => _i47.VerifyAuthenticationUseCase(get<_i7.IAuthRepository>()));
  gh.lazySingleton<_i48.AuthenticateUseCase>(
      () => _i48.AuthenticateUseCase(get<_i7.IAuthRepository>()));
  gh.lazySingleton<_i49.CreateAccountUseCase>(
      () => _i49.CreateAccountUseCase(get<_i7.IAuthRepository>()));
  gh.lazySingleton<_i50.DeletePostUseCase>(
      () => _i50.DeletePostUseCase(get<_i25.IPostRepository>()));
  gh.lazySingleton<_i51.GetChatsUsecase>(
      () => _i51.GetChatsUsecase(get<_i10.IChatRepository>()));
  gh.lazySingleton<_i52.GetCommentsUseCase>(
      () => _i52.GetCommentsUseCase(get<_i13.ICommentRepository>()));
  gh.lazySingleton<_i53.GetFollowersUseCase>(
      () => _i53.GetFollowersUseCase(get<_i16.IFollowersRepository>()));
  gh.lazySingleton<_i54.GetFollowingUseCase>(
      () => _i54.GetFollowingUseCase(get<_i19.IFollowingRepository>()));
  gh.lazySingleton<_i55.GetPaginatedPostsUseCase>(
      () => _i55.GetPaginatedPostsUseCase(get<_i25.IPostRepository>()));
  gh.lazySingleton<_i56.GetPlatformUsersUseCase>(
      () => _i56.GetPlatformUsersUseCase(get<_i34.IUserRepository>()));
  gh.lazySingleton<_i57.GetPostsStreamUseCase>(
      () => _i57.GetPostsStreamUseCase(get<_i25.IPostRepository>()));
  gh.lazySingleton<_i58.GetPostsUseCase>(
      () => _i58.GetPostsUseCase(get<_i25.IPostRepository>()));
  gh.lazySingleton<_i59.GetQuickUseCase>(
      () => _i59.GetQuickUseCase(get<_i28.IQuickRepository>()));
  gh.lazySingleton<_i60.GetStoryStreamUseCase>(
      () => _i60.GetStoryStreamUseCase(get<_i31.IStoryRepository>()));
  gh.lazySingleton<_i61.GetUserIdUseCase>(
      () => _i61.GetUserIdUseCase(get<_i7.IAuthRepository>()));
  gh.factory<_i62.NotificationBloc>(() => _i62.NotificationBloc(
      get<_i42.SendLikeNotificationUseCase>(),
      get<_i40.SendCommentNotificationUseCase>(),
      get<_i41.SendFollowNotificationUseCase>()));
  gh.factory<_i63.PostBloc>(() => _i63.PostBloc(get<_i36.LikePostUseCase>(),
      get<_i45.UnLikePostUseCase>(), get<_i50.DeletePostUseCase>()));
  gh.factory<_i64.QuickBloc>(() => _i64.QuickBloc(get<_i59.GetQuickUseCase>()));
  gh.factory<_i65.StoryBloc>(
      () => _i65.StoryBloc(get<_i60.GetStoryStreamUseCase>()));
  gh.factory<_i66.TimelineBloc>(() => _i66.TimelineBloc(
      get<_i58.GetPostsUseCase>(),
      get<_i57.GetPostsStreamUseCase>(),
      get<_i55.GetPaginatedPostsUseCase>()));
  gh.factory<_i67.UserBloc>(
      () => _i67.UserBloc(get<_i56.GetPlatformUsersUseCase>()));
  gh.factory<_i68.AuthenticationBloc>(() => _i68.AuthenticationBloc(
      get<_i43.SignOutUseCase>(),
      get<_i61.GetUserIdUseCase>(),
      get<_i49.CreateAccountUseCase>(),
      get<_i38.RecoverPasswordUseCase>(),
      get<_i48.AuthenticateUseCase>(),
      get<_i47.VerifyAuthenticationUseCase>(),
      get<_i46.VerifyAndUpdateUsernameUseCase>()));
  gh.factory<_i69.ChatBloc>(() => _i69.ChatBloc(get<_i51.GetChatsUsecase>()));
  gh.factory<_i70.CommentBloc>(() => _i70.CommentBloc(
      get<_i52.GetCommentsUseCase>(), get<_i37.PostCommentUseCase>()));
  gh.factory<_i71.FollowersBloc>(
      () => _i71.FollowersBloc(get<_i53.GetFollowersUseCase>()));
  gh.factory<_i72.FollowingBloc>(
      () => _i72.FollowingBloc(get<_i54.GetFollowingUseCase>()));
  return get;
}

class _$RegisterModule extends _i73.RegisterModule {}
