/// AppStrings — Centralized string constants for HostelFlow.
///
/// All user-facing text is stored here to make localization easy
/// and to avoid hardcoded strings scattered across the codebase.
class AppStrings {
  AppStrings._();

  // ─────────────────────────────────────────────
  // App Info
  // ─────────────────────────────────────────────
  static const String appName = 'HostelFlow';
  static const String appTagline = 'Smart Hostel Management';
  static const String appVersion = 'v1.0.0';
  static const String appBadge = 'BETA';
  static const String campusCloud = 'Campus Cloud';
  static const String sslSecured = 'SSL Secured';

  // ─────────────────────────────────────────────
  // Splash Screen
  // ─────────────────────────────────────────────
  static const String splashLoading = 'Loading...';
  static const String splashInitializing = 'Initializing app...';
  static const String splashCheckingAuth = 'Checking authentication...';
  static const String splashReady = 'Ready!';

  // ─────────────────────────────────────────────
  // Onboarding
  // ─────────────────────────────────────────────
  static const String onboardingSkip = 'Skip';
  static const String onboardingStep = 'Step';
  static const String onboardingOf = 'of';
  static const String onboardingGetStarted = 'Get Started';
  static const String onboardingOccupancy = '98% Occupancy';
  static const String onboardingKeycardActive = 'Keycard Access Active';
  static const String onboardingLiveSync = 'Live sync';
  static const String onboardingVerified = 'Verified';
  static const String onboardingReady = 'Ready';
  static const String onboardingVacant = 'Vacant';

  // ─────────────────────────────────────────────
  // Auth — Login
  // ─────────────────────────────────────────────
  static const String login = 'Login';
  static const String loginTitle = 'Welcome Back';
  static const String loginSubtitle = 'Sign in to your account';
  static const String loginButton = 'Sign In';
  static const String loginForgotPassword = 'Forgot Password?';
  static const String loginNoAccount = "Don't have an account? ";
  static const String loginRegisterLink = 'Register';
  static const String loginWithGoogle = 'Continue with Google';

  // ─────────────────────────────────────────────
  // Auth — Register
  // ─────────────────────────────────────────────
  static const String register = 'Register';
  static const String registerTitle = 'Create Account';
  static const String registerSubtitle = 'Fill in the details to get started';
  static const String registerButton = 'Create Account';
  static const String registerAlreadyHaveAccount = 'Already have an account? ';
  static const String registerLoginLink = 'Login';

  // ─────────────────────────────────────────────
  // Auth — Forgot Password
  // ─────────────────────────────────────────────
  static const String forgotPassword = 'Forgot Password';
  static const String forgotPasswordTitle = 'Reset Password';
  static const String forgotPasswordSubtitle =
      'Enter your registered email to receive a reset link.';
  static const String forgotPasswordButton = 'Send Reset Link';
  static const String forgotPasswordSuccess =
      'Reset link sent! Check your email.';

  // ─────────────────────────────────────────────
  // Auth — OTP Verification
  // ─────────────────────────────────────────────
  static const String otpVerification = 'OTP Verification';
  static const String otpTitle = 'Verify OTP';
  static const String otpSubtitle = 'Enter the 6-digit code sent to your email';
  static const String otpResend = 'Resend OTP';
  static const String otpResendIn = 'Resend in ';
  static const String otpVerifyButton = 'Verify';
  static const String otpInvalid = 'Invalid OTP. Please try again.';
  static const String otpExpired = 'OTP has expired. Please request a new one.';

  // ─────────────────────────────────────────────
  // Auth — Reset Password
  // ─────────────────────────────────────────────
  static const String resetPassword = 'Reset Password';
  static const String resetPasswordTitle = 'Set New Password';
  static const String resetPasswordSubtitle = 'Your new password must be strong';
  static const String resetPasswordButton = 'Update Password';
  static const String resetPasswordSuccess = 'Password updated successfully!';

  // ─────────────────────────────────────────────
  // Form Fields
  // ─────────────────────────────────────────────
  static const String fieldEmail = 'Email Address';
  static const String fieldPassword = 'Password';
  static const String fieldConfirmPassword = 'Confirm Password';
  static const String fieldFullName = 'Full Name';
  static const String fieldPhone = 'Phone Number';
  static const String fieldRollNumber = 'Roll Number';
  static const String fieldRoomNumber = 'Room Number';
  static const String fieldCourse = 'Course';
  static const String fieldYear = 'Year';
  static const String fieldBranch = 'Branch';
  static const String fieldAddress = 'Address';
  static const String fieldDateOfBirth = 'Date of Birth';
  static const String fieldGender = 'Gender';
  static const String fieldGuardianName = "Guardian's Name";
  static const String fieldGuardianPhone = "Guardian's Phone";

