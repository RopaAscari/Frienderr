// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_messaging/firebase_messaging.dart' as _i7;
import 'package:firebase_storage/firebase_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_mlkit_smart_reply/google_mlkit_smart_reply.dart' as _i30;
import 'package:graphql_flutter/graphql_flutter.dart' as _i10;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/data/providers/auth/auth_provider.dart' as _i11;
import '../../features/data/providers/auth/social_auth_provider.dart' as _i24;
import '../../features/data/providers/chat_provider.dart' as _i12;
import '../../features/data/providers/comment_provider.dart' as _i13;
import '../../features/data/providers/followers_provider.dart' as _i14;
import '../../features/data/providers/following_provider.dart' as _i15;
import '../../features/data/providers/message_provider.dart' as _i50;
import '../../features/data/providers/notification_provider.dart' as _i18;
import '../../features/data/providers/post_provider.dart' as _i19;
import '../../features/data/providers/reaction_provider.dart' as _i20;
import '../../features/data/providers/snap_provider.dart' as _i23;
import '../../features/data/providers/story_provider.dart' as _i25;
import '../../features/data/providers/user_provider.dart' as _i26;
import '../../features/data/repositories/auth_repository_impl.dart' as _i45;
import '../../features/data/repositories/chat_repository_impl.dart' as _i47;
import '../../features/data/repositories/comment_repository_impl.dart' as _i131;
import '../../features/data/repositories/followers_repository_impl.dart'
    as _i49;
import '../../features/data/repositories/following_repository_impl.dart'
    as _i17;
import '../../features/data/repositories/message_repository_impl.dart' as _i52;
import '../../features/data/repositories/notification_repository.dart' as _i54;
import '../../features/data/repositories/post_repository_impl.dart' as _i56;
import '../../features/data/repositories/reaction_repository_impl.dart' as _i22;
import '../../features/data/repositories/snap_repository_impl.dart' as _i58;
import '../../features/data/repositories/story_repository_impl.dart' as _i60;
import '../../features/data/repositories/user_repository.dart' as _i28;
import '../../features/domain/repositiories/auth_repository.dart' as _i44;
import '../../features/domain/repositiories/chat_repository.dart' as _i46;
import '../../features/domain/repositiories/comment_repository.dart' as _i130;
import '../../features/domain/repositiories/followers_repository.dart' as _i48;
import '../../features/domain/repositiories/following_repository.dart' as _i16;
import '../../features/domain/repositiories/messaging_repository.dart' as _i51;
import '../../features/domain/repositiories/notification_repository.dart'
    as _i53;
import '../../features/domain/repositiories/post_repository.dart' as _i55;
import '../../features/domain/repositiories/reaction_repository.dart' as _i21;
import '../../features/domain/repositiories/snap_repository.dart' as _i57;
import '../../features/domain/repositiories/story_repository.dart' as _i59;
import '../../features/domain/repositiories/user_repository.dart' as _i27;
import '../../features/domain/usecases/auth/authenticate_usecase.dart' as _i90;
import '../../features/domain/usecases/auth/create_account_usecase.dart'
    as _i91;
import '../../features/domain/usecases/auth/facebook_sign_in_usecase.dart'
    as _i101;
import '../../features/domain/usecases/auth/facebook_sign_up_usecase.dart'
    as _i102;
import '../../features/domain/usecases/auth/get_user_id_usecase.dart' as _i125;
import '../../features/domain/usecases/auth/google_sign_in_usecase.dart'
    as _i128;
import '../../features/domain/usecases/auth/google_sign_up_usecase.dart'
    as _i129;
import '../../features/domain/usecases/auth/recover_password_usecase.dart'
    as _i64;
import '../../features/domain/usecases/auth/sign_out_usecase.dart' as _i75;
import '../../features/domain/usecases/auth/twitter_sign_in_usecase.dart'
    as _i78;
import '../../features/domain/usecases/auth/twitter_sign_up_usecase.dart'
    as _i79;
import '../../features/domain/usecases/auth/verify_and_update_username.dart'
    as _i87;
import '../../features/domain/usecases/auth/verify_authentication_usecase.dart'
    as _i88;
import '../../features/domain/usecases/auth/verify_username_existence_usecase.dart'
    as _i65;
import '../../features/domain/usecases/chat/delete_chat_usecase.dart' as _i96;
import '../../features/domain/usecases/chat/get_chat_scream_usecase.dart'
    as _i106;
import '../../features/domain/usecases/chat/get_chats_usecase.dart' as _i107;
import '../../features/domain/usecases/chat/get_paginated_chats_usecase.dart'
    as _i111;
import '../../features/domain/usecases/chat/instantiate_chat_usecase.dart'
    as _i61;
