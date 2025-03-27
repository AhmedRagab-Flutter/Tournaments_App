import 'package:dm_mw_project/view/screens/home_screen.dart';
import 'package:dm_mw_project/view/screens/signup_screen.dart';
import 'package:get/get.dart';
import 'view/screens/login_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/login", page: () => const LoginScreen()),
  GetPage(name: "/signup", page: () => const SignupScreen()),
  GetPage(name: "/home", page: () => const HomeScreen()),
];
