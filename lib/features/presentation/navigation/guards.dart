import 'package:auto_route/auto_route.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';

class ValidateAuthentication extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final AuthenticationStatus status =
        getIt<AuthenticationBloc>().state.currentState;

    if (status == AuthenticationStatus.Authenticated)
      resolver.next(true);
    else
      router.push(UnauthenticatedRoute());
  }
}
