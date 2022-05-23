// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i7;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:firebase_messaging/firebase_messaging.dart' as _i8;
import 'package:firebase_storage/firebase_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql_flutter/graphql_flutter.dart' as _i10;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/data/providers/auth_provider.dart' as _i11;
import '../../features/data/providers/chat_provider.dart' as _i14;
import '../../features/data/providers/comment_provider.dart' as _i17;
import '../../features/data/providers/followers_provider.dart' as _i18;
import '../../features/data/providers/following_provider.dart' as _i21;
import '../../features/data/providers/notification_provider.dart' as _i24;
import '../../features/data/providers/post_provider.dart' as _i25;
import '../../features/data/providers/quick_provider.dart' as _i26;
import '../../features/data/providers/story_provider.dart' as _i27;
import '../../features/data/providers/user_provider.dart' as _i28;
import '../../features/data/repositories/auth_repository_impl.dart' as _i13;
import '../../features/data/repositories/chat_repository_impl.dart' as _i16;
import '../../features/data/repositories/comment_repository_impl.dart' as _i81;
import '../../features/data/repositories/followers_repository_impl.dart'
    as _i20;
import '../../features/data/repositories/following_repository_impl.dart'
    as _i23;
import '../../features/data/repositories/notification_repository.dart' as _i45;
import '../../features/data/repositories/post_repository_impl.dart' as _i47;
import '../../features/data/repositories/quick_repository_impl.dart' as _i49;
import '../../features/data/repositories/story_repository_impl.dart' as _i51;
import '../../features/data/repositories/user_repository.dart' as _i30;
import '../../features/domain/repositiories/auth_repository.dart' as _i12;
import '../../features/domain/repositiories/chat_repository.dart' as _i15;
import '../../features/domain/repositiories/comment_repository.dart' as _i80;
import '../../features/domain/repositiories/followers_repository.dart' as _i19;
import '../../features/domain/repositiories/following_repository.dart' as _i22;
import '../../features/domain/repositiories/notification_repository.dart'
    as _i44;
import '../../features/domain/repositiories/post_repository.dart' as _i46;
import '../../features/domain/repositiories/quick_repository.dart' as _i48;
import '../../features/domain/repositiories/story_repository.dart' as _i50;
import '../../features/domain/repositiories/user_repository.dart' as _i29;
import '../../features/domain/usecases/auth/authenticate_usecase.dart' as _i37;
import '../../features/domain/usecases/auth/create_account_usecase.dart'
    as _i38;
import '../../features/domain/usecases/auth/get_user_id_usecase.dart' as _i43;
import '../../features/domain/usecases/auth/recover_password_usecase.dart'
    as _i31;
import '../../features/domain/usecases/auth/sign_out_usecase.dart' as _i33;
import '../../features/domain/usecases/auth/verify_and_update_username.dart'
    as _i35;
import '../../features/domain/usecases/auth/verify_authentication_usecase.dart'
    as _i36;
import '../../features/domain/usecases/auth/verify_username_existence_usecase.dart'
    as _i32;
import '../../features/domain/usecases/chat/get_chats_usecase.dart' as _i39;
import '../../features/domain/usecases/comment/get_comments_usecase.dart'
    as _i88;
import '../../features/domain/usecases/comment/post_comment_usecase.dart'
    as _i84;
import '../../features/domain/usecases/followers/get_followers_usercase.dart'
    as _i40;
import '../../features/domain/usecases/following/get_following_usercase.dart'
    as _i41;
import '../../features/domain/usecases/notification/get_notification_stream_usecase.dart'
    as _i72;
import '../../features/domain/usecases/notification/get_notifications_usecase.dart'
    as _i73;
import '../../features/domain/usecases/notification/send_comment_notification_usecase.dart'
    as _i54;
import '../../features/domain/usecases/notification/send_follow_notification_usecase.dart'
    as _i55;
import '../../features/domain/usecases/notification/send_like_notification_usecase.dart'
    as _i56;