import '../../features/domain/usecases/chat/start_typing_usecase.dart' as _i76;
import '../../features/domain/usecases/chat/stop_typing_usecase.dart' as _i77;
import '../../features/domain/usecases/comment/delete_comment_usecase.dart'
    as _i142;
import '../../features/domain/usecases/comment/get_comments_usecase.dart'
    as _i143;
import '../../features/domain/usecases/comment/get_paginated_comments.dart'
    as _i144;
import '../../features/domain/usecases/comment/post_comment_usecase.dart'
    as _i135;
import '../../features/domain/usecases/followers/get_account_followers_usecase.dart'
    as _i105;
import '../../features/domain/usecases/followers/get_followers_usercase.dart'
    as _i38;
import '../../features/domain/usecases/followers/get_profile_followers_list.dart'
    as _i120;
import '../../features/domain/usecases/following/follower_user_usercase.dart'
    as _i37;
import '../../features/domain/usecases/following/get_following_status_usecase.dart'
    as _i39;
import '../../features/domain/usecases/following/get_following_usercase.dart'
    as _i40;
import '../../features/domain/usecases/following/unfollow_user_usecase.dart'
    as _i32;
import '../../features/domain/usecases/message/delete_message_usecase.dart'
    as _i97;
import '../../features/domain/usecases/message/get_message_stream_usecase.dart'
    as _i108;
import '../../features/domain/usecases/message/seen_message_usecase.dart'
    as _i67;
import '../../features/domain/usecases/message/send_audio_message_usecase.dart'
    as _i68;
import '../../features/domain/usecases/message/send_message_usecase.dart'
    as _i72;
import '../../features/domain/usecases/message/send_multimedia_message_usecase.dart'
    as _i73;
import '../../features/domain/usecases/message/update_last_message.dart'
    as _i84;
import '../../features/domain/usecases/notification/get_notification_stream_usecase.dart'
    as _i109;
import '../../features/domain/usecases/notification/get_notifications_usecase.dart'
    as _i110;
import '../../features/domain/usecases/notification/get_paginated_notifications_usecase.dart'
    as _i112;
import '../../features/domain/usecases/notification/send_comment_notification_usecase.dart'
    as _i69;
import '../../features/domain/usecases/notification/send_follow_notification_usecase.dart'
    as _i70;
import '../../features/domain/usecases/notification/send_like_notification_usecase.dart'
    as _i71;
import '../../features/domain/usecases/post/create_post_usecase.dart' as _i92;
import '../../features/domain/usecases/post/create_status_post_usecase.dart'
    as _i94;
import '../../features/domain/usecases/post/delete_post_usecase.dart' as _i98;
import '../../features/domain/usecases/post/get_user_posts_usecase.dart'
    as _i126;
import '../../features/domain/usecases/post/react_post_usecase.dart' as _i63;
import '../../features/domain/usecases/post/save_post_usecase.dart' as _i66;
import '../../features/domain/usecases/post/share_post_usacase.dart' as _i74;
import '../../features/domain/usecases/post/unreact_post_usecase.dart' as _i81;
import '../../features/domain/usecases/post/unsave_post_usecase.dart' as _i82;
import '../../features/domain/usecases/post/update_post_reaction_usecase.dart'
    as _i83;
import '../../features/domain/usecases/quick/create_snap.dart' as _i93;
import '../../features/domain/usecases/quick/delete_snap.dart' as _i99;
import '../../features/domain/usecases/quick/get_paginated_snaps.dart' as _i114;
import '../../features/domain/usecases/quick/get_snaps.dart' as _i121;
import '../../features/domain/usecases/quick/get_user_snaps.dart' as _i127;
import '../../features/domain/usecases/quick/like_snap.dart' as _i62;
import '../../features/domain/usecases/quick/unlike_snap.dart' as _i80;
import '../../features/domain/usecases/reaction/get_profile_reactions.dart'
    as _i42;
import '../../features/domain/usecases/story/create_story_usecase.dart' as _i95;
import '../../features/domain/usecases/story/delete_story_usecase.dart'
    as _i100;
import '../../features/domain/usecases/story/get_paginated_story_usecase.dart'
    as _i115;
import '../../features/domain/usecases/story/get_paginated_story_viewers_usecase.dart.dart'
    as _i116;
import '../../features/domain/usecases/story/get_story_stream_usecase.dart'
    as _i122;
import '../../features/domain/usecases/story/get_story_usecase.dart' as _i123;
import '../../features/domain/usecases/story/get_story_viewers_usecase.dart'
    as _i124;
import '../../features/domain/usecases/story/update_story_usecase.dart' as _i85;
import '../../features/domain/usecases/story/view_story_usecase.dart' as _i89;
import '../../features/domain/usecases/timeline/get_paginated_posts_usecase.dart'
    as _i113;
