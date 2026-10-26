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
import '../modules/student/dashboard/bindings/student_dashboard_binding.dart';
import '../modules/admin/dashboard/views/admin_dashboard_view.dart';
import '../modules/student/settings/views/student_settings_view.dart';
import '../modules/student/settings/bindings/student_settings_binding.dart';
import '../modules/student/rules/views/student_rules_view.dart';
import '../modules/student/rules/bindings/student_rules_binding.dart';
import '../modules/student/rules/guidelines/views/student_community_guidelines_view.dart';
import '../modules/student/rules/guidelines/bindings/community_guidelines_binding.dart';
import '../modules/student/rules/amenities/views/student_amenities_view.dart';
import '../modules/student/rules/amenities/bindings/student_amenities_binding.dart';
import '../modules/student/rules/warden/views/student_warden_view.dart';
import '../modules/student/rules/warden/bindings/student_warden_binding.dart';
import '../modules/student/room/views/student_room_view.dart';
import '../modules/student/room/bindings/student_room_binding.dart';
import '../modules/student/available_rooms/views/available_rooms_view.dart';
import '../modules/student/room_detail/views/room_detail_view.dart';
import '../modules/student/room_detail/bindings/room_detail_binding.dart';
import '../modules/student/available_rooms/bindings/available_rooms_binding.dart';
import '../modules/student/room_change_request/views/room_change_request_view.dart';
import '../modules/student/room_change_request/bindings/room_change_request_binding.dart';
import '../modules/student/request_confirmation/views/request_confirmation_view.dart';
import '../modules/student/request_confirmation/bindings/request_confirmation_binding.dart';
import '../modules/student/leave/views/student_leave_view.dart';
import '../modules/student/leave/bindings/student_leave_binding.dart';
import '../modules/student/apply_leave/views/apply_leave_view.dart';
import '../modules/student/apply_leave/bindings/apply_leave_binding.dart';
import '../modules/student/all_leave_requests/views/all_leave_requests_view.dart';
import '../modules/student/all_leave_requests/bindings/all_leave_requests_binding.dart';
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
      binding: StudentDashboardBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.studentRoom,
      page: () => const StudentRoomView(),
      binding: StudentRoomBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.studentAvailableRooms,
      page: () => const AvailableRoomsView(),
      binding: AvailableRoomsBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.studentRoomDetail,
      page: () => const RoomDetailView(),
      binding: RoomDetailBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      name: AppRoutes.studentRoomChangeRequest,
      page: () => const RoomChangeRequestView(),
      binding: RoomChangeRequestBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.studentRequestConfirmation,
      page: () => const RequestConfirmationView(),
      binding: RequestConfirmationBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.studentLeave,
      page: () => const StudentLeaveView(),
      binding: StudentLeaveBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.studentApplyLeave,
      page: () => const ApplyLeaveView(),
      binding: ApplyLeaveBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.studentAllLeaveRequests,
      page: () => const AllLeaveRequestsView(),
      binding: AllLeaveRequestsBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.studentSettings,
      page: () => const StudentSettingsView(),
      binding: StudentSettingsBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 280),
    ),
    GetPage(
      name: AppRoutes.studentRules,
      page: () => const StudentRulesView(),
      binding: StudentRulesBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.studentGuidelines,
      page: () => const StudentCommunityGuidelinesView(),
      binding: CommunityGuidelinesBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.studentAmenities,
      page: () => const StudentAmenitiesView(),
      binding: StudentAmenitiesBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.studentWardenContact,
      page: () => const StudentWardenView(),
      binding: StudentWardenBinding(),
      transition: Transition.rightToLeft,
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
