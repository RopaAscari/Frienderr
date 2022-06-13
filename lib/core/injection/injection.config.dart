// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_messaging/firebase_messaging.dart' as _i7;
import 'package:firebase_storage/firebase_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_mlkit_smart_reply/google_mlkit_smart_reply.dart' as _i31;
import 'package:graphql_flutter/graphql_flutter.dart' as _i9;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/data/providers/auth_provider.dart' as _i10;
import '../../features/data/providers/chat_provider.dart' as _i13;
import '../../features/data/providers/comment_provider.dart' as _i14;
import '../../features/data/providers/followers_provider.dart' as _i15;
import '../../features/data/providers/following_provider.dart' as _i18;
import '../../features/data/providers/message_provider.dart' as _i47;
import '../../features/data/providers/notification_provider.dart' as _i21;
import '../../features/data/providers/post_provider.dart' as _i22;
import '../../features/data/providers/quick_provider.dart' as _i23;
import '../../features/data/providers/story_provider.dart' as _i24;
import '../../features/data/providers/user_provider.dart' as _i25;
import '../../features/data/repositories/auth_repository_impl.dart' as _i12;
import '../../features/data/repositories/chat_repository_impl.dart' as _i46;
import '../../features/data/repositories/comment_repository_impl.dart' as _i101;
import '../../features/data/repositories/followers_repository_impl.dart'
    as _i17;
import '../../features/data/repositories/following_repository_impl.dart'
    as _i20;
import '../../features/data/repositories/message_repository_impl.dart' as _i49;
import '../../features/data/repositories/notification_repository.dart' as _i51;
import '../../features/data/repositories/post_repository_impl.dart' as _i53;
import '../../features/data/repositories/quick_repository_impl.dart' as _i55;
import '../../features/data/repositories/story_repository_impl.dart' as _i57;
import '../../features/data/repositories/user_repository.dart' as _i27;
import '../../features/domain/repositiories/auth_repository.dart' as _i11;
import '../../features/domain/repositiories/chat_repository.dart' as _i45;
import '../../features/domain/repositiories/comment_repository.dart' as _i100;
import '../../features/domain/repositiories/followers_repository.dart' as _i16;
import '../../features/domain/repositiories/following_repository.dart' as _i19;
import '../../features/domain/repositiories/messaging_repository.dart' as _i48;
import '../../features/domain/repositiories/notification_repository.dart'
    as _i50;
import '../../features/domain/repositiories/post_repository.dart' as _i52;
import '../../features/domain/repositiories/quick_repository.dart' as _i54;
import '../../features/domain/repositiories/story_repository.dart' as _i56;
import '../../features/domain/repositiories/user_repository.dart' as _i26;
import '../../features/domain/usecases/auth/authenticate_usecase.dart' as _i36;
import '../../features/domain/usecases/auth/create_account_usecase.dart'
    as _i37;
import '../../features/domain/usecases/auth/get_user_id_usecase.dart' as _i43;
import '../../features/domain/usecases/auth/recover_password_usecase.dart'
    as _i29;
import '../../features/domain/usecases/auth/sign_out_usecase.dart' as _i30;
import '../../features/domain/usecases/auth/verify_and_update_username.dart'
    as _i34;
import '../../features/domain/usecases/auth/verify_authentication_usecase.dart'
    as _i35;
import '../../features/domain/usecases/auth/verify_username_existence_usecase.dart'
    as _i28;
import '../../features/domain/usecases/chat/delete_chat_usecase.dart' as _i80;
import '../../features/domain/usecases/chat/get_chat_scream_usecase.dart'
    as _i87;
import '../../features/domain/usecases/chat/get_chats_usecase.dart' as _i88;
import '../../features/domain/usecases/chat/instantiate_chat_usecase.dart'
    as _i58;
import '../../features/domain/usecases/chat/start_typing_usecase.dart' as _i68;
import '../../features/domain/usecases/chat/stop_typing_usecase.dart' as _i69;
import '../../features/domain/usecases/comment/get_comments_usecase.dart'
    as _i112;
import '../../features/domain/usecases/comment/post_comment_usecase.dart'
    as _i105;
import '../../features/domain/usecases/followers/get_account_followers_usecase.dart'
    as _i39;
import '../../features/domain/usecases/followers/get_followers_usercase.dart'
    as _i40;
import '../../features/domain/usecases/following/follower_user_usercase.dart'
    as _i38;
import '../../features/domain/usecases/following/get_following_usercase.dart'
    as _i41;
