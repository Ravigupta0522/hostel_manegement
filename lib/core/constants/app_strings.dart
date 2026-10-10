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
  // Auth — Student Portal Login
  // ─────────────────────────────────────────────
  static const String studentPortalTitle = 'Student / Resident Portal';
  static const String switchToAdmin = 'Switch to Admin';
  static const String semesterAutumn2024 = 'Semester Autumn 2024';
  static const String hallDetails = 'North Wing • Block C • Digital Hall Access';
  static const String studentLoginTitle = 'Welcome Back';
  static const String studentLoginSubtitle =
      'Enter your campus credentials to access your hostel account.';
  static const String studentEmailOrId = 'Email / Student ID';
  static const String studentEmailOrIdFormat = 'Format: 2024-CS-108';
  static const String studentEmailOrIdHint =
      'student.id@campus.edu or 2024-CS-10';
  static const String studentPasswordHint = '••••••••••••';
  static const String studentRememberMe = 'Remember me';
  static const String studentForgotPassword = 'Forgot password?';
  static const String studentSignInButton = 'Sign In to Portal';
  static const String wardenLoginNotice = 'Logging in as Hostel Warden ...';
  static const String wardenLoginSub = 'Access room allocations & ma...';
  static const String switchPortalButton = 'Switch portal';
  static const String fastGateScan = 'Fast Gate Scan';
  static const String showEntryPass = 'Show Entry pass';
  static const String campusSsid = 'Campus SSID';
  static const String campusWifiName = 'HostelNet-5G';
  static const String registerHere = 'Register here';
  static const String hostelHelpdesk = 'Hostel Helpdesk';
  static const String dormGuidelines = 'Dorm Guidelines';
  static const String dutyWarden = 'Duty Warden';

  // ─────────────────────────────────────────────
  // Auth — Student Register
  // ─────────────────────────────────────────────
  static const String residentRegistration = 'RESIDENT REGISTRATION';
  static const String termFall2025 = 'Term Fall 2025';
  static const String createStudentAccount = 'Create Student Account';
  static const String createStudentAccountSub =
      'Register with your official campus enrollment details to access your dorm & hostel pass.';
  static const String officialLegalName = 'Official Legal Name';
  static const String fullNameHint = 'e.g. Marcus Richardson';
  static const String studentIdRollNo = 'Student ID / Roll No.';
  static const String studentIdHint = 'E.G. 2025-ENG-4029';
  static const String matchesRegistrar = 'Matches academic registrar records';
  static const String officialEmail = 'Official Email';
  static const String officialEmailHint = 'e.g. marcus.r@campus.edu';
  static const String institutionalDomainHint =
      'Must end in institutional domain (@campus.edu)';
  static const String phoneHint = '98765 43210';
  static const String min8CharsHint =
      'Minimum 8 characters with numbers & symbols';
  static const String termsNoticePart1 = 'I agree to the ';
  static const String hostelRulesTitle = 'Hostel Rules & Terms of Residence';
  static const String termsNoticePart2 = ' and acknowledge the university ';
  static const String privacyPolicyTitle = 'Privacy Policy';
  static const String createAccountButton = 'Create Account';
  static const String alreadyRegistered = 'Already registered? ';
  static const String logIn = 'Log in';
  static const String encryptedBadge =
      '256-Bit Encrypted Campus Student Portal';

  // ─────────────────────────────────────────────
  // Auth — Forgot Password & OTP
  // ─────────────────────────────────────────────
  static const String forgotPassword = 'Forgot Password';
  static const String forgotPasswordHeroTitle = 'Forgot Password?';
  static const String forgotPasswordHeroSub =
      "No worries! Enter your registered campus email or Student ID, and we'll send a 6-digit verification code to reset your password.";
  static const String codesExpire10Min = 'Codes expire after 10 minutes';
  static const String emailOrStudentId = 'Email or Student ID';
  static const String campusActive = 'Campus Active';
  static const String credentialAssignedHint =
      'Use the credential assigned during hostel room allotment.';
  static const String sendVerificationCode = 'Send Verification Code';
  static const String havingTroubleWarden =
      'Having trouble with campus em...';
  static const String visitWardenDesk = 'Visit Warden Desk at Hall Block 4';
  static const String deskInfo = 'Desk Info';
  static const String backToLogin = 'Back to Login';
  static const String securedCampusIdentity =
      'Secured via Campus Identity Provider';

  // ─────────────────────────────────────────────
  // Auth — OTP Verification
  // ─────────────────────────────────────────────
  static const String studentPortalVerification =
      'Student Portal Verification';
  static const String verifyCodeTitle = 'Verify Code';
  static const String verifyCodeSub =
      'We sent a 6-digit OTP code to your registered\nuniversity address';
  static const String edit = 'Edit';
  static const String securityPasscode = 'SECURITY PASSCODE';
  static const String expiringSoon = 'Expiring soon';
  static const String resendCodeIn = 'Resend code in ';
  static const String resendOtpNow = 'Resend OTP now';
  static const String verifyAndProceed = 'Verify & Proceed';
  static const String didntReceiveEmail = "Didn't receive the email?";
  static const String spamFilterAdvice =
      'Please check your spam/junk folder or institutional filters. University domains occasionally quarantine automated alerts.';
  static const String contactWardenOffice = 'Contact Hostel Warden Office';
  static const String tryViaSms = 'Try receiving passcode via SMS instead';
  static const String ssoSessionSecured =
      'HostelFlow Single Sign-On Secured • Session ID: #HF-8924';

  static const String forgotPasswordTitle = 'Reset Password';
  static const String forgotPasswordSubtitle =
      'Enter your registered email to receive a reset link.';
  static const String forgotPasswordButton = 'Send Reset Link';
  static const String forgotPasswordSuccess =
      'Reset link sent! Check your email.';

  // ─────────────────────────────────────────────
  // Auth — OTP Verification (Generic)
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
  // Auth — Set New Password
  // ─────────────────────────────────────────────
  static const String resetPassword = 'Reset Password';
  static const String resetPasswordTitle = 'Set New Password';
  static const String resetPasswordSubtitle = 'Your new password must be strong';
  static const String resetPasswordButton = 'Update Password';
  static const String resetPasswordSuccess = 'Password updated successfully!';
  static const String accountSecurity = 'ACCOUNT SECURITY';
  static const String setNewPasswordTitle = 'Set New Password';
  static const String setNewPasswordSub =
      'Must be at least 8 characters and include at least one number or special character.';
  static const String newPassword = 'New Password';
  static const String requiredLabel = 'Required';
  static const String securityStrength = 'Security Strength';
  static const String strengthStrong = 'Strong';
  static const String strengthGood = 'Good';
  static const String strengthFair = 'Fair';
  static const String strengthWeak = 'Weak';
  static const String confirmNewPassword = 'Confirm New Password';
  static const String matched = 'Matched';
  static const String passwordRequirements = 'PASSWORD REQUIREMENTS';
  static const String reqMin8Chars = 'At least 8 characters';
  static const String reqOneNumeric = 'At least one numeric digit';
  static const String reqMatchConfirmed = 'Match confirmed password';
  static const String resetPasswordAction = 'Reset Password';
  static const String havingTroubleWardenOffice =
      'Having trouble? Contact Hostel Warden Office';

  // ─────────────────────────────────────────────
  // Auth — Password Reset Complete
  // ─────────────────────────────────────────────
  static const String accountSecurityUpdated = 'ACCOUNT SECURITY UPDATED';
  static const String passwordResetComplete = 'Password Reset Complete!';
  static const String passwordResetCompleteSub =
      'Your password has been successfully updated. You can now log into your HostelFlow resident or admin account with your new credentials.';
  static const String campusPortalTitle = 'HostelFlow Campus Portal';
  static const String residencyAccessDetails =
      'North Wing • Hall 4 Residency Access';
  static const String ssoActive = 'Single Sign-On Active';
  static const String sessionsSecured = 'Sessions Secured';
  static const String sessionsSecuredNotice =
      'Your active sessions have been secured. If you did not make this change, please immediately contact the Campus IT Desk.';
  static const String contactItSupportDesk = 'Contact IT Support Desk';
  static const String encryptedStudentCredentialChannel =
      'Encrypted 256-bit student credential channel';

  // ─────────────────────────────────────────────
  // Auth — Security Feedback & Snackbars
  // ─────────────────────────────────────────────
  static const String snackWeakPasswordTitle = 'Weak Password';
  static const String snackWeakPasswordMsg =
      'Password must be at least 8 characters and include a number or symbol.';
  static const String snackPasswordMismatchTitle = 'Passwords Do Not Match';
  static const String snackPasswordMismatchMsg =
      'Please ensure both passwords match identically.';
  static const String snackWardenHelpdeskTitle = 'Warden Office Helpdesk';
  static const String snackWardenHelpdeskMsg =
      'Contact Campus Warden: Ext 4022 | Hall Block 4 Incharge Desk';
  static const String snackItSupportTitle = 'IT Support Desk';
  static const String snackItSupportMsg =
      'Connecting to Campus IT Support: support@campus.edu | Hall 4 Helpdesk';
  static const String snackSessionClearedTitle = 'Session Cleared';
  static const String snackSessionClearedMsg =
      'Active campus sessions have been refreshed.';
  static const String snackOtpIncompleteTitle = 'Incomplete Code';
  static const String snackOtpIncompleteMsg =
      'Please enter all 6 digits of the verification passcode.';
  static const String snackOtpVerifiedTitle = 'Verification Success';
  static const String snackOtpVerifiedMsg =
      'Your identity has been authenticated.';
  static const String snackOtpResentTitle = 'Code Resent';
  static const String snackOtpResentMsgPrefix =
      'A fresh 6-digit OTP passcode has been sent to ';
  static const String snackSmsDispatchedTitle = 'SMS Dispatch';
  static const String snackSmsDispatchedMsg =
      'Passcode sent to registered mobile number ending in •••• 3210';
  static const String dialogUpdateEmailTitle = 'Update Campus Email';
  static const String dialogUpdateEmailHint = 'Enter new email address';
  static const String dialogUpdateEmailConfirm = 'Update';

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

  // ─────────────────────────────────────────────
  // Student — Rules & Residence
  // ─────────────────────────────────────────────
  static const String rulesTitle = 'Hostel Rules & Code of Conduct';
  static const String rulesSubtitle =
      'Official Resident Guidelines & Safety Policies';
  static const String rulesDownloadPdf = 'Download Hostel Rules (PDF)';
  static const String rulesReassignmentInquiry =
      'Request Room Reassignment / Inquire';
  static const String rulesDefaultHallName = 'Westwood Hall & Oak Court';
  static const String rulesDefaultHallLocation =
      '412 University Blvd, Campus North Quad';
  static const String rulesDefaultCampusZone = 'North Wing Campus';
  static const String rulesCertifiedHallBadge = 'CERTIFIED RESIDENT HALL';
  static const String rulesLiveOccupancy = 'Live Occupancy Status';
  static const String rulesTotalBeds = 'Total Beds';
  static const String rulesBookedBeds = 'Booked';
  static const String rulesVacancies = 'Vacancies';
  static const String rulesResidenceProfile = 'Residence Profile';
  static const String rulesCommunityFacilities = 'Community Facilities';
  static const String rulesResidentPortals = 'Resident Portals';
  static const String rulesStaffHelpDesk = 'Staff & Help Desk';
  static const String rulesWardenDesk = 'Warden Office Desk';
  static const String rulesCampusSecurityDispatch =
      'Campus Security Dispatch';
  static const String rulesAdminDesk = 'Administrative Desk';
  static const String rulesOpenPdf = 'Open PDF';
  static const String rulesPdfSavedToStorage = 'Saved to system storage:';
  static const String rulesPdfDownloading = 'Downloading Rules PDF';
  static const String rulesPdfCompleted = 'Download Completed!';
  static const String rulesPdfFileName = 'Westwood_Hall_Rules_2024-25.pdf';

  // ─────────────────────────────────────────────
  // Student — Settings
  // ─────────────────────────────────────────────
  static const String settingsTitle = 'Student Settings';
  static const String settingsSubtitle = 'Manage your preferences & account';
  static const String settingsVerifiedResident = 'VERIFIED RESIDENT';
  static const String settingsPreferences = 'Preferences';
  static const String settingsNotifications = 'Notifications';
  static const String settingsSecurity = 'Security';
  static const String settingsHostelInfo = 'Hostel & Room Information';
  static const String settingsEmergencyContacts = 'Emergency Contacts';
  static const String settingsDocuments = 'Resident Documents';
  static const String settingsLegal = 'Legal & Policies';
  static const String settingsAccountActions = 'Account Actions';
}
