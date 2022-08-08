import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/data/models/profile/profile.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/screens/account/widgets/profile.dart';
import 'package:frienderr/features/presentation/blocs/notification/notification_bloc.dart';
import 'package:frienderr/features/presentation/blocs/account/profile/profile_account_bloc.dart';

class ProfileAccountScreen extends StatefulWidget {
  final BlocGroup blocGroup;
  final String profileUserId;
  final bool isProfileOwnerViewing;

  const ProfileAccountScreen(
      {Key? key,
      required this.blocGroup,
      required this.profileUserId,
      required this.isProfileOwnerViewing})
      : super(key: key);

  @override
  State<ProfileAccountScreen> createState() => _ProfileAccountScreenState();
}

class _ProfileAccountScreenState extends State<ProfileAccountScreen> {
  String get uid => widget.profileUserId;
  BlocGroup get _blocGroup => widget.blocGroup;
  NotificationBloc notificationBloc = getService<NotificationBloc>();

  @override
  void initState() {
    _blocGroup.profileAccountBloc
      ..add(ProfileAccountEvent.getUser(uid: uid))
      ..add(ProfileAccountEvent.getPosts(uid: uid))
      ..add(ProfileAccountEvent.getSnaps(uid: uid))
      ..add(ProfileAccountEvent.getFollowers(uid: uid))
      ..add(ProfileAccountEvent.getFollowing(uid: uid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: BlocConsumer<ProfileAccountBloc, ProfileAccountState>(
                bloc: _blocGroup.profileAccountBloc,
                builder: (BuildContext context, ProfileAccountState state) {
                  final _profile = Profile(
                    user: state.user,
                    snaps: state.snaps,
                    posts: state.posts,
                    following: state.following,
                    followers: state.followers,
                    reactions: state.reactions,
                    followersList: state.followersList,
                  );
                  return ProfileAccount(
                    profile: _profile,
                    isProfileOwner: false,
                    blocGroup: _blocGroup,
                  );
                },
                listener: (BuildContext context, ProfileAccountState state) {
                  print("STATE $state");
                  if (state.action ==
                      ProfileAccountListenableAction.coverPhotoUpdated) {
                    log('cover photo updated ${state.user.coverPhoto}');
                  } else if (state.action ==
                      ProfileAccountListenableAction.coverPhotoUpdateFailed) {
                    log('profile photo updated ${state.user.profilePic}');
                    getService<AppRouter>().context.showToast(
                        content: const Text("An error occured",
                            style: TextStyle(fontSize: 13)));
                  }

                  if (state.action ==
                      ProfileAccountListenableAction.profilePhotoUpdated) {
                  } else if (state.action ==
                      ProfileAccountListenableAction.profilePhotoUpdateFailed) {
                    getService<AppRouter>().context.showToast(
                        content: const Text("An error occured",
                            style: TextStyle(fontSize: 13)));
                  }
                })));
  }
}
