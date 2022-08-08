import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/data/models/profile/profile.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/screens/account/widgets/profile.dart';
import 'package:frienderr/features/presentation/blocs/notification/notification_bloc.dart';
import 'package:frienderr/features/presentation/blocs/account/user/user_account_bloc.dart';

class UserAccountScreen extends StatefulWidget {
  final BlocGroup blocGroup;
  final String profileUserId;
  final bool isProfileOwnerViewing;

  const UserAccountScreen(
      {Key? key,
      required this.blocGroup,
      required this.profileUserId,
      required this.isProfileOwnerViewing})
      : super(key: key);

  @override
  State<UserAccountScreen> createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen>
    with AutomaticKeepAliveClientMixin<UserAccountScreen> {
  @mustCallSuper
  @override
  bool get wantKeepAlive => true;

  BlocGroup get _blocGroup => widget.blocGroup;
  UserModel get _user => widget.blocGroup.userBloc.state.user;
  NotificationBloc notificationBloc = getService<NotificationBloc>();

  @mustCallSuper
  @override
  void initState() {
    _blocGroup.userAccountBloc
      ..add(UserAccountEvent.getUser(uid: _user.id))
      ..add(UserAccountEvent.getPosts(uid: _user.id))
      ..add(UserAccountEvent.getSnaps(uid: _user.id))
      ..add(UserAccountEvent.getReactions(uid: _user.id))
      ..add(UserAccountEvent.getFollowers(uid: _user.id))
      ..add(UserAccountEvent.getFollowing(uid: _user.id))
      ..add(UserAccountEvent.getFollowingList(uid: _user.id));
    super.initState();
  }

  @mustCallSuper
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: BlocConsumer<UserAccountBloc, UserAccountState>(
                bloc: _blocGroup.userAccountBloc,
                builder: (BuildContext context, UserAccountState state) {
                  final _profile = Profile(
                    user: _user,
                    snaps: state.snaps,
                    posts: state.posts,
                    following: state.following,
                    followers: state.followers,
                    reactions: state.reactions,
                    followersList: state.followersList,
                  );
                  return BlocBuilder<UserBloc, UserState>(
                      bloc: _blocGroup.userBloc,
                      builder: (BuildContext context, UserState state) {
                        log('rebuilt!!');
                        return ProfileAccount(
                          profile: _profile,
                          isProfileOwner: true,
                          blocGroup: _blocGroup,
                        );
                      });
                },
                listener: (BuildContext context, UserAccountState state) {})));
  }
}