import '../../features/domain/usecases/post/create_post_usecase.dart' as _i64;
import '../../features/domain/usecases/post/delete_post_usecase.dart' as _i67;
import '../../features/domain/usecases/post/like_post_usecase.dart' as _i52;
import '../../features/domain/usecases/post/unlike_post_usecase.dart' as _i57;
import '../../features/domain/usecases/quick/create_quick.dart' as _i65;
import '../../features/domain/usecases/quick/delete_quick.dart' as _i68;
import '../../features/domain/usecases/quick/get_quicks.dart' as _i77;
import '../../features/domain/usecases/quick/like_quick.dart' as _i53;
import '../../features/domain/usecases/quick/unlike_quick.dart' as _i58;
import '../../features/domain/usecases/story/create_story_usecase.dart' as _i66;
import '../../features/domain/usecases/story/delete_story_usecase.dart' as _i69;
import '../../features/domain/usecases/story/get_story_stream_usecase.dart'
    as _i78;
import '../../features/domain/usecases/story/get_story_usecase.dart' as _i79;
import '../../features/domain/usecases/story/update_story_usecase.dart' as _i59;
import '../../features/domain/usecases/story/view_story_usecase.dart' as _i61;
import '../../features/domain/usecases/timeline/get_paginated_posts_usecase.dart'
    as _i74;
import '../../features/domain/usecases/timeline/get_post_stream_usecase.dart'
    as _i75;
import '../../features/domain/usecases/timeline/get_posts_usecase.dart' as _i76;
import '../../features/domain/usecases/user/get_platform_users_usecase.dart'
    as _i42;
import '../../features/presentation/blocs/account/account_bloc.dart' as _i3;
import '../../features/presentation/blocs/authenticate/authenticate_bloc.dart'
    as _i62;
import '../../features/presentation/blocs/camera/camera_bloc.dart' as _i5;
import '../../features/presentation/blocs/chat/chat_bloc.dart' as _i63;
import '../../features/presentation/blocs/comment/comment_bloc.dart' as _i89;
import '../../features/presentation/blocs/followers/followers_bloc.dart'
    as _i70;
import '../../features/presentation/blocs/following/following_bloc.dart'
    as _i71;
import '../../features/presentation/blocs/notification/notification_bloc.dart'
    as _i82;
