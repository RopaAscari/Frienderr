// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_storage/firebase_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/data/providers/auth_provider.dart' as _i8;
import '../../features/data/providers/chat_provider.dart' as _i11;
import '../../features/data/providers/comment_provider.dart' as _i14;
import '../../features/data/providers/followers_provider.dart' as _i15;
import '../../features/data/providers/following_provider.dart' as _i18;
import '../../features/data/providers/notification_provider.dart' as _i21;
import '../../features/data/providers/post_provider.dart' as _i24;
import '../../features/data/providers/quick_provider.dart' as _i25;
import '../../features/data/providers/story_provider.dart' as _i28;
import '../../features/data/providers/user_provider.dart' as _i29;
import '../../features/data/repositories/auth_repository_impl.dart' as _i10;
import '../../features/data/repositories/chat_repository_impl.dart' as _i13;
import '../../features/data/repositories/comment_repository_impl.dart' as _i50;
import '../../features/data/repositories/followers_repository_impl.dart'
    as _i17;
import '../../features/data/repositories/following_repository_impl.dart'
    as _i20;
import '../../features/data/repositories/notification_repository.dart' as _i23;
import '../../features/data/repositories/post_repository_impl.dart' as _i52;
import '../../features/data/repositories/quick_repository_impl.dart' as _i27;
import '../../features/data/repositories/story_repository_impl.dart' as _i54;
import '../../features/data/repositories/user_repository.dart' as _i31;
import '../../features/domain/repositiories/auth_repository.dart' as _i9;
import '../../features/domain/repositiories/chat_repository.dart' as _i12;
import '../../features/domain/repositiories/comment_repository.dart' as _i49;
import '../../features/domain/repositiories/followers_repository.dart' as _i16;
import '../../features/domain/repositiories/following_repository.dart' as _i19;
import '../../features/domain/repositiories/notification_repository.dart'
    as _i22;
import '../../features/domain/repositiories/post_repository.dart' as _i51;
import '../../features/domain/repositiories/quick_repository.dart' as _i26;
import '../../features/domain/repositiories/story_repository.dart' as _i53;
import '../../features/domain/repositiories/user_repository.dart' as _i30;
import '../../features/domain/usecases/auth/authenticate_usecase.dart' as _i41;
import '../../features/domain/usecases/auth/create_account_usecase.dart'
    as _i42;
import '../../features/domain/usecases/auth/get_user_id_usecase.dart' as _i48;
import '../../features/domain/usecases/auth/recover_password_usecase.dart'
    as _i33;
import '../../features/domain/usecases/auth/sign_out_usecase.dart' as _i37;
import '../../features/domain/usecases/auth/verify_and_update_username.dart'
    as _i39;
import '../../features/domain/usecases/auth/verify_authentication_usecase.dart'
    as _i40;
import '../../features/domain/usecases/auth/verify_username_existence_usecase.dart'
    as _i32;
import '../../features/domain/usecases/chat/get_chats_usecase.dart' as _i43;
import '../../features/domain/usecases/comment/get_comments_usecase.dart'
    as _i69;
import '../../features/domain/usecases/comment/post_comment_usecase.dart'
    as _i57;
import '../../features/domain/usecases/followers/get_followers_usercase.dart'
    as _i44;
import '../../features/domain/usecases/following/get_following_usercase.dart'
    as _i45;
import '../../features/domain/usecases/notification/send_comment_notification_usecase.dart'
    as _i34;
import '../../features/domain/usecases/notification/send_follow_notification_usecase.dart'
    as _i35;
import '../../features/domain/usecases/notification/send_like_notification_usecase.dart'
    as _i36;
import '../../features/domain/usecases/post/create_post_usecase.dart' as _i64;
import '../../features/domain/usecases/post/delete_post_usecase.dart' as _i66;
import '../../features/domain/usecases/post/like_post_usecase.dart' as _i55;
import '../../features/domain/usecases/post/unlike_post_usecase.dart' as _i59;
import '../../features/domain/usecases/quick/get_quicks.dart' as _i47;
import '../../features/domain/usecases/story/create_story_usecase.dart' as _i65;
import '../../features/domain/usecases/story/get_story_stream_usecase.dart'
    as _i73;
