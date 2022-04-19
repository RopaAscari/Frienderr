import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';
import 'package:frienderr/features/presentation/blocs/quick/quick_bloc.dart';
import 'package:frienderr/features/presentation/blocs/timeline/timeline_bloc.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';

class BlocGroup {
  UserBloc userBloc;
  QuickBloc quickBloc;
  TimelineBloc timelineBloc;
  AuthenticationBloc authenticationBloc;
  BlocGroup({
    required this.userBloc,
    required this.quickBloc,
    required this.timelineBloc,
    required this.authenticationBloc,
  });

  BlocGroup copyWith({
    UserBloc? userBloc,
    QuickBloc? quickBloc,
    TimelineBloc? timelineBloc,
    AuthenticationBloc? authenticationBloc,
  }) {
    return BlocGroup(
      userBloc: userBloc ?? this.userBloc,
      quickBloc: quickBloc ?? this.quickBloc,
      timelineBloc: timelineBloc ?? this.timelineBloc,
      authenticationBloc: authenticationBloc ?? this.authenticationBloc,
    );
  }
}