import '../../features/domain/usecases/timeline/get_post_stream_usecase.dart'
    as _i118;
import '../../features/domain/usecases/timeline/get_post_usecase.dart' as _i117;
import '../../features/domain/usecases/timeline/get_posts_usecase.dart'
    as _i119;
import '../../features/domain/usecases/user/get_platform_users_usecase.dart'
    as _i41;
import '../../features/domain/usecases/user/get_user_usecase.dart' as _i43;
import '../../features/domain/usecases/user/update_cover_photo_usecase.dart'
    as _i33;
import '../../features/domain/usecases/user/update_profile_photo_usecase.dart'
    as _i34;
import '../../features/domain/usecases/user/update_profile_usecase.dart'
    as _i35;
import '../../features/presentation/blocs/account/profile/profile_account_bloc.dart'
    as _i136;
import '../../features/presentation/blocs/account/user/user_account_bloc.dart'
    as _i139;
import '../../features/presentation/blocs/authenticate/authenticate_bloc.dart'
    as _i140;
import '../../features/presentation/blocs/camera/camera_bloc.dart' as _i4;
import '../../features/presentation/blocs/chat/chat_bloc.dart' as _i141;
import '../../features/presentation/blocs/comment/comment_bloc.dart' as _i145;
import '../../features/presentation/blocs/followers/followers_bloc.dart'
    as _i103;
import '../../features/presentation/blocs/following/following_bloc.dart'
    as _i104;
import '../../features/presentation/blocs/messaging/messaging_bloc.dart'
    as _i132;
import '../../features/presentation/blocs/notification/notification_bloc.dart'
    as _i133;
