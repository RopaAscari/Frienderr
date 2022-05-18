// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_messaging/firebase_messaging.dart' as _i7;
import 'package:firebase_storage/firebase_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql_flutter/graphql_flutter.dart' as _i9;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/data/providers/auth_provider.dart' as _i10;
import '../../features/data/providers/chat_provider.dart' as _i13;
import '../../features/data/providers/comment_provider.dart' as _i16;
import '../../features/data/providers/followers_provider.dart' as _i17;
import '../../features/data/providers/following_provider.dart' as _i20;
import '../../features/data/providers/notification_provider.dart' as _i23;
import '../../features/data/providers/post_provider.dart' as _i24;
import '../../features/data/providers/quick_provider.dart' as _i25;
import '../../features/data/providers/story_provider.dart' as _i26;
import '../../features/data/providers/user_provider.dart' as _i27;
import '../../features/data/repositories/auth_repository_impl.dart' as _i12;
import '../../features/data/repositories/chat_repository_impl.dart' as _i15;
import '../../features/data/repositories/comment_repository_impl.dart' as _i80;
import '../../features/data/repositories/followers_repository_impl.dart'
    as _i19;
import '../../features/data/repositories/following_repository_impl.dart'
    as _i22;
import '../../features/data/repositories/notification_repository.dart' as _i44;
import '../../features/data/repositories/post_repository_impl.dart' as _i46;
import '../../features/data/repositories/quick_repository_impl.dart' as _i48;
import '../../features/data/repositories/story_repository_impl.dart' as _i50;
import '../../features/data/repositories/user_repository.dart' as _i29;
import '../../features/domain/repositiories/auth_repository.dart' as _i11;
import '../../features/domain/repositiories/chat_repository.dart' as _i14;
import '../../features/domain/repositiories/comment_repository.dart' as _i79;
import '../../features/domain/repositiories/followers_repository.dart' as _i18;
import '../../features/domain/repositiories/following_repository.dart' as _i21;
import '../../features/domain/repositiories/notification_repository.dart'
    as _i43;
import '../../features/domain/repositiories/post_repository.dart' as _i45;
import '../../features/domain/repositiories/quick_repository.dart' as _i47;
import '../../features/domain/repositiories/story_repository.dart' as _i49;
import '../../features/domain/repositiories/user_repository.dart' as _i28;
import '../../features/domain/usecases/auth/authenticate_usecase.dart' as _i36;
import '../../features/domain/usecases/auth/create_account_usecase.dart'
    as _i37;
import '../../features/domain/usecases/auth/get_user_id_usecase.dart' as _i42;
import '../../features/domain/usecases/auth/recover_password_usecase.dart'
    as _i31;
import '../../features/domain/usecases/auth/sign_out_usecase.dart' as _i32;
import '../../features/domain/usecases/auth/verify_and_update_username.dart'
    as _i34;
import '../../features/domain/usecases/auth/verify_authentication_usecase.dart'
    as _i35;
import '../../features/domain/usecases/auth/verify_username_existence_usecase.dart'
    as _i30;
import '../../features/domain/usecases/chat/get_chats_usecase.dart' as _i38;
import '../../features/domain/usecases/comment/get_comments_usecase.dart'
    as _i87;
import '../../features/domain/usecases/comment/post_comment_usecase.dart'
    as _i83;
import '../../features/domain/usecases/followers/get_followers_usercase.dart'
    as _i39;
import '../../features/domain/usecases/following/get_following_usercase.dart'
    as _i40;
import '../../features/domain/usecases/notification/get_notification_stream_usecase.dart'
    as _i71;
import '../../features/domain/usecases/notification/get_notifications_usecase.dart'
    as _i72;
import '../../features/domain/usecases/notification/send_comment_notification_usecase.dart'
    as _i53;
import '../../features/domain/usecases/notification/send_follow_notification_usecase.dart'
    as _i54;
import '../../features/domain/usecases/notification/send_like_notification_usecase.dart'
    as _i55;