import '../../features/domain/usecases/story/get_story_usecase.dart' as _i74;
import '../../features/domain/usecases/story/update_story_usecase.dart' as _i60;
import '../../features/domain/usecases/timeline/get_paginated_posts_usecase.dart'
    as _i70;
import '../../features/domain/usecases/timeline/get_post_stream_usecase.dart'
    as _i71;
import '../../features/domain/usecases/timeline/get_posts_usecase.dart' as _i72;
import '../../features/domain/usecases/user/get_platform_users_usecase.dart'
    as _i46;
import '../../features/presentation/blocs/authenticate/authenticate_bloc.dart'
    as _i62;
import '../../features/presentation/blocs/camera/camera_bloc.dart' as _i4;
import '../../features/presentation/blocs/chat/chat_bloc.dart' as _i63;
import '../../features/presentation/blocs/comment/comment_bloc.dart' as _i78;
import '../../features/presentation/blocs/followers/followers_bloc.dart'
    as _i67;
import '../../features/presentation/blocs/following/following_bloc.dart'
    as _i68;
import '../../features/presentation/blocs/notification/notification_bloc.dart'
    as _i56;
import '../../features/presentation/blocs/post/post_bloc.dart' as _i75;
import '../../features/presentation/blocs/quick/quick_bloc.dart' as _i58;
import '../../features/presentation/blocs/story/story_bloc.dart' as _i76;
import '../../features/presentation/blocs/theme/theme_bloc.dart' as _i38;
import '../../features/presentation/blocs/timeline/timeline_bloc.dart' as _i77;
import '../../features/presentation/blocs/user/user_bloc.dart' as _i61;
import '../../features/presentation/navigation/app_router.dart' as _i3;
import 'register_module.dart' as _i79; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AppRouter>(() => registerModule.appRouter);
  gh.factory<_i4.CameraBloc>(() => _i4.CameraBloc());
  gh.factory<_i5.FirebaseAuth>(() => registerModule.auth);
  gh.factory<_i6.FirebaseFirestore>(() => registerModule.firestore);
  gh.factory<_i7.FirebaseStorage>(() => registerModule.storage);
  gh.lazySingleton<_i8.IAuthRemoteDataProvider>(() =>
      _i8.AuthRemoteDataProvider(
          get<_i5.FirebaseAuth>(), get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i9.IAuthRepository>(
      () => _i10.AuthRepository(get<_i8.IAuthRemoteDataProvider>()));
  gh.lazySingleton<_i11.IChatRemoteDataProvider>(
      () => _i11.ChatRemoteDataProvider(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i12.IChatRepository>(
      () => _i13.ChatRepository(get<_i11.IChatRemoteDataProvider>()));
  gh.lazySingleton<_i14.ICommentRemoteDataProvider>(
      () => _i14.CommentRemoteDataProvider(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i15.IFollowersRemoteDataProvider>(
      () => _i15.FollowersRemoteDataProvider(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i16.IFollowersRepository>(
      () => _i17.FollowersRepository(get<_i15.IFollowersRemoteDataProvider>()));
  gh.lazySingleton<_i18.IFollowingRemoteDataProvider>(
      () => _i18.FollowingRemoteDataProvider(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i19.IFollowingRepository>(
      () => _i20.FollowingRepository(get<_i18.IFollowingRemoteDataProvider>()));
  gh.lazySingleton<_i21.INotificationRemoteDataProvider>(
      () => _i21.NotificationRemoteDataProvider(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i22.INotificationRepository>(() =>
      _i23.NotificationRepository(get<_i21.INotificationRemoteDataProvider>()));
  gh.lazySingleton<_i24.IPostRemoteDataProvider>(() =>
      _i24.PostRemoteDataProvider(get<_i6.FirebaseFirestore>(),
          get<_i7.FirebaseStorage>(), get<_i5.FirebaseAuth>()));
  gh.lazySingleton<_i25.IQuickRemoteDataProvider>(
      () => _i25.QuickRemoteDataProvider(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i26.IQuickRepository>(
      () => _i27.QuickRepository(get<_i25.IQuickRemoteDataProvider>()));
  gh.lazySingleton<_i28.IStoryDataRemoteProvider>(() =>
      _i28.StoryDataRemoteProvider(get<_i6.FirebaseFirestore>(),
          get<_i5.FirebaseAuth>(), get<_i7.FirebaseStorage>()));
  gh.lazySingleton<_i29.IUserDataRemoteProvider>(
      () => _i29.UserDataRemoteProvider(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i30.IUserRepository>(
      () => _i31.UserRepository(get<_i29.IUserDataRemoteProvider>()));
  gh.lazySingleton<_i32.RecoverPasswordUseCase>(
      () => _i32.RecoverPasswordUseCase(get<_i9.IAuthRepository>()));
  gh.lazySingleton<_i33.RecoverPasswordUseCase>(
      () => _i33.RecoverPasswordUseCase(get<_i9.IAuthRepository>()));
  gh.lazySingleton<_i34.SendCommentNotificationUseCase>(() =>
      _i34.SendCommentNotificationUseCase(get<_i22.INotificationRepository>()));
  gh.lazySingleton<_i35.SendFollowNotificationUseCase>(() =>
      _i35.SendFollowNotificationUseCase(get<_i22.INotificationRepository>()));
  gh.lazySingleton<_i36.SendLikeNotificationUseCase>(() =>
      _i36.SendLikeNotificationUseCase(get<_i22.INotificationRepository>()));
  gh.lazySingleton<_i37.SignOutUseCase>(
      () => _i37.SignOutUseCase(get<_i9.IAuthRepository>()));
  gh.factory<_i38.ThemeBloc>(() => _i38.ThemeBloc());
  gh.lazySingleton<_i39.VerifyAndUpdateUsernameUseCase>(
      () => _i39.VerifyAndUpdateUsernameUseCase(get<_i9.IAuthRepository>()));
  gh.lazySingleton<_i40.VerifyAuthenticationUseCase>(
      () => _i40.VerifyAuthenticationUseCase(get<_i9.IAuthRepository>()));
  gh.lazySingleton<_i41.AuthenticateUseCase>(
      () => _i41.AuthenticateUseCase(get<_i9.IAuthRepository>()));
  gh.lazySingleton<_i42.CreateAccountUseCase>(
      () => _i42.CreateAccountUseCase(get<_i9.IAuthRepository>()));
  gh.lazySingleton<_i43.GetChatsUsecase>(
      () => _i43.GetChatsUsecase(get<_i12.IChatRepository>()));
  gh.lazySingleton<_i44.GetFollowersUseCase>(
      () => _i44.GetFollowersUseCase(get<_i16.IFollowersRepository>()));
  gh.lazySingleton<_i45.GetFollowingUseCase>(
      () => _i45.GetFollowingUseCase(get<_i19.IFollowingRepository>()));
  gh.lazySingleton<_i46.GetPlatformUsersUseCase>(
      () => _i46.GetPlatformUsersUseCase(get<_i30.IUserRepository>()));
  gh.lazySingleton<_i47.GetQuickUseCase>(
      () => _i47.GetQuickUseCase(get<_i26.IQuickRepository>()));
  gh.lazySingleton<_i48.GetUserIdUseCase>(
      () => _i48.GetUserIdUseCase(get<_i9.IAuthRepository>()));
  gh.lazySingleton<_i49.ICommentRepository>(() => _i50.CommentRepository(
      get<_i14.ICommentRemoteDataProvider>(),
      get<_i29.IUserDataRemoteProvider>()));
  gh.lazySingleton<_i51.IPostRepository>(() => _i52.PostRepository(
      get<_i24.IPostRemoteDataProvider>(),
      get<_i29.IUserDataRemoteProvider>()));
  gh.lazySingleton<_i53.IStoryRepository>(() => _i54.StoryRepository(
      get<_i28.IStoryDataRemoteProvider>(),
      get<_i29.IUserDataRemoteProvider>()));
  gh.lazySingleton<_i55.LikePostUseCase>(
      () => _i55.LikePostUseCase(get<_i51.IPostRepository>()));
  gh.factory<_i56.NotificationBloc>(() => _i56.NotificationBloc(
      get<_i36.SendLikeNotificationUseCase>(),
      get<_i34.SendCommentNotificationUseCase>(),
      get<_i35.SendFollowNotificationUseCase>()));
  gh.lazySingleton<_i57.PostCommentUseCase>(
      () => _i57.PostCommentUseCase(get<_i49.ICommentRepository>()));
  gh.factory<_i58.QuickBloc>(() => _i58.QuickBloc(get<_i47.GetQuickUseCase>()));
  gh.lazySingleton<_i59.UnLikePostUseCase>(
      () => _i59.UnLikePostUseCase(get<_i51.IPostRepository>()));
  gh.lazySingleton<_i60.UpdateStoryUseCase>(
      () => _i60.UpdateStoryUseCase(get<_i53.IStoryRepository>()));
  gh.factory<_i61.UserBloc>(
      () => _i61.UserBloc(get<_i46.GetPlatformUsersUseCase>()));
  gh.factory<_i62.AuthenticationBloc>(() => _i62.AuthenticationBloc(
      get<_i37.SignOutUseCase>(),
      get<_i48.GetUserIdUseCase>(),
      get<_i42.CreateAccountUseCase>(),
      get<_i32.RecoverPasswordUseCase>(),
      get<_i41.AuthenticateUseCase>(),
      get<_i40.VerifyAuthenticationUseCase>(),
      get<_i39.VerifyAndUpdateUsernameUseCase>()));
  gh.factory<_i63.ChatBloc>(() => _i63.ChatBloc(get<_i43.GetChatsUsecase>()));
  gh.lazySingleton<_i64.CreatePostUseCase>(
      () => _i64.CreatePostUseCase(get<_i51.IPostRepository>()));
  gh.lazySingleton<_i65.CreateStoryUseCase>(
      () => _i65.CreateStoryUseCase(get<_i53.IStoryRepository>()));
  gh.lazySingleton<_i66.DeletePostUseCase>(
      () => _i66.DeletePostUseCase(get<_i51.IPostRepository>()));
  gh.factory<_i67.FollowersBloc>(
      () => _i67.FollowersBloc(get<_i44.GetFollowersUseCase>()));
  gh.factory<_i68.FollowingBloc>(
      () => _i68.FollowingBloc(get<_i45.GetFollowingUseCase>()));
  gh.lazySingleton<_i69.GetCommentsUseCase>(
      () => _i69.GetCommentsUseCase(get<_i49.ICommentRepository>()));
  gh.lazySingleton<_i70.GetPaginatedPostsUseCase>(
      () => _i70.GetPaginatedPostsUseCase(get<_i51.IPostRepository>()));
  gh.lazySingleton<_i71.GetPostsStreamUseCase>(
      () => _i71.GetPostsStreamUseCase(get<_i51.IPostRepository>()));
  gh.lazySingleton<_i72.GetPostsUseCase>(
      () => _i72.GetPostsUseCase(get<_i51.IPostRepository>()));
  gh.lazySingleton<_i73.GetStoryStreamUseCase>(
      () => _i73.GetStoryStreamUseCase(get<_i53.IStoryRepository>()));
  gh.lazySingleton<_i74.GetStoryUseCase>(
      () => _i74.GetStoryUseCase(get<_i53.IStoryRepository>()));
  gh.factory<_i75.PostBloc>(() => _i75.PostBloc(
      get<_i72.GetPostsUseCase>(),
      get<_i55.LikePostUseCase>(),
      get<_i64.CreatePostUseCase>(),
      get<_i59.UnLikePostUseCase>(),
      get<_i66.DeletePostUseCase>(),
      get<_i71.GetPostsStreamUseCase>(),
      get<_i70.GetPaginatedPostsUseCase>()));
  gh.factory<_i76.StoryBloc>(() => _i76.StoryBloc(
      get<_i73.GetStoryStreamUseCase>(),
      get<_i74.GetStoryUseCase>(),
      get<_i60.UpdateStoryUseCase>(),
      get<_i65.CreateStoryUseCase>()));
  gh.factory<_i77.TimelineBloc>(() => _i77.TimelineBloc(
      get<_i72.GetPostsUseCase>(),
      get<_i71.GetPostsStreamUseCase>(),
      get<_i70.GetPaginatedPostsUseCase>()));
  gh.factory<_i78.CommentBloc>(() => _i78.CommentBloc(
      get<_i69.GetCommentsUseCase>(), get<_i57.PostCommentUseCase>()));
  return get;
}

class _$RegisterModule extends _i79.RegisterModule {}