import '../../features/presentation/blocs/post/post_bloc.dart' as _i134;
import '../../features/presentation/blocs/snap/snap_bloc.dart' as _i137;
import '../../features/presentation/blocs/story/story_bloc.dart' as _i138;
import '../../features/presentation/blocs/theme/theme_bloc.dart' as _i31;
import '../../features/presentation/blocs/user/user_bloc.dart' as _i86;
import '../../features/presentation/navigation/app_router.dart' as _i3;
import '../mappers/mapping_profile.dart' as _i29;
import '../services/firebase.dart' as _i8;
import '../services/video_service.dart' as _i36;
import 'register_module.dart' as _i146; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i8.FirebaseServices>(() => registerModule.firebaseServices);
  gh.factory<_i9.FirebaseStorage>(() => registerModule.storage);
  gh.lazySingleton<_i10.GraphQLClient>(() => registerModule.gqlClient);
  gh.lazySingleton<_i11.IAuthRemoteDataProvider>(() =>
      _i11.AuthRemoteDataProvider(get<_i5.FirebaseAuth>(),
          get<_i6.FirebaseFirestore>(), get<_i7.FirebaseMessaging>()));
  gh.lazySingleton<_i12.IChatRemoteDataProvider>(() =>
      _i12.ChatRemoteDataProvider(
          get<_i5.FirebaseAuth>(), get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i13.ICommentRemoteDataProvider>(
      () => _i13.CommentRemoteDataProvider(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i14.IFollowersRemoteDataProvider>(
      () => _i14.FollowersRemoteDataProvider(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i15.IFollowingRemoteDataProvider>(() =>
      _i15.FollowingRemoteDataProvider(
          get<_i6.FirebaseFirestore>(), get<_i5.FirebaseAuth>()));
  gh.lazySingleton<_i16.IFollowingRepository>(() => _i17.FollowingRepository(
      get<_i15.IFollowingRemoteDataProvider>(),
      get<_i14.IFollowersRemoteDataProvider>()));
  gh.lazySingleton<_i18.INotificationRemoteDataProvider>(() =>
      _i18.NotificationRemoteDataProvider(get<_i5.FirebaseAuth>(),
          get<_i10.GraphQLClient>(), get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i19.IPostRemoteDataProvider>(() =>
      _i19.PostRemoteDataProvider(get<_i5.FirebaseAuth>(),
          get<_i9.FirebaseStorage>(), get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i20.IReactionRemoteDataProvider>(
      () => _i20.ReactionRemoteDataProvider(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i21.IReactionRepository>(
      () => _i22.ReactionRepository(get<_i20.IReactionRemoteDataProvider>()));
  gh.lazySingleton<_i23.ISnapRemoteDataProvider>(() =>
      _i23.SnapRemoteDataProvider(get<_i6.FirebaseFirestore>(),
          get<_i5.FirebaseAuth>(), get<_i9.FirebaseStorage>()));
  gh.lazySingleton<_i24.ISocialAuthRemoteDataProvider>(() =>
      _i24.SocialAuthRemoteDataProvider(get<_i5.FirebaseAuth>(),
          get<_i6.FirebaseFirestore>(), get<_i7.FirebaseMessaging>()));
  gh.lazySingleton<_i25.IStoryDataRemoteProvider>(() =>
      _i25.StoryDataRemoteProvider(get<_i6.FirebaseFirestore>(),
          get<_i5.FirebaseAuth>(), get<_i9.FirebaseStorage>()));
  gh.lazySingleton<_i26.IUserDataRemoteProvider>(() =>
      _i26.UserDataRemoteProvider(
          get<_i6.FirebaseFirestore>(), get<_i9.FirebaseStorage>()));
  gh.lazySingleton<_i27.IUserRepository>(
      () => _i28.UserRepository(get<_i26.IUserDataRemoteProvider>()));
  gh.factory<_i29.MappingProfile>(() => registerModule.mappingProfile);
  gh.factory<_i30.SmartReply>(() => registerModule.smartReply);
  gh.factory<_i31.ThemeBloc>(() => _i31.ThemeBloc());
  gh.lazySingleton<_i32.UnFollowUserUseCase>(
      () => _i32.UnFollowUserUseCase(get<_i16.IFollowingRepository>()));
  gh.lazySingleton<_i33.UpdateCoverPhotoUseCase>(
      () => _i33.UpdateCoverPhotoUseCase(get<_i27.IUserRepository>()));
  gh.lazySingleton<_i34.UpdateProfilePhotoUseCase>(
      () => _i34.UpdateProfilePhotoUseCase(get<_i27.IUserRepository>()));
  gh.lazySingleton<_i35.UpdateProfileUseCase>(
      () => _i35.UpdateProfileUseCase(get<_i27.IUserRepository>()));
  gh.factory<_i36.VideoControllerService>(
      () => registerModule.videoPlayerServide);
  gh.lazySingleton<_i37.FollowUserUseCase>(
      () => _i37.FollowUserUseCase(get<_i16.IFollowingRepository>()));
  gh.lazySingleton<_i38.GetFollowersUseCase>(
      () => _i38.GetFollowersUseCase(get<_i16.IFollowingRepository>()));
  gh.lazySingleton<_i39.GetFollowingStatusUseCase>(
      () => _i39.GetFollowingStatusUseCase(get<_i16.IFollowingRepository>()));
  gh.lazySingleton<_i40.GetFollowingUseCase>(
      () => _i40.GetFollowingUseCase(get<_i16.IFollowingRepository>()));
  gh.lazySingleton<_i41.GetPlatformUsersUseCase>(
      () => _i41.GetPlatformUsersUseCase(get<_i27.IUserRepository>()));
  gh.lazySingleton<_i42.GetProfileReactionsUseCase>(
      () => _i42.GetProfileReactionsUseCase(get<_i21.IReactionRepository>()));
  gh.lazySingleton<_i43.GetUserUseCase>(
      () => _i43.GetUserUseCase(get<_i27.IUserRepository>()));
  gh.lazySingleton<_i44.IAuthRepository>(() => _i45.AuthRepository(
      get<_i11.IAuthRemoteDataProvider>(),
      get<_i24.ISocialAuthRemoteDataProvider>()));
  gh.lazySingleton<_i46.IChatRepository>(() => _i47.ChatRepository(
      get<_i12.IChatRemoteDataProvider>(),
      get<_i26.IUserDataRemoteProvider>()));
  gh.lazySingleton<_i48.IFollowersRepository>(() => _i49.FollowersRepository(
      get<_i14.IFollowersRemoteDataProvider>(),
      get<_i26.IUserDataRemoteProvider>()));
  gh.lazySingleton<_i50.IMessageRemoteDataProvider>(() =>
      _i50.MessageRemoteDataProvider(
          get<_i30.SmartReply>(),
          get<_i6.FirebaseFirestore>(),
          get<_i5.FirebaseAuth>(),
          get<_i9.FirebaseStorage>()));
  gh.lazySingleton<_i51.IMessageRepository>(() => _i52.MessageRepository(
      get<_i50.IMessageRemoteDataProvider>(),
      get<_i12.IChatRemoteDataProvider>()));
  gh.lazySingleton<_i53.INotificationRepository>(() =>
      _i54.NotificationRepository(get<_i26.IUserDataRemoteProvider>(),
          get<_i18.INotificationRemoteDataProvider>()));
  gh.lazySingleton<_i55.IPostRepository>(() => _i56.PostRepository(
      get<_i5.FirebaseAuth>(),
      get<_i29.MappingProfile>(),
      get<_i19.IPostRemoteDataProvider>(),
      get<_i26.IUserDataRemoteProvider>(),
      get<_i53.INotificationRepository>()));
  gh.lazySingleton<_i57.ISnapRepository>(() => _i58.SnapRepository(
      get<_i23.ISnapRemoteDataProvider>(),
      get<_i26.IUserDataRemoteProvider>(),
      get<_i5.FirebaseAuth>()));
  gh.lazySingleton<_i59.IStoryRepository>(() => _i60.StoryRepository(
      get<_i5.FirebaseAuth>(),
      get<_i25.IStoryDataRemoteProvider>(),
      get<_i26.IUserDataRemoteProvider>()));
  gh.lazySingleton<_i61.InstantiateChatUseCase>(
      () => _i61.InstantiateChatUseCase(get<_i46.IChatRepository>()));
  gh.lazySingleton<_i62.LikeSnapUseCase>(
      () => _i62.LikeSnapUseCase(get<_i57.ISnapRepository>()));
  gh.lazySingleton<_i63.ReactToPostUseCase>(
      () => _i63.ReactToPostUseCase(get<_i55.IPostRepository>()));
  gh.lazySingleton<_i64.RecoverPasswordUseCase>(
      () => _i64.RecoverPasswordUseCase(get<_i44.IAuthRepository>()));
  gh.lazySingleton<_i65.RecoverPasswordUseCase>(
      () => _i65.RecoverPasswordUseCase(get<_i44.IAuthRepository>()));
  gh.lazySingleton<_i66.SavePostUseCase>(
      () => _i66.SavePostUseCase(get<_i55.IPostRepository>()));
  gh.lazySingleton<_i67.SeenMessageUseCase>(
      () => _i67.SeenMessageUseCase(get<_i51.IMessageRepository>()));
  gh.lazySingleton<_i68.SendAudioMessageUseCase>(
      () => _i68.SendAudioMessageUseCase(get<_i51.IMessageRepository>()));
  gh.lazySingleton<_i69.SendCommentNotificationUseCase>(() =>
      _i69.SendCommentNotificationUseCase(get<_i53.INotificationRepository>()));
  gh.lazySingleton<_i70.SendFollowNotificationUseCase>(() =>
      _i70.SendFollowNotificationUseCase(get<_i53.INotificationRepository>()));
  gh.lazySingleton<_i71.SendLikeNotificationUseCase>(() =>
      _i71.SendLikeNotificationUseCase(get<_i53.INotificationRepository>()));
  gh.lazySingleton<_i72.SendMessageUseCase>(
      () => _i72.SendMessageUseCase(get<_i51.IMessageRepository>()));
  gh.lazySingleton<_i73.SendMultimediaMessageUseCase>(
      () => _i73.SendMultimediaMessageUseCase(get<_i51.IMessageRepository>()));
  gh.lazySingleton<_i74.SharePostUseCase>(
      () => _i74.SharePostUseCase(get<_i55.IPostRepository>()));
  gh.lazySingleton<_i75.SignOutUseCase>(
      () => _i75.SignOutUseCase(get<_i44.IAuthRepository>()));
  gh.lazySingleton<_i76.StartTypingUseCase>(
      () => _i76.StartTypingUseCase(get<_i46.IChatRepository>()));
  gh.lazySingleton<_i77.StopTypingUseCase>(
      () => _i77.StopTypingUseCase(get<_i46.IChatRepository>()));
  gh.lazySingleton<_i78.TwitterSignInUseCase>(
      () => _i78.TwitterSignInUseCase(get<_i44.IAuthRepository>()));
  gh.lazySingleton<_i79.TwitterSignUpUseCase>(
      () => _i79.TwitterSignUpUseCase(get<_i44.IAuthRepository>()));
  gh.lazySingleton<_i80.UnLikeSnapUseCase>(
      () => _i80.UnLikeSnapUseCase(get<_i57.ISnapRepository>()));
  gh.lazySingleton<_i81.UnReactToPostUseCase>(
      () => _i81.UnReactToPostUseCase(get<_i55.IPostRepository>()));
  gh.lazySingleton<_i82.UnSavePostUseCase>(
      () => _i82.UnSavePostUseCase(get<_i55.IPostRepository>()));
  gh.lazySingleton<_i83.UpdatePostReactionUseCase>(
      () => _i83.UpdatePostReactionUseCase(get<_i55.IPostRepository>()));
  gh.lazySingleton<_i84.UpdatePreviousMessageUseCase>(
      () => _i84.UpdatePreviousMessageUseCase(get<_i51.IMessageRepository>()));
  gh.lazySingleton<_i85.UpdateStoryUseCase>(
      () => _i85.UpdateStoryUseCase(get<_i59.IStoryRepository>()));
  gh.factory<_i86.UserBloc>(
      () => _i86.UserBloc(get<_i41.GetPlatformUsersUseCase>()));
  gh.lazySingleton<_i87.VerifyAndUpdateUsernameUseCase>(
      () => _i87.VerifyAndUpdateUsernameUseCase(get<_i44.IAuthRepository>()));
  gh.lazySingleton<_i88.VerifyAuthenticationUseCase>(
      () => _i88.VerifyAuthenticationUseCase(get<_i44.IAuthRepository>()));
  gh.lazySingleton<_i89.ViewStoryUseCase>(
      () => _i89.ViewStoryUseCase(get<_i59.IStoryRepository>()));
  gh.lazySingleton<_i90.AuthenticateUseCase>(
      () => _i90.AuthenticateUseCase(get<_i44.IAuthRepository>()));
  gh.lazySingleton<_i91.CreateAccountUseCase>(
      () => _i91.CreateAccountUseCase(get<_i44.IAuthRepository>()));
  gh.lazySingleton<_i92.CreatePostUseCase>(
      () => _i92.CreatePostUseCase(get<_i55.IPostRepository>()));
  gh.lazySingleton<_i93.CreateSnapUseCase>(
      () => _i93.CreateSnapUseCase(get<_i57.ISnapRepository>()));
  gh.lazySingleton<_i94.CreateStatusPostUseCase>(
      () => _i94.CreateStatusPostUseCase(get<_i55.IPostRepository>()));
  gh.lazySingleton<_i95.CreateStoryUseCase>(
      () => _i95.CreateStoryUseCase(get<_i59.IStoryRepository>()));
  gh.lazySingleton<_i96.DeleteChatUseCase>(
      () => _i96.DeleteChatUseCase(get<_i46.IChatRepository>()));
  gh.lazySingleton<_i97.DeleteMessageUseCase>(
      () => _i97.DeleteMessageUseCase(get<_i51.IMessageRepository>()));
  gh.lazySingleton<_i98.DeletePostUseCase>(
      () => _i98.DeletePostUseCase(get<_i55.IPostRepository>()));
  gh.lazySingleton<_i99.DeleteSnapUseCase>(
      () => _i99.DeleteSnapUseCase(get<_i57.ISnapRepository>()));
  gh.lazySingleton<_i100.DeleteStoryUseCase>(
      () => _i100.DeleteStoryUseCase(get<_i59.IStoryRepository>()));
  gh.lazySingleton<_i101.FacebookSignInUseCase>(
      () => _i101.FacebookSignInUseCase(get<_i44.IAuthRepository>()));
  gh.lazySingleton<_i102.FacebookSignUpUseCase>(
      () => _i102.FacebookSignUpUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i103.FollowersBloc>(() => _i103.FollowersBloc(
      get<_i38.GetFollowersUseCase>(),
      get<_i37.FollowUserUseCase>(),
      get<_i32.UnFollowUserUseCase>()));
  gh.factory<_i104.FollowingBloc>(
      () => _i104.FollowingBloc(get<_i40.GetFollowingUseCase>()));
  gh.lazySingleton<_i105.GetAccountFollowersUseCase>(
      () => _i105.GetAccountFollowersUseCase(get<_i48.IFollowersRepository>()));
  gh.lazySingleton<_i106.GetChatScreamUsecase>(
      () => _i106.GetChatScreamUsecase(get<_i46.IChatRepository>()));
  gh.lazySingleton<_i107.GetChatsUseCase>(
      () => _i107.GetChatsUseCase(get<_i46.IChatRepository>()));
  gh.lazySingleton<_i108.GetMessageStreamUsecase>(
      () => _i108.GetMessageStreamUsecase(get<_i51.IMessageRepository>()));
  gh.lazySingleton<_i109.GetNotificationStreamUseCase>(() =>
      _i109.GetNotificationStreamUseCase(get<_i53.INotificationRepository>()));
  gh.lazySingleton<_i110.GetNotificationUseCase>(
      () => _i110.GetNotificationUseCase(get<_i53.INotificationRepository>()));
  gh.lazySingleton<_i111.GetPaginatedChatsUseCase>(
      () => _i111.GetPaginatedChatsUseCase(get<_i46.IChatRepository>()));
  gh.lazySingleton<_i112.GetPaginatedNotificationUseCase>(() =>
      _i112.GetPaginatedNotificationUseCase(
          get<_i53.INotificationRepository>()));
  gh.lazySingleton<_i113.GetPaginatedPostsUseCase>(
      () => _i113.GetPaginatedPostsUseCase(get<_i55.IPostRepository>()));
  gh.lazySingleton<_i114.GetPaginatedSnapsUseCase>(
      () => _i114.GetPaginatedSnapsUseCase(get<_i57.ISnapRepository>()));
  gh.lazySingleton<_i115.GetPaginatedStoryUseCase>(
      () => _i115.GetPaginatedStoryUseCase(get<_i59.IStoryRepository>()));
  gh.lazySingleton<_i116.GetPaginatedStoryViewersUseCase>(() =>
      _i116.GetPaginatedStoryViewersUseCase(get<_i59.IStoryRepository>()));
  gh.lazySingleton<_i117.GetPostUseCase>(
      () => _i117.GetPostUseCase(get<_i55.IPostRepository>()));
  gh.lazySingleton<_i118.GetPostsStreamUseCase>(
      () => _i118.GetPostsStreamUseCase(get<_i55.IPostRepository>()));
  gh.lazySingleton<_i119.GetPostsUseCase>(
      () => _i119.GetPostsUseCase(get<_i55.IPostRepository>()));
  gh.lazySingleton<_i120.GetProfileFollowersListUseCase>(() =>
      _i120.GetProfileFollowersListUseCase(get<_i48.IFollowersRepository>()));
  gh.lazySingleton<_i121.GetSnapUseCase>(
      () => _i121.GetSnapUseCase(get<_i57.ISnapRepository>()));
  gh.lazySingleton<_i122.GetStoryStreamUseCase>(
      () => _i122.GetStoryStreamUseCase(get<_i59.IStoryRepository>()));
  gh.lazySingleton<_i123.GetStoryUseCase>(
      () => _i123.GetStoryUseCase(get<_i59.IStoryRepository>()));
  gh.lazySingleton<_i124.GetStoryViewersUseCase>(
      () => _i124.GetStoryViewersUseCase(get<_i59.IStoryRepository>()));
  gh.lazySingleton<_i125.GetUserIdUseCase>(
      () => _i125.GetUserIdUseCase(get<_i44.IAuthRepository>()));
  gh.lazySingleton<_i126.GetUserPostsUseCase>(
      () => _i126.GetUserPostsUseCase(get<_i55.IPostRepository>()));
  gh.lazySingleton<_i127.GetUserSnapsUseCase>(
      () => _i127.GetUserSnapsUseCase(get<_i57.ISnapRepository>()));
  gh.lazySingleton<_i128.GoogleSignInUseCase>(
      () => _i128.GoogleSignInUseCase(get<_i44.IAuthRepository>()));
  gh.lazySingleton<_i129.GoogleSignUpUseCase>(
      () => _i129.GoogleSignUpUseCase(get<_i44.IAuthRepository>()));
  gh.lazySingleton<_i130.ICommentRepository>(() => _i131.CommentRepository(
      get<_i13.ICommentRemoteDataProvider>(),
      get<_i26.IUserDataRemoteProvider>(),
      get<_i53.INotificationRepository>()));
  gh.factory<_i132.MessageBloc>(() => _i132.MessageBloc(
      get<_i72.SendMessageUseCase>(),
      get<_i67.SeenMessageUseCase>(),
      get<_i97.DeleteMessageUseCase>(),
      get<_i68.SendAudioMessageUseCase>(),
      get<_i108.GetMessageStreamUsecase>(),
      get<_i84.UpdatePreviousMessageUseCase>(),
      get<_i73.SendMultimediaMessageUseCase>()));
  gh.factory<_i133.NotificationBloc>(() => _i133.NotificationBloc(
      get<_i110.GetNotificationUseCase>(),
      get<_i71.SendLikeNotificationUseCase>(),
      get<_i109.GetNotificationStreamUseCase>(),
      get<_i69.SendCommentNotificationUseCase>(),
      get<_i70.SendFollowNotificationUseCase>(),
      get<_i112.GetPaginatedNotificationUseCase>()));
  gh.factory<_i134.PostBloc>(() => _i134.PostBloc(
      get<_i117.GetPostUseCase>(),
      get<_i74.SharePostUseCase>(),
      get<_i66.SavePostUseCase>(),
      get<_i119.GetPostsUseCase>(),
      get<_i82.UnSavePostUseCase>(),
      get<_i92.CreatePostUseCase>(),
      get<_i98.DeletePostUseCase>(),
      get<_i63.ReactToPostUseCase>(),
      get<_i81.UnReactToPostUseCase>(),
      get<_i94.CreateStatusPostUseCase>(),
      get<_i113.GetPaginatedPostsUseCase>(),
      get<_i118.GetPostsStreamUseCase>(),
      get<_i83.UpdatePostReactionUseCase>()));
  gh.lazySingleton<_i135.PostCommentUseCase>(
      () => _i135.PostCommentUseCase(get<_i130.ICommentRepository>()));
  gh.factory<_i136.ProfileAccountBloc>(() => _i136.ProfileAccountBloc(
      get<_i43.GetUserUseCase>(),
      get<_i127.GetUserSnapsUseCase>(),
      get<_i126.GetUserPostsUseCase>(),
      get<_i40.GetFollowingUseCase>(),
      get<_i105.GetAccountFollowersUseCase>(),
      get<_i35.UpdateProfileUseCase>(),
      get<_i33.UpdateCoverPhotoUseCase>(),
      get<_i34.UpdateProfilePhotoUseCase>(),
      get<_i39.GetFollowingStatusUseCase>(),
      get<_i42.GetProfileReactionsUseCase>(),
      get<_i120.GetProfileFollowersListUseCase>()));
  gh.factory<_i137.SnapBloc>(() => _i137.SnapBloc(
      get<_i121.GetSnapUseCase>(),
      get<_i62.LikeSnapUseCase>(),
      get<_i93.CreateSnapUseCase>(),
      get<_i99.DeleteSnapUseCase>(),
      get<_i80.UnLikeSnapUseCase>(),
      get<_i114.GetPaginatedSnapsUseCase>()));
  gh.factory<_i138.StoryBloc>(() => _i138.StoryBloc(
      get<_i123.GetStoryUseCase>(),
      get<_i85.UpdateStoryUseCase>(),
      get<_i95.CreateStoryUseCase>(),
      get<_i100.DeleteStoryUseCase>(),
      get<_i122.GetStoryStreamUseCase>(),
      get<_i89.ViewStoryUseCase>(),
      get<_i124.GetStoryViewersUseCase>(),
      get<_i115.GetPaginatedStoryUseCase>(),
      get<_i116.GetPaginatedStoryViewersUseCase>()));
  gh.factory<_i139.UserAccountBloc>(() => _i139.UserAccountBloc(
      get<_i43.GetUserUseCase>(),
      get<_i127.GetUserSnapsUseCase>(),
      get<_i126.GetUserPostsUseCase>(),
      get<_i105.GetAccountFollowersUseCase>(),
      get<_i40.GetFollowingUseCase>(),
      get<_i39.GetFollowingStatusUseCase>(),
      get<_i42.GetProfileReactionsUseCase>(),
      get<_i120.GetProfileFollowersListUseCase>(),
      get<_i35.UpdateProfileUseCase>(),
      get<_i33.UpdateCoverPhotoUseCase>(),
      get<_i34.UpdateProfilePhotoUseCase>()));
  gh.factory<_i140.AuthenticationBloc>(() => _i140.AuthenticationBloc(
      get<_i75.SignOutUseCase>(),
      get<_i125.GetUserIdUseCase>(),
      get<_i128.GoogleSignInUseCase>(),
      get<_i129.GoogleSignUpUseCase>(),
      get<_i91.CreateAccountUseCase>(),
      get<_i78.TwitterSignInUseCase>(),
      get<_i79.TwitterSignUpUseCase>(),
      get<_i101.FacebookSignInUseCase>(),
      get<_i102.FacebookSignUpUseCase>(),
      get<_i65.RecoverPasswordUseCase>(),
      get<_i90.AuthenticateUseCase>(),
      get<_i88.VerifyAuthenticationUseCase>(),
      get<_i87.VerifyAndUpdateUsernameUseCase>()));
  gh.factory<_i141.ChatBloc>(() => _i141.ChatBloc(
      get<_i107.GetChatsUseCase>(),
      get<_i77.StopTypingUseCase>(),
      get<_i76.StartTypingUseCase>(),
      get<_i96.DeleteChatUseCase>(),
      get<_i106.GetChatScreamUsecase>(),
      get<_i61.InstantiateChatUseCase>(),
      get<_i111.GetPaginatedChatsUseCase>()));
  gh.lazySingleton<_i142.DeleteCommentUseCase>(
      () => _i142.DeleteCommentUseCase(get<_i130.ICommentRepository>()));
  gh.lazySingleton<_i143.GetCommentsUseCase>(
      () => _i143.GetCommentsUseCase(get<_i130.ICommentRepository>()));
  gh.lazySingleton<_i144.GetPaginatedCommentsUseCase>(
      () => _i144.GetPaginatedCommentsUseCase(get<_i130.ICommentRepository>()));
  gh.factory<_i145.CommentBloc>(() => _i145.CommentBloc(
      get<_i143.GetCommentsUseCase>(),
      get<_i135.PostCommentUseCase>(),
      get<_i142.DeleteCommentUseCase>(),
      get<_i144.GetPaginatedCommentsUseCase>()));
  return get;
}

class _$RegisterModule extends _i146.RegisterModule {}