  // ─────────────────────────────────────────────
  // Validation Messages
  // ─────────────────────────────────────────────
  static const String validationRequired = 'This field is required';
  static const String validationEmailInvalid = 'Enter a valid email address';
  static const String validationPasswordMin =
      'Password must be at least 8 characters';
  static const String validationPasswordMismatch = 'Passwords do not match';
  static const String validationPhoneInvalid =
      'Enter a valid 10-digit phone number';
  static const String validationNameMin = 'Name must be at least 2 characters';

  // ─────────────────────────────────────────────
  // Student — Dashboard
  // ─────────────────────────────────────────────
  static const String studentDashboard = 'Dashboard';
  static const String studentDashboardWelcome = 'Welcome back,';
  static const String studentDashboardSubtitle = "Here's your hostel overview";
  static const String studentQuickActions = 'Quick Actions';
  static const String studentRecentActivity = 'Recent Activity';
  static const String studentUpcomingEvents = 'Upcoming Events';

  // ─────────────────────────────────────────────
  // Student — Room
  // ─────────────────────────────────────────────
  static const String studentRoom = 'My Room';
  static const String studentRoomDetails = 'Room Details';
  static const String studentRoomType = 'Room Type';
  static const String studentRoommates = 'Roommates';
  static const String studentRoomFloor = 'Floor';
  static const String studentRoomBlock = 'Block';
  static const String studentRoomStatus = 'Room Status';
  static const String studentRoomAmenities = 'Amenities';

  // ─────────────────────────────────────────────
  // Student — Fees
  // ─────────────────────────────────────────────
  static const String studentFees = 'Fees';
  static const String studentFeesPending = 'Pending Fees';
  static const String studentFeesPaid = 'Paid';
  static const String studentFeesOverdue = 'Overdue';
  static const String studentFeesPayNow = 'Pay Now';
  static const String studentFeesHistory = 'Payment History';
  static const String studentFeesDueDate = 'Due Date';
  static const String studentFeesAmount = 'Amount';
  static const String studentFeesReceipt = 'Download Receipt';

  // ─────────────────────────────────────────────
  // Student — Complaints
  // ─────────────────────────────────────────────
  static const String studentComplaints = 'Complaints';
  static const String studentComplaintsNew = 'New Complaint';
  static const String studentComplaintsHistory = 'My Complaints';
  static const String studentComplaintsStatus = 'Status';
  static const String studentComplaintsPending = 'Pending';
  static const String studentComplaintsResolved = 'Resolved';
  static const String studentComplaintsInProgress = 'In Progress';
  static const String studentComplaintsCategory = 'Category';
  static const String studentComplaintsDescription = 'Description';
  static const String studentComplaintsSubmit = 'Submit Complaint';
  static const String studentComplaintsSuccess =
      'Complaint submitted successfully!';

  // ─────────────────────────────────────────────
  // Student — Attendance
  // ─────────────────────────────────────────────
  static const String studentAttendance = 'Attendance';
  static const String studentAttendancePresent = 'Present';
  static const String studentAttendanceAbsent = 'Absent';
  static const String studentAttendanceLeave = 'On Leave';
  static const String studentAttendancePercentage = 'Attendance %';
  static const String studentAttendanceMonth = 'Monthly View';
  static const String studentAttendanceOverall = 'Overall Attendance';

  // ─────────────────────────────────────────────
  // Student — Leave
  // ─────────────────────────────────────────────
  static const String studentLeave = 'Leave';
  static const String studentLeaveApply = 'Apply for Leave';
  static const String studentLeaveHistory = 'Leave History';
  static const String studentLeaveFromDate = 'From Date';
  static const String studentLeaveToDate = 'To Date';
  static const String studentLeaveReason = 'Reason';
  static const String studentLeaveType = 'Leave Type';
  static const String studentLeaveApproved = 'Approved';
  static const String studentLeaveRejected = 'Rejected';
  static const String studentLeavePending = 'Pending';
  static const String studentLeaveSubmit = 'Submit Application';
  static const String studentLeaveSuccess = 'Leave application submitted!';

