import 'package:chat_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:chat_app/features/chat/presentation/views/chat_details_body.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/views/login_view.dart';

abstract class AppRouter {
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String chatDetails = '/chatDetails';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path:'/' ,
        builder: (context, state) =>  SignUpView(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: chatDetails,
        builder: (context, state) =>  ChatDetailsBody(),
      ),

    ],
  );
}