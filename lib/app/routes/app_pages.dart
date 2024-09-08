import 'package:get/get.dart';

import '../modules/add_member/bindings/add_member_binding.dart';
import '../modules/add_member/views/add_member_view.dart';
import '../modules/calendar/bindings/calendar_binding.dart';
import '../modules/calendar/views/calendar_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/chat_message/bindings/chat_message_binding.dart';
import '../modules/chat_message/views/chat_message_view.dart';
import '../modules/chat_user_list/bindings/chat_user_list_binding.dart';
import '../modules/chat_user_list/views/chat_user_list_view.dart';
import '../modules/edit_member/bindings/edit_member_binding.dart';
import '../modules/edit_member/views/edit_member_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/enter_code/bindings/enter_code_binding.dart';
import '../modules/enter_code/views/enter_code_view.dart';
import '../modules/family_tree/bindings/family_tree_binding.dart';
import '../modules/family_tree/views/family_tree_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/nav_bar/bindings/nav_bar_binding.dart';
import '../modules/nav_bar/views/nav_bar_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/sign_up_second/bindings/sign_up_second_binding.dart';
import '../modules/sign_up_second/views/sign_up_second_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NAV_BAR;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ENTER_CODE,
      page: () => const EnterCodeView(),
      binding: EnterCodeBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP_SECOND,
      page: () => const SignUpSecondView(),
      binding: SignUpSecondBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.NAV_BAR,
      page: () => const NavBarView(),
      binding: NavBarBinding(),
    ),
    GetPage(
      name: _Paths.CALENDAR,
      page: () => const CalendarView(),
      binding: CalendarBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_USER_LIST,
      page: () => const ChatUserListView(),
      binding: ChatUserListBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_MESSAGE,
      page: () => const ChatMessageView(),
      binding: ChatMessageBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.FAMILY_TREE,
      page: () => const FamilyTreeView(),
      binding: FamilyTreeBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_MEMBER,
      page: () => const EditMemberView(),
      binding: EditMemberBinding(),
    ),
    GetPage(
      name: _Paths.ADD_MEMBER,
      page: () => const AddMemberView(),
      binding: AddMemberBinding(),
    ),
  ];
}
