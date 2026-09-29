import 'package:get/get.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/role_selection/views/role_selection_view.dart';
import '../modules/role_selection/bindings/role_selection_binding.dart';
import '../modules/student_login/views/student_login_view.dart';
import '../modules/student_login/bindings/student_login_binding.dart';
import '../modules/student_register/views/student_register_view.dart';
import '../modules/student_register/bindings/student_register_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/otp_verification/views/otp_verification_view.dart';
import '../modules/otp_verification/bindings/otp_verification_binding.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password_success/views/reset_password_success_view.dart';
import '../modules/reset_password_success/bindings/reset_password_success_binding.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/student/dashboard/views/student_dashboard_view.dart';
import '../modules/admin/dashboard/views/admin_dashboard_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> pages = [
    // ── Splash
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    // ── Onboarding
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    // ── Role Selection
    GetPage(
      name: AppRoutes.roleSelection,
      page: () => const RoleSelectionView(),
      binding: RoleSelectionBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),

    // ── Student Portal Login (Screen from image)
    GetPage(
      name: AppRoutes.studentLogin,
      page: () => const StudentLoginView(),
      binding: StudentLoginBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),

    // ── Authentication
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const StudentRegisterView(),
      binding: StudentRegisterBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.studentRegister,
      page: () => const StudentRegisterView(),
      binding: StudentRegisterBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.otpVerification,
      page: () => const OtpVerificationView(),
      binding: OtpVerificationBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.resetPasswordSuccess,
      page: () => const ResetPasswordSuccessView(),
      binding: ResetPasswordSuccessBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // ── Student
    GetPage(
      name: AppRoutes.studentDashboard,
      page: () => const StudentDashboardView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // ── Admin
    GetPage(
      name: AppRoutes.adminDashboard,
      page: () => const AdminDashboardView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
