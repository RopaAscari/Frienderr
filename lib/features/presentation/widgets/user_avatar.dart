import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
    required this.blocGroup,
    required this.profilePic,
    required this.avatarUserId,
    this.size = 20,
  }) : super(key: key);

  final double? size;
  final String? profilePic;
  final BlocGroup blocGroup;
  final String avatarUserId;

  void _navigateToProfile() {
    if (avatarUserId == blocGroup.userBloc.state.user.id) {
      getService<AppRouter>().push(UserAccountRoute(
          blocGroup: blocGroup,
          isProfileOwnerViewing: true,
          profileUserId: avatarUserId));
    } else {
      getService<AppRouter>().push(ProfileAccountRoute(
          blocGroup: blocGroup,
          isProfileOwnerViewing: false,
          profileUserId: avatarUserId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        onTap: _navigateToProfile,
        child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(profilePic as String),
            radius: size),
      ),
    ]);
  }
}