import '../../features/presentation/blocs/post/post_bloc.dart' as _i83;
import '../../features/presentation/blocs/quick/quick_bloc.dart' as _i85;
import '../../features/presentation/blocs/story/story_bloc.dart' as _i86;
import '../../features/presentation/blocs/theme/theme_bloc.dart' as _i34;
import '../../features/presentation/blocs/timeline/timeline_bloc.dart' as _i87;
import '../../features/presentation/blocs/user/user_bloc.dart' as _i60;
import '../../features/presentation/navigation/app_router.dart' as _i4;
import 'register_module.dart' as _i90; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.AccountBloc>(() => _i3.AccountBloc());
  gh.lazySingleton<_i4.AppRouter>(() => registerModule.appRouter);
  gh.factory<_i5.CameraBloc>(() => _i5.CameraBloc());
  gh.factory<_i6.FirebaseAuth>(() => registerModule.auth);
  gh.factory<_i7.FirebaseFirestore>(() => registerModule.firestore);
  gh.factory<_i8.FirebaseMessaging>(() => registerModule.messaging);
  gh.factory<_i9.FirebaseStorage>(() => registerModule.storage);
  gh.lazySingleton<_i10.GraphQLClient>(() => registerModule.gqlClient);
  gh.lazySingleton<_i11.IAuthRemoteDataProvider>(() =>
      _i11.AuthRemoteDataProvider(get<_i6.FirebaseAuth>(),
          get<_i7.FirebaseFirestore>(), get<_i8.FirebaseMessaging>()));
  gh.lazySingleton<_i12.IAuthRepository>(
      () => _i13.AuthRepository(get<_i11.IAuthRemoteDataProvider>()));
  gh.lazySingleton<_i14.IChatRemoteDataProvider>(
      () => _i14.ChatRemoteDataProvider(get<_i7.FirebaseFirestore>()));
  gh.lazySingleton<_i15.IChatRepository>(
      () => _i16.ChatRepository(get<_i14.IChatRemoteDataProvider>()));
  gh.lazySingleton<_i17.ICommentRemoteDataProvider>(
      () => _i17.CommentRemoteDataProvider(get<_i7.FirebaseFirestore>()));
  gh.lazySingleton<_i18.IFollowersRemoteDataProvider>(
      () => _i18.FollowersRemoteDataProvider(get<_i7.FirebaseFirestore>()));
  gh.lazySingleton<_i19.IFollowersRepository>(
      () => _i20.FollowersRepository(get<_i18.IFollowersRemoteDataProvider>()));
  gh.lazySingleton<_i21.IFollowingRemoteDataProvider>(
      () => _i21.FollowingRemoteDataProvider(get<_i7.FirebaseFirestore>()));
  gh.lazySingleton<_i22.IFollowingRepository>(
      () => _i23.FollowingRepository(get<_i21.IFollowingRemoteDataProvider>()));
  gh.lazySingleton<_i24.INotificationRemoteDataProvider>(() =>
      _i24.NotificationRemoteDataProvider(get<_i6.FirebaseAuth>(),
          get<_i10.GraphQLClient>(), get<_i7.FirebaseFirestore>()));
  gh.lazySingleton<_i25.IPostRemoteDataProvider>(() =>
      _i25.PostRemoteDataProvider(get<_i7.FirebaseFirestore>(),
          get<_i9.FirebaseStorage>(), get<_i6.FirebaseAuth>()));
  gh.lazySingleton<_i26.IQuickRemoteDataProvider>(() =>
      _i26.QuickRemoteDataProvider(get<_i7.FirebaseFirestore>(),
          get<_i6.FirebaseAuth>(), get<_i9.FirebaseStorage>()));
  gh.lazySingleton<_i27.IStoryDataRemoteProvider>(() =>
      _i27.StoryDataRemoteProvider(get<_i7.FirebaseFirestore>(),
          get<_i6.FirebaseAuth>(), get<_i9.FirebaseStorage>()));
  gh.lazySingleton<_i28.IUserDataRemoteProvider>(
      () => _i28.UserDataRemoteProvider(get<_i7.FirebaseFirestore>()));
  gh.lazySingleton<_i29.IUserRepository>(
      () => _i30.UserRepository(get<_i28.IUserDataRemoteProvider>()));
  gh.lazySingleton<_i31.RecoverPasswordUseCase>(
      () => _i31.RecoverPasswordUseCase(get<_i12.IAuthRepository>()));
  gh.lazySingleton<_i32.RecoverPasswordUseCase>(
      () => _i32.RecoverPasswordUseCase(get<_i12.IAuthRepository>()));
  gh.lazySingleton<_i33.SignOutUseCase>(
      () => _i33.SignOutUseCase(get<_i12.IAuthRepository>()));
  gh.factory<_i34.ThemeBloc>(() => _i34.ThemeBloc());
  gh.lazySingleton<_i35.VerifyAndUpdateUsernameUseCase>(
      () => _i35.VerifyAndUpdateUsernameUseCase(get<_i12.IAuthRepository>()));
  gh.lazySingleton<_i36.VerifyAuthenticationUseCase>(
      () => _i36.VerifyAuthenticationUseCase(get<_i12.IAuthRepository>()));
  gh.lazySingleton<_i37.AuthenticateUseCase>(
      () => _i37.AuthenticateUseCase(get<_i12.IAuthRepository>()));
  gh.lazySingleton<_i38.CreateAccountUseCase>(
      () => _i38.CreateAccountUseCase(get<_i12.IAuthRepository>()));
  gh.lazySingleton<_i39.GetChatsUsecase>(
      () => _i39.GetChatsUsecase(get<_i15.IChatRepository>()));
  gh.lazySingleton<_i40.GetFollowersUseCase>(
      () => _i40.GetFollowersUseCase(get<_i19.IFollowersRepository>()));
  gh.lazySingleton<_i41.GetFollowingUseCase>(
      () => _i41.GetFollowingUseCase(get<_i22.IFollowingRepository>()));
  gh.lazySingleton<_i42.GetPlatformUsersUseCase>(
      () => _i42.GetPlatformUsersUseCase(get<_i29.IUserRepository>()));
  gh.lazySingleton<_i43.GetUserIdUseCase>(
      () => _i43.GetUserIdUseCase(get<_i12.IAuthRepository>()));
  gh.lazySingleton<_i44.INotificationRepository>(() =>
      _i45.NotificationRepository(get<_i24.INotificationRemoteDataProvider>(),
          get<_i28.IUserDataRemoteProvider>()));
  gh.lazySingleton<_i46.IPostRepository>(() => _i47.PostRepository(
      get<_i25.IPostRemoteDataProvider>(),
      get<_i28.IUserDataRemoteProvider>(),
      get<_i44.INotificationRepository>()));
  gh.lazySingleton<_i48.IQuickRepository>(() => _i49.QuickRepository(
      get<_i26.IQuickRemoteDataProvider>(),
      get<_i28.IUserDataRemoteProvider>()));
  gh.lazySingleton<_i50.IStoryRepository>(() => _i51.StoryRepository(
      get<_i27.IStoryDataRemoteProvider>(),
      get<_i28.IUserDataRemoteProvider>()));
  gh.lazySingleton<_i52.LikePostUseCase>(
      () => _i52.LikePostUseCase(get<_i46.IPostRepository>()));
  gh.lazySingleton<_i53.LikeQuickUseCase>(
      () => _i53.LikeQuickUseCase(get<_i48.IQuickRepository>()));
  gh.lazySingleton<_i54.SendCommentNotificationUseCase>(() =>
      _i54.SendCommentNotificationUseCase(get<_i44.INotificationRepository>()));
  gh.lazySingleton<_i55.SendFollowNotificationUseCase>(() =>
      _i55.SendFollowNotificationUseCase(get<_i44.INotificationRepository>()));
  gh.lazySingleton<_i56.SendLikeNotificationUseCase>(() =>
      _i56.SendLikeNotificationUseCase(get<_i44.INotificationRepository>()));
  gh.lazySingleton<_i57.UnLikePostUseCase>(
      () => _i57.UnLikePostUseCase(get<_i46.IPostRepository>()));
  gh.lazySingleton<_i58.UnLikeQuickUseCase>(
      () => _i58.UnLikeQuickUseCase(get<_i48.IQuickRepository>()));
  gh.lazySingleton<_i59.UpdateStoryUseCase>(
      () => _i59.UpdateStoryUseCase(get<_i50.IStoryRepository>()));
  gh.factory<_i60.UserBloc>(
      () => _i60.UserBloc(get<_i42.GetPlatformUsersUseCase>()));
  gh.lazySingleton<_i61.ViewStoryUseCase>(
      () => _i61.ViewStoryUseCase(get<_i50.IStoryRepository>()));
  gh.factory<_i62.AuthenticationBloc>(() => _i62.AuthenticationBloc(
      get<_i33.SignOutUseCase>(),
      get<_i43.GetUserIdUseCase>(),
      get<_i38.CreateAccountUseCase>(),
      get<_i32.RecoverPasswordUseCase>(),
      get<_i37.AuthenticateUseCase>(),
      get<_i36.VerifyAuthenticationUseCase>(),
      get<_i35.VerifyAndUpdateUsernameUseCase>()));
  gh.factory<_i63.ChatBloc>(() => _i63.ChatBloc(get<_i39.GetChatsUsecase>()));
  gh.lazySingleton<_i64.CreatePostUseCase>(
      () => _i64.CreatePostUseCase(get<_i46.IPostRepository>()));
  gh.lazySingleton<_i65.CreateQuickUseCase>(
      () => _i65.CreateQuickUseCase(get<_i48.IQuickRepository>()));
  gh.lazySingleton<_i66.CreateStoryUseCase>(
      () => _i66.CreateStoryUseCase(get<_i50.IStoryRepository>()));
  gh.lazySingleton<_i67.DeletePostUseCase>(
      () => _i67.DeletePostUseCase(get<_i46.IPostRepository>()));
  gh.lazySingleton<_i68.DeleteQuickUseCase>(
      () => _i68.DeleteQuickUseCase(get<_i48.IQuickRepository>()));
  gh.lazySingleton<_i69.DeleteStoryUseCase>(
      () => _i69.DeleteStoryUseCase(get<_i50.IStoryRepository>()));
  gh.factory<_i70.FollowersBloc>(
      () => _i70.FollowersBloc(get<_i40.GetFollowersUseCase>()));
  gh.factory<_i71.FollowingBloc>(
      () => _i71.FollowingBloc(get<_i41.GetFollowingUseCase>()));
  gh.lazySingleton<_i72.GetNotificationStreamUseCase>(() =>
      _i72.GetNotificationStreamUseCase(get<_i44.INotificationRepository>()));
  gh.lazySingleton<_i73.GetNotificationUseCase>(
      () => _i73.GetNotificationUseCase(get<_i44.INotificationRepository>()));
  gh.lazySingleton<_i74.GetPaginatedPostsUseCase>(
      () => _i74.GetPaginatedPostsUseCase(get<_i46.IPostRepository>()));
  gh.lazySingleton<_i75.GetPostsStreamUseCase>(
      () => _i75.GetPostsStreamUseCase(get<_i46.IPostRepository>()));
  gh.lazySingleton<_i76.GetPostsUseCase>(
      () => _i76.GetPostsUseCase(get<_i46.IPostRepository>()));
  gh.lazySingleton<_i77.GetQuickUseCase>(
      () => _i77.GetQuickUseCase(get<_i48.IQuickRepository>()));
  gh.lazySingleton<_i78.GetStoryStreamUseCase>(
      () => _i78.GetStoryStreamUseCase(get<_i50.IStoryRepository>()));
  gh.lazySingleton<_i79.GetStoryUseCase>(
      () => _i79.GetStoryUseCase(get<_i50.IStoryRepository>()));
  gh.lazySingleton<_i80.ICommentRepository>(() => _i81.CommentRepository(
      get<_i17.ICommentRemoteDataProvider>(),
      get<_i28.IUserDataRemoteProvider>(),
      get<_i44.INotificationRepository>()));
  gh.factory<_i82.NotificationBloc>(() => _i82.NotificationBloc(
      get<_i73.GetNotificationUseCase>(),
      get<_i56.SendLikeNotificationUseCase>(),
      get<_i72.GetNotificationStreamUseCase>(),
      get<_i54.SendCommentNotificationUseCase>(),
      get<_i55.SendFollowNotificationUseCase>()));
  gh.factory<_i83.PostBloc>(() => _i83.PostBloc(
      get<_i76.GetPostsUseCase>(),
      get<_i52.LikePostUseCase>(),
      get<_i64.CreatePostUseCase>(),
      get<_i57.UnLikePostUseCase>(),
      get<_i67.DeletePostUseCase>(),
      get<_i75.GetPostsStreamUseCase>(),
      get<_i74.GetPaginatedPostsUseCase>()));
  gh.lazySingleton<_i84.PostCommentUseCase>(
      () => _i84.PostCommentUseCase(get<_i80.ICommentRepository>()));
  gh.factory<_i85.QuickBloc>(() => _i85.QuickBloc(
      get<_i77.GetQuickUseCase>(),
      get<_i65.CreateQuickUseCase>(),
      get<_i68.DeleteQuickUseCase>(),
      get<_i53.LikeQuickUseCase>(),
      get<_i58.UnLikeQuickUseCase>()));
  gh.factory<_i86.StoryBloc>(() => _i86.StoryBloc(
      get<_i79.GetStoryUseCase>(),
      get<_i59.UpdateStoryUseCase>(),
      get<_i66.CreateStoryUseCase>(),
      get<_i69.DeleteStoryUseCase>(),
      get<_i78.GetStoryStreamUseCase>(),
      get<_i61.ViewStoryUseCase>()));
  gh.factory<_i87.TimelineBloc>(() => _i87.TimelineBloc(
      get<_i76.GetPostsUseCase>(),
      get<_i75.GetPostsStreamUseCase>(),
      get<_i74.GetPaginatedPostsUseCase>()));
  gh.lazySingleton<_i88.GetCommentsUseCase>(
      () => _i88.GetCommentsUseCase(get<_i80.ICommentRepository>()));
  gh.factory<_i89.CommentBloc>(() => _i89.CommentBloc(
      get<_i88.GetCommentsUseCase>(), get<_i84.PostCommentUseCase>()));
  return get;
}

class _$RegisterModule extends _i90.RegisterModule {}