  // ─────────────────────────────────────────────
  // Student — Mess
  // ─────────────────────────────────────────────
  static const String studentMess = 'Mess';
  static const String studentMessMenu = "Today's Menu";
  static const String studentMessWeekly = 'Weekly Menu';
  static const String studentMessBreakfast = 'Breakfast';
  static const String studentMessLunch = 'Lunch';
  static const String studentMessSnacks = 'Snacks';
  static const String studentMessDinner = 'Dinner';
  static const String studentMessFeedback = 'Give Feedback';
  static const String studentMessRating = "Rate Today's Meal";

  // ─────────────────────────────────────────────
  // Student — Notices
  // ─────────────────────────────────────────────
  static const String studentNotices = 'Notices';
  static const String studentNoticesAll = 'All Notices';
  static const String studentNoticesImportant = 'Important';
  static const String studentNoticesGeneral = 'General';
  static const String studentNoticesPostedOn = 'Posted on';
  static const String studentNoticesBy = 'By';

  // ─────────────────────────────────────────────
  // Student — Profile
  // ─────────────────────────────────────────────
  static const String studentProfile = 'Profile';
  static const String studentProfileEdit = 'Edit Profile';
  static const String studentProfilePersonal = 'Personal Information';
  static const String studentProfileAcademic = 'Academic Information';
  static const String studentProfileGuardian = 'Guardian Information';
  static const String studentProfileSave = 'Save Changes';
  static const String studentProfileChangePassword = 'Change Password';
  static const String studentProfileLogout = 'Logout';

  // ─────────────────────────────────────────────
  // Admin — Dashboard
  // ─────────────────────────────────────────────
  static const String adminDashboard = 'Admin Dashboard';
  static const String adminDashboardSubtitle = 'Hostel overview at a glance';
  static const String adminTotalStudents = 'Total Students';
  static const String adminOccupiedRooms = 'Occupied Rooms';
  static const String adminPendingFees = 'Pending Fees';
  static const String adminOpenComplaints = 'Open Complaints';
  static const String adminTodayAttendance = "Today's Attendance";

  // ─────────────────────────────────────────────
  // Admin — Students
  // ─────────────────────────────────────────────
  static const String adminStudents = 'Students';
  static const String adminStudentsAll = 'All Students';
  static const String adminStudentsAdd = 'Add Student';
  static const String adminStudentsEdit = 'Edit Student';
  static const String adminStudentsDelete = 'Remove Student';
  static const String adminStudentsSearch = 'Search students...';
  static const String adminStudentsExport = 'Export List';

  // ─────────────────────────────────────────────
  // Admin — Rooms
  // ─────────────────────────────────────────────
  static const String adminRooms = 'Rooms';
  static const String adminRoomsAll = 'All Rooms';
  static const String adminRoomsAdd = 'Add Room';
  static const String adminRoomsAvailable = 'Available';
  static const String adminRoomsOccupied = 'Occupied';
  static const String adminRoomsMaintenance = 'Under Maintenance';
  static const String adminRoomsAssign = 'Assign Student';
  static const String adminRoomsVacate = 'Vacate Room';

  // ─────────────────────────────────────────────
  // Admin — Fees
  // ─────────────────────────────────────────────
  static const String adminFees = 'Fee Management';
  static const String adminFeesCollected = 'Total Collected';
  static const String adminFeesPending = 'Total Pending';
  static const String adminFeesAddRecord = 'Add Fee Record';
  static const String adminFeesSendReminder = 'Send Reminder';
  static const String adminFeesGenerateReport = 'Generate Report';

  // ─────────────────────────────────────────────
  // Admin — Complaints
  // ─────────────────────────────────────────────
  static const String adminComplaints = 'Complaints';
  static const String adminComplaintsAll = 'All Complaints';
  static const String adminComplaintsResolve = 'Mark as Resolved';
  static const String adminComplaintsAssign = 'Assign to Staff';
  static const String adminComplaintsReply = 'Reply';

  // ─────────────────────────────────────────────
  // Admin — Attendance
  // ─────────────────────────────────────────────
  static const String adminAttendance = 'Attendance';
  static const String adminAttendanceMark = 'Mark Attendance';
  static const String adminAttendanceView = 'View Attendance';
  static const String adminAttendanceReport = 'Attendance Report';

  // ─────────────────────────────────────────────
  // Admin — Leave
  // ─────────────────────────────────────────────
  static const String adminLeave = 'Leave Requests';
  static const String adminLeavePending = 'Pending Requests';
  static const String adminLeaveApprove = 'Approve';
  static const String adminLeaveReject = 'Reject';
  static const String adminLeaveAll = 'All Leaves';