import '../../features/domain/usecases/post/create_post_usecase.dart' as _i63;
import '../../features/domain/usecases/post/delete_post_usecase.dart' as _i66;
import '../../features/domain/usecases/post/like_post_usecase.dart' as _i51;
import '../../features/domain/usecases/post/unlike_post_usecase.dart' as _i56;
import '../../features/domain/usecases/quick/create_quick.dart' as _i64;
import '../../features/domain/usecases/quick/delete_quick.dart' as _i67;
import '../../features/domain/usecases/quick/get_quicks.dart' as _i76;
import '../../features/domain/usecases/quick/like_quick.dart' as _i52;
import '../../features/domain/usecases/quick/unlike_quick.dart' as _i57;
import '../../features/domain/usecases/story/create_story_usecase.dart' as _i65;
import '../../features/domain/usecases/story/delete_story_usecase.dart' as _i68;
import '../../features/domain/usecases/story/get_story_stream_usecase.dart'
    as _i77;
import '../../features/domain/usecases/story/get_story_usecase.dart' as _i78;
import '../../features/domain/usecases/story/update_story_usecase.dart' as _i58;
import '../../features/domain/usecases/story/view_story_usecase.dart' as _i60;
import '../../features/domain/usecases/timeline/get_paginated_posts_usecase.dart'
    as _i73;
import '../../features/domain/usecases/timeline/get_post_stream_usecase.dart'
    as _i74;
import '../../features/domain/usecases/timeline/get_posts_usecase.dart' as _i75;
import '../../features/domain/usecases/user/get_platform_users_usecase.dart'
    as _i41;
import '../../features/presentation/blocs/authenticate/authenticate_bloc.dart'
    as _i61;
import '../../features/presentation/blocs/camera/camera_bloc.dart' as _i4;
import '../../features/presentation/blocs/chat/chat_bloc.dart' as _i62;
import '../../features/presentation/blocs/comment/comment_bloc.dart' as _i88;
import '../../features/presentation/blocs/followers/followers_bloc.dart'
    as _i69;
import '../../features/presentation/blocs/following/following_bloc.dart'
    as _i70;
import '../../features/presentation/blocs/notification/notification_bloc.dart'
    as _i81;
