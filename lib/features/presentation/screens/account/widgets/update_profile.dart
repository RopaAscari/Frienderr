import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/services/responsive_text.dart';
import 'package:frienderr/features/data/models/profile/profile.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/domain/entities/update_profile.dart'
    as update;
import 'package:frienderr/features/presentation/blocs/account/profile/profile_account_bloc.dart';
import 'package:frienderr/features/presentation/blocs/account/user/user_account_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/widgets/app_button.dart';
import 'package:frienderr/features/presentation/widgets/app_text_field.dart';
import 'package:frienderr/features/presentation/widgets/loading.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile(
      {Key? key, required this.profile, required this.blocGroup})
      : super(key: key);
  final Profile profile;
  final BlocGroup blocGroup;
  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  bool _isLoading = false;
  Profile get _profile => widget.profile;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    _emailController.text = _profile.user.email;
    _usernameController.text = _profile.user.username;
    _statusController.text = _profile.user.status ?? '';

    super.initState();
  }

  void _updateProfile() {
    FocusScope.of(context).unfocus();
    final userBloc = widget.blocGroup.userBloc;
    final uid = userBloc.state.user.id;

    final profile = update.UpdateProfile(
        email: _emailController.text,
        status: _statusController.text,
        username: _usernameController.text);

    widget.blocGroup.userAccountBloc.add(UserAccountEvent.updateProfile(
        uid: uid, userBloc: userBloc, profile: profile));
  }

  void _listenableHandler(BuildContext context, UserAccountState state) {
    if (state.action == UserAccountListenableAction.profileUpdateLoading) {
      setState(() {
        _isLoading = true;
      });
    }

    if (state.action == UserAccountListenableAction.profileUpdateError) {
      getService<AppRouter>().context.showToast(
          content: const Text(
            "An error occured",
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          type: SnackBarType.error);
    }

    if (state.action == UserAccountListenableAction.profileUpdateSuccess) {
      getService<AppRouter>().context.showToast(
          content: const Text(
            "Profile updated",
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          type: SnackBarType.success);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserAccountBloc, UserAccountState>(
        bloc: widget.blocGroup.userAccountBloc,
        listener: _listenableHandler,
        builder: (BuildContext context, UserAccountState state) {
          return SafeArea(
              child: Scaffold(
                  backgroundColor: Theme.of(context).canvasColor,
                  appBar: _buildAppBar(context),
                  body: SingleChildScrollView(
                    child: Column(children: [
                      _buildProfilePic(),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(children: [
                          _buildUserNameField(),
                          _buildStatusField(),
                          _buildEmailField(),
                          _buildUpdateButton(state),
                          _buildLoadingIndicator(state)
                        ]),
                      )
                    ]),
                  )));
        });
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).canvasColor,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, size: 20)),
          Padding(
            padding: const EdgeInsets.only(right: 35.0),
            child: Text("Profile",
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.6))),
          ),
          const Icon(CupertinoIcons.eye)
        ]));
  }

  Widget _buildProfilePic() {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) => Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(150.0)),
          color: Colors.redAccent,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      imageUrl: _profile.user.profilePic!,
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  Widget _buildUserNameField() {
    return SizedBox(
      child: AppTextField(
        label: "Username",
        isObscure: false,
        //errorText: errorText,
        controller: _usernameController,
        padding: const EdgeInsets.only(top: 20),
      ),
      height: 65,
    );
  }

  Widget _buildStatusField() {
    return SizedBox(
      child: AppTextField(
        label: "Status",
        isObscure: false,
        // errorText: errorText,
        controller: _statusController,
        padding: const EdgeInsets.only(top: 20),
      ),
      height: 65,
    );
  }

  Widget _buildEmailField() {
    return SizedBox(
      child: AppTextField(
        label: "Email",
        isObscure: false,
        // errorText: errorText,
        controller: _emailController,
        padding: const EdgeInsets.only(top: 20),
      ),
      height: 65,
    );
  }

  Widget _buildUpdateButton(UserAccountState state) {
    return SizedBox(
        child: AppButton(
          label: "Update",
          isLoading: false,
          borderRadius: 30,
          onPressed: _updateProfile,
          margin: const EdgeInsets.only(top: 24),
          disabled: state.action ==
              ProfileAccountListenableAction.profileUpdateLoading,
        ),
        height: 70);
  }

  Widget _buildLoadingIndicator(UserAccountState state) {
    if (state.action == ProfileAccountListenableAction.profileUpdateLoading) {
      return const Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: LoadingIndicator(size: Size(40, 40)),
      );
    } else {
      return const Center();
    }
  }
}