  // ─────────────────────────────────────────────
  // Admin — Mess
  // ─────────────────────────────────────────────
  static const String adminMess = 'Mess Management';
  static const String adminMessUpdateMenu = 'Update Menu';
  static const String adminMessFeedbacks = 'View Feedbacks';
  static const String adminMessWeeklyPlan = 'Weekly Meal Plan';

  // ─────────────────────────────────────────────
  // Admin — Notices
  // ─────────────────────────────────────────────
  static const String adminNotices = 'Notices';
  static const String adminNoticesCreate = 'Create Notice';
  static const String adminNoticesEdit = 'Edit Notice';
  static const String adminNoticesDelete = 'Delete Notice';
  static const String adminNoticesPublish = 'Publish';
  static const String adminNoticesDraft = 'Save as Draft';

  // ─────────────────────────────────────────────
  // Admin — Reports
  // ─────────────────────────────────────────────
  static const String adminReports = 'Reports';
  static const String adminReportsGenerate = 'Generate Report';
  static const String adminReportsDownload = 'Download';
  static const String adminReportsMonthly = 'Monthly Report';
  static const String adminReportsAnnual = 'Annual Report';
  static const String adminReportsFees = 'Fee Report';
  static const String adminReportsAttendance = 'Attendance Report';

  // ─────────────────────────────────────────────
  // Admin — Settings
  // ─────────────────────────────────────────────
  static const String adminSettings = 'Settings';
  static const String adminSettingsHostelInfo = 'Hostel Information';
  static const String adminSettingsNotifications = 'Notification Settings';
  static const String adminSettingsSecurity = 'Security';
  static const String adminSettingsBackup = 'Backup & Restore';
  static const String adminSettingsAbout = 'About App';

  // ─────────────────────────────────────────────
  // Common / Shared
  // ─────────────────────────────────────────────
  static const String commonSave = 'Save';
  static const String commonCancel = 'Cancel';
  static const String commonDelete = 'Delete';
  static const String commonEdit = 'Edit';
  static const String commonAdd = 'Add';
  static const String commonUpdate = 'Update';
  static const String commonSubmit = 'Submit';
  static const String commonConfirm = 'Confirm';
  static const String commonClose = 'Close';
  static const String commonRetry = 'Retry';
  static const String commonDone = 'Done';
  static const String commonNext = 'Next';
  static const String commonBack = 'Back';
  static const String commonSearch = 'Search';
  static const String commonFilter = 'Filter';
  static const String commonSort = 'Sort';
  static const String commonRefresh = 'Refresh';
  static const String commonViewAll = 'View All';
  static const String commonSeeMore = 'See More';
  static const String commonNoData = 'No data available';
  static const String commonNoInternet = 'No internet connection';
  static const String commonSomethingWrong =
      'Something went wrong. Please try again.';
  static const String commonLoading = 'Loading...';
  static const String commonSuccess = 'Success!';
  static const String commonError = 'Error';
  static const String commonWarning = 'Warning';
  static const String commonInfo = 'Info';
  static const String commonLogout = 'Logout';
  static const String commonLogoutConfirm =
      'Are you sure you want to logout?';
  static const String commonDeleteConfirm =
      'Are you sure you want to delete this?';
  static const String commonYes = 'Yes';
  static const String commonNo = 'No';
  static const String commonOk = 'OK';

  // ─────────────────────────────────────────────
  // Status Labels
  // ─────────────────────────────────────────────
  static const String statusActive = 'Active';
  static const String statusInactive = 'Inactive';
  static const String statusPending = 'Pending';
  static const String statusApproved = 'Approved';
  static const String statusRejected = 'Rejected';
  static const String statusResolved = 'Resolved';
  static const String statusOpen = 'Open';
  static const String statusClosed = 'Closed';
  static const String statusPaid = 'Paid';
  static const String statusUnpaid = 'Unpaid';
  static const String statusOverdue = 'Overdue';

  // ─────────────────────────────────────────────
  // Snackbar / Toast Messages
  // ─────────────────────────────────────────────
  static const String snackLoginSuccess = 'Logged in successfully!';
  static const String snackLogoutSuccess = 'Logged out successfully.';
  static const String snackProfileUpdated = 'Profile updated successfully!';
  static const String snackPasswordChanged = 'Password changed successfully!';
  static const String snackDataSaved = 'Data saved successfully!';
  static const String snackDataDeleted = 'Deleted successfully!';
  static const String snackInternetError =
      'Please check your internet connection.';
  static const String snackSessionExpired =
      'Session expired. Please login again.';
  static const String snackPermissionDenied =
      "You don't have permission to do this.";
  static const String snackFileDownloaded = 'File downloaded successfully!';
}