import '../../features/domain/usecases/following/unfollow_user_usecase.dart'
    as _i33;
import '../../features/domain/usecases/message/delete_message_usecase.dart'
    as _i81;
import '../../features/domain/usecases/message/get_message_stream_usecase.dart'
    as _i89;
import '../../features/domain/usecases/message/seen_message_usecase.dart'
    as _i61;
import '../../features/domain/usecases/message/send_audio_message_usecase.dart'
    as _i62;
import '../../features/domain/usecases/message/send_message_usecase.dart'
    as _i66;
import '../../features/domain/usecases/message/send_multimedia_message_usecase.dart'
    as _i67;
import '../../features/domain/usecases/message/update_last_message.dart'
    as _i72;
import '../../features/domain/usecases/notification/get_notification_stream_usecase.dart'
    as _i90;
import '../../features/domain/usecases/notification/get_notifications_usecase.dart'
    as _i91;
import '../../features/domain/usecases/notification/send_comment_notification_usecase.dart'
    as _i63;
import '../../features/domain/usecases/notification/send_follow_notification_usecase.dart'
    as _i64;
import '../../features/domain/usecases/notification/send_like_notification_usecase.dart'
    as _i65;
import '../../features/domain/usecases/post/create_post_usecase.dart' as _i77;
import '../../features/domain/usecases/post/delete_post_usecase.dart' as _i82;
import '../../features/domain/usecases/post/get_user_posts_usecase.dart'
    as _i98;
import '../../features/domain/usecases/post/like_post_usecase.dart' as _i59;
import '../../features/domain/usecases/post/unlike_post_usecase.dart' as _i70;
import '../../features/domain/usecases/quick/create_quick.dart' as _i78;
import '../../features/domain/usecases/quick/delete_quick.dart' as _i83;
import '../../features/domain/usecases/quick/get_quicks.dart' as _i95;
import '../../features/domain/usecases/quick/get_user_snaps.dart' as _i99;
import '../../features/domain/usecases/quick/like_quick.dart' as _i60;
import '../../features/domain/usecases/quick/unlike_quick.dart' as _i71;
import '../../features/domain/usecases/story/create_story_usecase.dart' as _i79;
import '../../features/domain/usecases/story/delete_story_usecase.dart' as _i84;
import '../../features/domain/usecases/story/get_story_stream_usecase.dart'
    as _i96;
import '../../features/domain/usecases/story/get_story_usecase.dart' as _i97;
import '../../features/domain/usecases/story/update_story_usecase.dart' as _i73;
import '../../features/domain/usecases/story/view_story_usecase.dart' as _i75;
import '../../features/domain/usecases/timeline/get_paginated_posts_usecase.dart'
    as _i92;
import '../../features/domain/usecases/timeline/get_post_stream_usecase.dart'
    as _i93;
import '../../features/domain/usecases/timeline/get_posts_usecase.dart' as _i94;
import '../../features/domain/usecases/user/get_platform_users_usecase.dart'
    as _i42;
import '../../features/domain/usecases/user/get_user_usecase.dart' as _i44;
import '../../features/presentation/blocs/account/profile/profile_account_bloc.dart'
    as _i106;
import '../../features/presentation/blocs/account/user/user_account_bloc.dart'
    as _i110;
import '../../features/presentation/blocs/authenticate/authenticate_bloc.dart'
    as _i76;
import '../../features/presentation/blocs/camera/camera_bloc.dart' as _i4;
import '../../features/presentation/blocs/chat/chat_bloc.dart' as _i111;
import '../../features/presentation/blocs/comment/comment_bloc.dart' as _i113;
import '../../features/presentation/blocs/followers/followers_bloc.dart'
    as _i85;
import '../../features/presentation/blocs/following/following_bloc.dart'
    as _i86;
import '../../features/presentation/blocs/messaging/messaging_bloc.dart'
    as _i102;
import '../../features/presentation/blocs/notification/notification_bloc.dart'
    as _i103;
