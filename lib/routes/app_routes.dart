class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String roleSelection = '/role-selection';
  static const String studentLogin = '/student-login';
  static const String login = '/login';
  static const String register = '/register';
  static const String studentRegister = '/student-register';
  static const String forgotPassword = '/forgot-password';
  static const String otpVerification = '/otp-verification';
  static const String resetPassword = '/reset-password';
  static const String resetPasswordSuccess = '/reset-password-success';

  // Student Routes
  static const String studentDashboard = '/student/dashboard';
  static const String studentRoom = '/student/room';
  static const String studentFees = '/student/fees';
  static const String studentComplaints = '/student/complaints';
  static const String studentAttendance = '/student/attendance';
  static const String studentLeave = '/student/leave';
  static const String studentMess = '/student/mess';
  static const String studentNotices = '/student/notices';
  static const String studentProfile   = '/student/profile';
  static const String studentSettings  = '/student/settings';
  static const String studentRules     = '/student/rules';

  // Admin Routes
  static const String adminDashboard = '/admin/dashboard';
  static const String adminStudents = '/admin/students';
  static const String adminRooms = '/admin/rooms';
  static const String adminFees = '/admin/fees';
  static const String adminComplaints = '/admin/complaints';
  static const String adminAttendance = '/admin/attendance';
  static const String adminLeave = '/admin/leave';
  static const String adminMess = '/admin/mess';
  static const String adminNotices = '/admin/notices';
  static const String adminReports = '/admin/reports';
  static const String adminSettings = '/admin/settings';
}
