import 'package:chat_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/views/login_view.dart';

abstract class AppRouter {
  static const String login = '/login';
  static const String signUp = '/signUp';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path:'/' ,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => const LoginView(),
      ),

    ],
  );
}