import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/domain/entities/account.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/blocs/account/profile/profile_account_bloc.dart';
import 'package:frienderr/features/presentation/widgets/account.dart';
import 'package:frienderr/features/presentation/widgets/loading.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/extensions/late_handler.dart';
import 'package:frienderr/features/presentation/blocs/account/user/user_account_bloc.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    widget.blocGroup.profileAccountBloc
        .add(ProfileAccountEvent.getUserAccount(uid: widget.profileUserId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: BlocConsumer<ProfileAccountBloc, ProfileAccountState>(
                bloc: widget.blocGroup.profileAccountBloc,
                listener: (BuildContext context, ProfileAccountState state) {},
                builder: (BuildContext context, ProfileAccountState state) {
                  switch (state.currentState) {
                    case ProfileAccountStatus.loading:
                      return _accountLoading();
                    case ProfileAccountStatus.error:
                      return _accountError(state.error);
                    case ProfileAccountStatus.loaded:
                      return _buildAccountProfile(state);
                    default:
                      return const Center();
                  }
                })));
  }

  Widget _accountError(String? error) {
    return Center(child: Text(error ?? 'An error occured'));
  }

  Widget _accountLoading() {
    return const Center(child: LoadingIndicator(size: Size(40, 40)));
  }

  Widget _buildAccountProfile(ProfileAccountState state) {
    return AccountDisplay(
        blocGroup: widget.blocGroup,
        account: state.account as Account,
        profileUserId: widget.profileUserId,
        isProfileOwnerViewing: widget.isProfileOwnerViewing);
  }
}