import '../../features/presentation/blocs/post/post_bloc.dart' as _i82;
import '../../features/presentation/blocs/quick/quick_bloc.dart' as _i84;
import '../../features/presentation/blocs/story/story_bloc.dart' as _i85;
import '../../features/presentation/blocs/theme/theme_bloc.dart' as _i33;
import '../../features/presentation/blocs/timeline/timeline_bloc.dart' as _i86;
import '../../features/presentation/blocs/user/user_bloc.dart' as _i59;
import '../../features/presentation/navigation/app_router.dart' as _i3;
import 'register_module.dart' as _i89; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i7.FirebaseMessaging>(() => registerModule.messaging);
  gh.factory<_i8.FirebaseStorage>(() => registerModule.storage);
  gh.lazySingleton<_i9.GraphQLClient>(() => registerModule.gqlClient);
  gh.lazySingleton<_i10.IAuthRemoteDataProvider>(() =>
      _i10.AuthRemoteDataProvider(get<_i5.FirebaseAuth>(),
          get<_i6.FirebaseFirestore>(), get<_i7.FirebaseMessaging>()));
  gh.lazySingleton<_i11.IAuthRepository>(
      () => _i12.AuthRepository(get<_i10.IAuthRemoteDataProvider>()));
  gh.lazySingleton<_i13.IChatRemoteDataProvider>(
      () => _i13.ChatRemoteDataProvider(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i14.IChatRepository>(
      () => _i15.ChatRepository(get<_i13.IChatRemoteDataProvider>()));
  gh.lazySingleton<_i16.ICommentRemoteDataProvider>(
      () => _i16.CommentRemoteDataProvider(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i17.IFollowersRemoteDataProvider>(
      () => _i17.FollowersRemoteDataProvider(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i18.IFollowersRepository>(
      () => _i19.FollowersRepository(get<_i17.IFollowersRemoteDataProvider>()));
  gh.lazySingleton<_i20.IFollowingRemoteDataProvider>(
      () => _i20.FollowingRemoteDataProvider(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i21.IFollowingRepository>(
      () => _i22.FollowingRepository(get<_i20.IFollowingRemoteDataProvider>()));
  gh.lazySingleton<_i23.INotificationRemoteDataProvider>(() =>
      _i23.NotificationRemoteDataProvider(get<_i5.FirebaseAuth>(),
          get<_i9.GraphQLClient>(), get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i24.IPostRemoteDataProvider>(() =>
      _i24.PostRemoteDataProvider(get<_i6.FirebaseFirestore>(),
          get<_i8.FirebaseStorage>(), get<_i5.FirebaseAuth>()));
  gh.lazySingleton<_i25.IQuickRemoteDataProvider>(() =>
      _i25.QuickRemoteDataProvider(get<_i6.FirebaseFirestore>(),
          get<_i5.FirebaseAuth>(), get<_i8.FirebaseStorage>()));
  gh.lazySingleton<_i26.IStoryDataRemoteProvider>(() =>
      _i26.StoryDataRemoteProvider(get<_i6.FirebaseFirestore>(),
          get<_i5.FirebaseAuth>(), get<_i8.FirebaseStorage>()));
  gh.lazySingleton<_i27.IUserDataRemoteProvider>(
      () => _i27.UserDataRemoteProvider(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i28.IUserRepository>(
      () => _i29.UserRepository(get<_i27.IUserDataRemoteProvider>()));
  gh.lazySingleton<_i30.RecoverPasswordUseCase>(
      () => _i30.RecoverPasswordUseCase(get<_i11.IAuthRepository>()));
  gh.lazySingleton<_i31.RecoverPasswordUseCase>(
      () => _i31.RecoverPasswordUseCase(get<_i11.IAuthRepository>()));
  gh.lazySingleton<_i32.SignOutUseCase>(
      () => _i32.SignOutUseCase(get<_i11.IAuthRepository>()));
  gh.factory<_i33.ThemeBloc>(() => _i33.ThemeBloc());
  gh.lazySingleton<_i34.VerifyAndUpdateUsernameUseCase>(
      () => _i34.VerifyAndUpdateUsernameUseCase(get<_i11.IAuthRepository>()));
  gh.lazySingleton<_i35.VerifyAuthenticationUseCase>(
      () => _i35.VerifyAuthenticationUseCase(get<_i11.IAuthRepository>()));
  gh.lazySingleton<_i36.AuthenticateUseCase>(
      () => _i36.AuthenticateUseCase(get<_i11.IAuthRepository>()));
  gh.lazySingleton<_i37.CreateAccountUseCase>(
      () => _i37.CreateAccountUseCase(get<_i11.IAuthRepository>()));
  gh.lazySingleton<_i38.GetChatsUsecase>(
      () => _i38.GetChatsUsecase(get<_i14.IChatRepository>()));
  gh.lazySingleton<_i39.GetFollowersUseCase>(
      () => _i39.GetFollowersUseCase(get<_i18.IFollowersRepository>()));
  gh.lazySingleton<_i40.GetFollowingUseCase>(
      () => _i40.GetFollowingUseCase(get<_i21.IFollowingRepository>()));
  gh.lazySingleton<_i41.GetPlatformUsersUseCase>(
      () => _i41.GetPlatformUsersUseCase(get<_i28.IUserRepository>()));
  gh.lazySingleton<_i42.GetUserIdUseCase>(
      () => _i42.GetUserIdUseCase(get<_i11.IAuthRepository>()));
  gh.lazySingleton<_i43.INotificationRepository>(() =>
      _i44.NotificationRepository(get<_i23.INotificationRemoteDataProvider>(),
          get<_i27.IUserDataRemoteProvider>()));
  gh.lazySingleton<_i45.IPostRepository>(() => _i46.PostRepository(
      get<_i24.IPostRemoteDataProvider>(),
      get<_i27.IUserDataRemoteProvider>(),
      get<_i43.INotificationRepository>()));
  gh.lazySingleton<_i47.IQuickRepository>(() => _i48.QuickRepository(
      get<_i25.IQuickRemoteDataProvider>(),
      get<_i27.IUserDataRemoteProvider>()));
  gh.lazySingleton<_i49.IStoryRepository>(() => _i50.StoryRepository(
      get<_i26.IStoryDataRemoteProvider>(),
      get<_i27.IUserDataRemoteProvider>()));
  gh.lazySingleton<_i51.LikePostUseCase>(
      () => _i51.LikePostUseCase(get<_i45.IPostRepository>()));
  gh.lazySingleton<_i52.LikeQuickUseCase>(
      () => _i52.LikeQuickUseCase(get<_i47.IQuickRepository>()));
  gh.lazySingleton<_i53.SendCommentNotificationUseCase>(() =>
      _i53.SendCommentNotificationUseCase(get<_i43.INotificationRepository>()));
  gh.lazySingleton<_i54.SendFollowNotificationUseCase>(() =>
      _i54.SendFollowNotificationUseCase(get<_i43.INotificationRepository>()));
  gh.lazySingleton<_i55.SendLikeNotificationUseCase>(() =>
      _i55.SendLikeNotificationUseCase(get<_i43.INotificationRepository>()));
  gh.lazySingleton<_i56.UnLikePostUseCase>(
      () => _i56.UnLikePostUseCase(get<_i45.IPostRepository>()));
  gh.lazySingleton<_i57.UnLikeQuickUseCase>(
      () => _i57.UnLikeQuickUseCase(get<_i47.IQuickRepository>()));
  gh.lazySingleton<_i58.UpdateStoryUseCase>(
      () => _i58.UpdateStoryUseCase(get<_i49.IStoryRepository>()));
  gh.factory<_i59.UserBloc>(
      () => _i59.UserBloc(get<_i41.GetPlatformUsersUseCase>()));
  gh.lazySingleton<_i60.ViewStoryUseCase>(
      () => _i60.ViewStoryUseCase(get<_i49.IStoryRepository>()));
  gh.factory<_i61.AuthenticationBloc>(() => _i61.AuthenticationBloc(
      get<_i32.SignOutUseCase>(),
      get<_i42.GetUserIdUseCase>(),
      get<_i37.CreateAccountUseCase>(),
      get<_i30.RecoverPasswordUseCase>(),
      get<_i36.AuthenticateUseCase>(),
      get<_i35.VerifyAuthenticationUseCase>(),
      get<_i34.VerifyAndUpdateUsernameUseCase>()));
  gh.factory<_i62.ChatBloc>(() => _i62.ChatBloc(get<_i38.GetChatsUsecase>()));
  gh.lazySingleton<_i63.CreatePostUseCase>(
      () => _i63.CreatePostUseCase(get<_i45.IPostRepository>()));
  gh.lazySingleton<_i64.CreateQuickUseCase>(
      () => _i64.CreateQuickUseCase(get<_i47.IQuickRepository>()));
  gh.lazySingleton<_i65.CreateStoryUseCase>(
      () => _i65.CreateStoryUseCase(get<_i49.IStoryRepository>()));
  gh.lazySingleton<_i66.DeletePostUseCase>(
      () => _i66.DeletePostUseCase(get<_i45.IPostRepository>()));
  gh.lazySingleton<_i67.DeleteQuickUseCase>(
      () => _i67.DeleteQuickUseCase(get<_i47.IQuickRepository>()));
  gh.lazySingleton<_i68.DeleteStoryUseCase>(
      () => _i68.DeleteStoryUseCase(get<_i49.IStoryRepository>()));
  gh.factory<_i69.FollowersBloc>(
      () => _i69.FollowersBloc(get<_i39.GetFollowersUseCase>()));
  gh.factory<_i70.FollowingBloc>(
      () => _i70.FollowingBloc(get<_i40.GetFollowingUseCase>()));
  gh.lazySingleton<_i71.GetNotificationStreamUseCase>(() =>
      _i71.GetNotificationStreamUseCase(get<_i43.INotificationRepository>()));
  gh.lazySingleton<_i72.GetNotificationUseCase>(
      () => _i72.GetNotificationUseCase(get<_i43.INotificationRepository>()));
  gh.lazySingleton<_i73.GetPaginatedPostsUseCase>(
      () => _i73.GetPaginatedPostsUseCase(get<_i45.IPostRepository>()));
  gh.lazySingleton<_i74.GetPostsStreamUseCase>(
      () => _i74.GetPostsStreamUseCase(get<_i45.IPostRepository>()));
  gh.lazySingleton<_i75.GetPostsUseCase>(
      () => _i75.GetPostsUseCase(get<_i45.IPostRepository>()));
  gh.lazySingleton<_i76.GetQuickUseCase>(
      () => _i76.GetQuickUseCase(get<_i47.IQuickRepository>()));
  gh.lazySingleton<_i77.GetStoryStreamUseCase>(
      () => _i77.GetStoryStreamUseCase(get<_i49.IStoryRepository>()));
  gh.lazySingleton<_i78.GetStoryUseCase>(
      () => _i78.GetStoryUseCase(get<_i49.IStoryRepository>()));
  gh.lazySingleton<_i79.ICommentRepository>(() => _i80.CommentRepository(
      get<_i16.ICommentRemoteDataProvider>(),
      get<_i27.IUserDataRemoteProvider>(),
      get<_i43.INotificationRepository>()));
  gh.factory<_i81.NotificationBloc>(() => _i81.NotificationBloc(
      get<_i72.GetNotificationUseCase>(),
      get<_i55.SendLikeNotificationUseCase>(),
      get<_i71.GetNotificationStreamUseCase>(),
      get<_i53.SendCommentNotificationUseCase>(),
      get<_i54.SendFollowNotificationUseCase>()));
  gh.factory<_i82.PostBloc>(() => _i82.PostBloc(
      get<_i75.GetPostsUseCase>(),
      get<_i51.LikePostUseCase>(),
      get<_i63.CreatePostUseCase>(),
      get<_i56.UnLikePostUseCase>(),
      get<_i66.DeletePostUseCase>(),
      get<_i74.GetPostsStreamUseCase>(),
      get<_i73.GetPaginatedPostsUseCase>()));
  gh.lazySingleton<_i83.PostCommentUseCase>(
      () => _i83.PostCommentUseCase(get<_i79.ICommentRepository>()));
  gh.factory<_i84.QuickBloc>(() => _i84.QuickBloc(
      get<_i76.GetQuickUseCase>(),
      get<_i64.CreateQuickUseCase>(),
      get<_i67.DeleteQuickUseCase>(),
      get<_i52.LikeQuickUseCase>(),
      get<_i57.UnLikeQuickUseCase>()));
  gh.factory<_i85.StoryBloc>(() => _i85.StoryBloc(
      get<_i78.GetStoryUseCase>(),
      get<_i58.UpdateStoryUseCase>(),
      get<_i65.CreateStoryUseCase>(),
      get<_i68.DeleteStoryUseCase>(),
      get<_i77.GetStoryStreamUseCase>(),
      get<_i60.ViewStoryUseCase>()));
  gh.factory<_i86.TimelineBloc>(() => _i86.TimelineBloc(
      get<_i75.GetPostsUseCase>(),
      get<_i74.GetPostsStreamUseCase>(),
      get<_i73.GetPaginatedPostsUseCase>()));
  gh.lazySingleton<_i87.GetCommentsUseCase>(
      () => _i87.GetCommentsUseCase(get<_i79.ICommentRepository>()));
  gh.factory<_i88.CommentBloc>(() => _i88.CommentBloc(
      get<_i87.GetCommentsUseCase>(), get<_i83.PostCommentUseCase>()));
  return get;
}

class _$RegisterModule extends _i89.RegisterModule {}