import '../../features/presentation/blocs/post/post_bloc.dart' as _i104;
import '../../features/presentation/blocs/quick/quick_bloc.dart' as _i107;
import '../../features/presentation/blocs/story/story_bloc.dart' as _i108;
import '../../features/presentation/blocs/theme/theme_bloc.dart' as _i32;
import '../../features/presentation/blocs/timeline/timeline_bloc.dart' as _i109;
import '../../features/presentation/blocs/user/user_bloc.dart' as _i74;
import '../../features/presentation/navigation/app_router.dart' as _i3;
import 'register_module.dart' as _i114; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i13.IChatRemoteDataProvider>(() =>
      _i13.ChatRemoteDataProvider(
          get<_i5.FirebaseAuth>(), get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i14.ICommentRemoteDataProvider>(
      () => _i14.CommentRemoteDataProvider(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i15.IFollowersRemoteDataProvider>(
      () => _i15.FollowersRemoteDataProvider(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i16.IFollowersRepository>(
      () => _i17.FollowersRepository(get<_i15.IFollowersRemoteDataProvider>()));
  gh.lazySingleton<_i18.IFollowingRemoteDataProvider>(
      () => _i18.FollowingRemoteDataProvider(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i19.IFollowingRepository>(() => _i20.FollowingRepository(
      get<_i18.IFollowingRemoteDataProvider>(),
      get<_i15.IFollowersRemoteDataProvider>()));
  gh.lazySingleton<_i21.INotificationRemoteDataProvider>(() =>
      _i21.NotificationRemoteDataProvider(get<_i5.FirebaseAuth>(),
          get<_i9.GraphQLClient>(), get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i22.IPostRemoteDataProvider>(() =>
      _i22.PostRemoteDataProvider(get<_i6.FirebaseFirestore>(),
          get<_i8.FirebaseStorage>(), get<_i5.FirebaseAuth>()));
  gh.lazySingleton<_i23.IQuickRemoteDataProvider>(() =>
      _i23.QuickRemoteDataProvider(get<_i6.FirebaseFirestore>(),
          get<_i5.FirebaseAuth>(), get<_i8.FirebaseStorage>()));
  gh.lazySingleton<_i24.IStoryDataRemoteProvider>(() =>
      _i24.StoryDataRemoteProvider(get<_i6.FirebaseFirestore>(),
          get<_i5.FirebaseAuth>(), get<_i8.FirebaseStorage>()));
  gh.lazySingleton<_i25.IUserDataRemoteProvider>(
      () => _i25.UserDataRemoteProvider(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i26.IUserRepository>(
      () => _i27.UserRepository(get<_i25.IUserDataRemoteProvider>()));
  gh.lazySingleton<_i28.RecoverPasswordUseCase>(
      () => _i28.RecoverPasswordUseCase(get<_i11.IAuthRepository>()));
  gh.lazySingleton<_i29.RecoverPasswordUseCase>(
      () => _i29.RecoverPasswordUseCase(get<_i11.IAuthRepository>()));
  gh.lazySingleton<_i30.SignOutUseCase>(
      () => _i30.SignOutUseCase(get<_i11.IAuthRepository>()));
  gh.factory<_i31.SmartReply>(() => registerModule.smartReply);
  gh.factory<_i32.ThemeBloc>(() => _i32.ThemeBloc());
  gh.lazySingleton<_i33.UnFollowUserUseCase>(
      () => _i33.UnFollowUserUseCase(get<_i19.IFollowingRepository>()));
  gh.lazySingleton<_i34.VerifyAndUpdateUsernameUseCase>(
      () => _i34.VerifyAndUpdateUsernameUseCase(get<_i11.IAuthRepository>()));
  gh.lazySingleton<_i35.VerifyAuthenticationUseCase>(
      () => _i35.VerifyAuthenticationUseCase(get<_i11.IAuthRepository>()));
  gh.lazySingleton<_i36.AuthenticateUseCase>(
      () => _i36.AuthenticateUseCase(get<_i11.IAuthRepository>()));
  gh.lazySingleton<_i37.CreateAccountUseCase>(
      () => _i37.CreateAccountUseCase(get<_i11.IAuthRepository>()));
  gh.lazySingleton<_i38.FollowUserUseCase>(
      () => _i38.FollowUserUseCase(get<_i19.IFollowingRepository>()));
  gh.lazySingleton<_i39.GetAccountFollowersUseCase>(
      () => _i39.GetAccountFollowersUseCase(get<_i16.IFollowersRepository>()));
  gh.lazySingleton<_i40.GetFollowersUseCase>(
      () => _i40.GetFollowersUseCase(get<_i19.IFollowingRepository>()));
  gh.lazySingleton<_i41.GetFollowingUseCase>(
      () => _i41.GetFollowingUseCase(get<_i19.IFollowingRepository>()));
  gh.lazySingleton<_i42.GetPlatformUsersUseCase>(
      () => _i42.GetPlatformUsersUseCase(get<_i26.IUserRepository>()));
  gh.lazySingleton<_i43.GetUserIdUseCase>(
      () => _i43.GetUserIdUseCase(get<_i11.IAuthRepository>()));
  gh.lazySingleton<_i44.GetUserUseCase>(
      () => _i44.GetUserUseCase(get<_i26.IUserRepository>()));
  gh.lazySingleton<_i45.IChatRepository>(() => _i46.ChatRepository(
      get<_i13.IChatRemoteDataProvider>(),
      get<_i25.IUserDataRemoteProvider>()));
  gh.lazySingleton<_i47.IMessageRemoteDataProvider>(() =>
      _i47.MessageRemoteDataProvider(
          get<_i31.SmartReply>(),
          get<_i6.FirebaseFirestore>(),
          get<_i5.FirebaseAuth>(),
          get<_i8.FirebaseStorage>()));
  gh.lazySingleton<_i48.IMessageRepository>(() => _i49.MessageRepository(
      get<_i47.IMessageRemoteDataProvider>(),
      get<_i13.IChatRemoteDataProvider>()));
  gh.lazySingleton<_i50.INotificationRepository>(() =>
      _i51.NotificationRepository(get<_i21.INotificationRemoteDataProvider>(),
          get<_i25.IUserDataRemoteProvider>()));
  gh.lazySingleton<_i52.IPostRepository>(() => _i53.PostRepository(
      get<_i22.IPostRemoteDataProvider>(),
      get<_i25.IUserDataRemoteProvider>(),
      get<_i50.INotificationRepository>()));
  gh.lazySingleton<_i54.IQuickRepository>(() => _i55.QuickRepository(
      get<_i23.IQuickRemoteDataProvider>(),
      get<_i25.IUserDataRemoteProvider>()));
  gh.lazySingleton<_i56.IStoryRepository>(() => _i57.StoryRepository(
      get<_i24.IStoryDataRemoteProvider>(),
      get<_i25.IUserDataRemoteProvider>()));
  gh.lazySingleton<_i58.InstantiateChatUseCase>(
      () => _i58.InstantiateChatUseCase(get<_i45.IChatRepository>()));
  gh.lazySingleton<_i59.LikePostUseCase>(
      () => _i59.LikePostUseCase(get<_i52.IPostRepository>()));
  gh.lazySingleton<_i60.LikeQuickUseCase>(
      () => _i60.LikeQuickUseCase(get<_i54.IQuickRepository>()));
  gh.lazySingleton<_i61.SeenMessageUseCase>(
      () => _i61.SeenMessageUseCase(get<_i48.IMessageRepository>()));
  gh.lazySingleton<_i62.SendAudioMessageUseCase>(
      () => _i62.SendAudioMessageUseCase(get<_i48.IMessageRepository>()));
  gh.lazySingleton<_i63.SendCommentNotificationUseCase>(() =>
      _i63.SendCommentNotificationUseCase(get<_i50.INotificationRepository>()));
  gh.lazySingleton<_i64.SendFollowNotificationUseCase>(() =>
      _i64.SendFollowNotificationUseCase(get<_i50.INotificationRepository>()));
  gh.lazySingleton<_i65.SendLikeNotificationUseCase>(() =>
      _i65.SendLikeNotificationUseCase(get<_i50.INotificationRepository>()));
  gh.lazySingleton<_i66.SendMessageUseCase>(
      () => _i66.SendMessageUseCase(get<_i48.IMessageRepository>()));
  gh.lazySingleton<_i67.SendMultimediaMessageUseCase>(
      () => _i67.SendMultimediaMessageUseCase(get<_i48.IMessageRepository>()));
  gh.lazySingleton<_i68.StartTypingUseCase>(
      () => _i68.StartTypingUseCase(get<_i45.IChatRepository>()));
  gh.lazySingleton<_i69.StopTypingUseCase>(
      () => _i69.StopTypingUseCase(get<_i45.IChatRepository>()));
  gh.lazySingleton<_i70.UnLikePostUseCase>(
      () => _i70.UnLikePostUseCase(get<_i52.IPostRepository>()));
  gh.lazySingleton<_i71.UnLikeQuickUseCase>(
      () => _i71.UnLikeQuickUseCase(get<_i54.IQuickRepository>()));
  gh.lazySingleton<_i72.UpdatePreviousMessageUseCase>(
      () => _i72.UpdatePreviousMessageUseCase(get<_i48.IMessageRepository>()));
  gh.lazySingleton<_i73.UpdateStoryUseCase>(
      () => _i73.UpdateStoryUseCase(get<_i56.IStoryRepository>()));
  gh.factory<_i74.UserBloc>(
      () => _i74.UserBloc(get<_i42.GetPlatformUsersUseCase>()));
  gh.lazySingleton<_i75.ViewStoryUseCase>(
      () => _i75.ViewStoryUseCase(get<_i56.IStoryRepository>()));
  gh.factory<_i76.AuthenticationBloc>(() => _i76.AuthenticationBloc(
      get<_i30.SignOutUseCase>(),
      get<_i43.GetUserIdUseCase>(),
      get<_i37.CreateAccountUseCase>(),
      get<_i28.RecoverPasswordUseCase>(),
      get<_i36.AuthenticateUseCase>(),
      get<_i35.VerifyAuthenticationUseCase>(),
      get<_i34.VerifyAndUpdateUsernameUseCase>()));
  gh.lazySingleton<_i77.CreatePostUseCase>(
      () => _i77.CreatePostUseCase(get<_i52.IPostRepository>()));
  gh.lazySingleton<_i78.CreateQuickUseCase>(
      () => _i78.CreateQuickUseCase(get<_i54.IQuickRepository>()));
  gh.lazySingleton<_i79.CreateStoryUseCase>(
      () => _i79.CreateStoryUseCase(get<_i56.IStoryRepository>()));
  gh.lazySingleton<_i80.DeleteChatUseCase>(
      () => _i80.DeleteChatUseCase(get<_i45.IChatRepository>()));
  gh.lazySingleton<_i81.DeleteMessageUseCase>(
      () => _i81.DeleteMessageUseCase(get<_i48.IMessageRepository>()));
  gh.lazySingleton<_i82.DeletePostUseCase>(
      () => _i82.DeletePostUseCase(get<_i52.IPostRepository>()));
  gh.lazySingleton<_i83.DeleteQuickUseCase>(
      () => _i83.DeleteQuickUseCase(get<_i54.IQuickRepository>()));
  gh.lazySingleton<_i84.DeleteStoryUseCase>(
      () => _i84.DeleteStoryUseCase(get<_i56.IStoryRepository>()));
  gh.factory<_i85.FollowersBloc>(() => _i85.FollowersBloc(
      get<_i40.GetFollowersUseCase>(),
      get<_i38.FollowUserUseCase>(),
      get<_i33.UnFollowUserUseCase>()));
  gh.factory<_i86.FollowingBloc>(
      () => _i86.FollowingBloc(get<_i41.GetFollowingUseCase>()));
  gh.lazySingleton<_i87.GetChatScreamUsecase>(
      () => _i87.GetChatScreamUsecase(get<_i45.IChatRepository>()));
  gh.lazySingleton<_i88.GetChatsUseCase>(
      () => _i88.GetChatsUseCase(get<_i45.IChatRepository>()));
  gh.lazySingleton<_i89.GetMessageStreamUsecase>(
      () => _i89.GetMessageStreamUsecase(get<_i48.IMessageRepository>()));
  gh.lazySingleton<_i90.GetNotificationStreamUseCase>(() =>
      _i90.GetNotificationStreamUseCase(get<_i50.INotificationRepository>()));
  gh.lazySingleton<_i91.GetNotificationUseCase>(
      () => _i91.GetNotificationUseCase(get<_i50.INotificationRepository>()));
  gh.lazySingleton<_i92.GetPaginatedPostsUseCase>(
      () => _i92.GetPaginatedPostsUseCase(get<_i52.IPostRepository>()));
  gh.lazySingleton<_i93.GetPostsStreamUseCase>(
      () => _i93.GetPostsStreamUseCase(get<_i52.IPostRepository>()));
  gh.lazySingleton<_i94.GetPostsUseCase>(
      () => _i94.GetPostsUseCase(get<_i52.IPostRepository>()));
  gh.lazySingleton<_i95.GetQuickUseCase>(
      () => _i95.GetQuickUseCase(get<_i54.IQuickRepository>()));
  gh.lazySingleton<_i96.GetStoryStreamUseCase>(
      () => _i96.GetStoryStreamUseCase(get<_i56.IStoryRepository>()));
  gh.lazySingleton<_i97.GetStoryUseCase>(
      () => _i97.GetStoryUseCase(get<_i56.IStoryRepository>()));
  gh.lazySingleton<_i98.GetUserPostsUseCase>(
      () => _i98.GetUserPostsUseCase(get<_i52.IPostRepository>()));
  gh.lazySingleton<_i99.GetUserSnapsUseCase>(
      () => _i99.GetUserSnapsUseCase(get<_i54.IQuickRepository>()));
  gh.lazySingleton<_i100.ICommentRepository>(() => _i101.CommentRepository(
      get<_i14.ICommentRemoteDataProvider>(),
      get<_i25.IUserDataRemoteProvider>(),
      get<_i50.INotificationRepository>()));
  gh.factory<_i102.MessageBloc>(() => _i102.MessageBloc(
      get<_i66.SendMessageUseCase>(),
      get<_i61.SeenMessageUseCase>(),
      get<_i81.DeleteMessageUseCase>(),
      get<_i62.SendAudioMessageUseCase>(),
      get<_i89.GetMessageStreamUsecase>(),
      get<_i72.UpdatePreviousMessageUseCase>(),
      get<_i67.SendMultimediaMessageUseCase>()));
  gh.factory<_i103.NotificationBloc>(() => _i103.NotificationBloc(
      get<_i91.GetNotificationUseCase>(),
      get<_i65.SendLikeNotificationUseCase>(),
      get<_i90.GetNotificationStreamUseCase>(),
      get<_i63.SendCommentNotificationUseCase>(),
      get<_i64.SendFollowNotificationUseCase>()));
  gh.factory<_i104.PostBloc>(() => _i104.PostBloc(
      get<_i94.GetPostsUseCase>(),
      get<_i59.LikePostUseCase>(),
      get<_i77.CreatePostUseCase>(),
      get<_i70.UnLikePostUseCase>(),
      get<_i82.DeletePostUseCase>(),
      get<_i93.GetPostsStreamUseCase>(),
      get<_i92.GetPaginatedPostsUseCase>()));
  gh.lazySingleton<_i105.PostCommentUseCase>(
      () => _i105.PostCommentUseCase(get<_i100.ICommentRepository>()));
  gh.factory<_i106.ProfileAccountBloc>(() => _i106.ProfileAccountBloc(
      get<_i98.GetUserPostsUseCase>(),
      get<_i39.GetAccountFollowersUseCase>(),
      get<_i41.GetFollowingUseCase>(),
      get<_i99.GetUserSnapsUseCase>(),
      get<_i44.GetUserUseCase>()));
  gh.factory<_i107.QuickBloc>(() => _i107.QuickBloc(
      get<_i95.GetQuickUseCase>(),
      get<_i78.CreateQuickUseCase>(),
      get<_i83.DeleteQuickUseCase>(),
      get<_i60.LikeQuickUseCase>(),
      get<_i71.UnLikeQuickUseCase>()));
  gh.factory<_i108.StoryBloc>(() => _i108.StoryBloc(
      get<_i97.GetStoryUseCase>(),
      get<_i73.UpdateStoryUseCase>(),
      get<_i79.CreateStoryUseCase>(),
      get<_i84.DeleteStoryUseCase>(),
      get<_i96.GetStoryStreamUseCase>(),
      get<_i75.ViewStoryUseCase>()));
  gh.factory<_i109.TimelineBloc>(() => _i109.TimelineBloc(
      get<_i94.GetPostsUseCase>(),
      get<_i93.GetPostsStreamUseCase>(),
      get<_i92.GetPaginatedPostsUseCase>()));
  gh.factory<_i110.UserAccountBloc>(() => _i110.UserAccountBloc(
      get<_i98.GetUserPostsUseCase>(),
      get<_i39.GetAccountFollowersUseCase>(),
      get<_i41.GetFollowingUseCase>(),
      get<_i99.GetUserSnapsUseCase>(),
      get<_i44.GetUserUseCase>()));
  gh.factory<_i111.ChatBloc>(() => _i111.ChatBloc(
      get<_i88.GetChatsUseCase>(),
      get<_i69.StopTypingUseCase>(),
      get<_i68.StartTypingUseCase>(),
      get<_i80.DeleteChatUseCase>(),
      get<_i87.GetChatScreamUsecase>(),
      get<_i58.InstantiateChatUseCase>()));
  gh.lazySingleton<_i112.GetCommentsUseCase>(
      () => _i112.GetCommentsUseCase(get<_i100.ICommentRepository>()));
  gh.factory<_i113.CommentBloc>(() => _i113.CommentBloc(
      get<_i112.GetCommentsUseCase>(), get<_i105.PostCommentUseCase>()));
  return get;
}

class _$RegisterModule extends _i114.RegisterModule {}
