import 'package:flutter/foundation.dart';

import '../singleton/AppFlavor.dart';

class ApiUrl {
  static String baseUrl = AppFlavor.shared.baseUrl;
  static String mixpanelToken =
      !kReleaseMode
          ? "18499ebeb467de73e31313a93d244001"
          : "601a870f32f08047710fb819d48b6a65";
  static const String dashBoarData = "api/v1/platform_metrics";
  static const String homepageUrl = "api/v2/homepage";
  static const String faqUrl = "api/v1/faqs";
  static const String newsUrl = "api/v1/news";
  static const String allFirmsUrl = "api/v1/farms";
  static const String homePageStatsUrl = "api/v1/quick_stats";
  static const String blogUrl = "api/v1/blogs";
  static const String farmDetailsUrl = "api/v1/farms/";
  static const String loginUrl = "api/v1/users/login";
  static const String registrationUrl = "api/v1/users/register";
  static const String registrationVerifyUrl =
      "api/v1/users/complete_registration";
  static const String privacyUrl = "api/v1/users/privacy_policy";
  static const String privacyUpdateUrl = "api/v1/users/update_privacy_flag";
  static const String forgetPasswordUrl = "api/v1/users/forgot_password";
  static const String resetPasswordUrl = "api/v1/users/password_reset";
  static const String userdashboard = "api/v2/users/dashboard";
  static const String homeUserDashboard = "api/v2/users/user_dashboard";
  static const String calendarEvents = "api/v1/calendar_events?date=";
  static const String notificationUrl = "api/v1/users/notifications";
  static const String userDetailsUrl = "api/v1/users/user_details";
  static const String logOutUrl = "api/v1/users/logout";
  static const String orders = "api/v2/orders/";
  static const String contactUsTypeUrl = "api/v1/users/contact_request_types";
  static const String contactUsUrl = "api/v1/users/contact_us";
  static const String reportTypeUrl = "api/v1/issue_reporting/issue_types";
  static const String reportFarmUrl = "api/v1/issue_reporting/issuable_farms";
  static const String activeOrders = "api/v2/user_orders/active_orders";
  static const String reportSubmitUrl = "api/v1/issue_reporting/report_issue";
  static const String profitDisbursedOrders =
      "api/v2/user_orders/profit_disbursed_orders";
  static const String notification = "api/v2/users/notifications";
  static const String reportListUrl =
      "api/v1/issue_reporting/issue_tickets_list/";
  static const String reportFeedbackUrl =
      "api/v1/issue_reporting/issue_tickets/";
  static const String fundingSummaryUrl =
      "api/v1/users/funding_summary_download";
  static const String ordersV1 = "api/v1/orders/";
  static const String farmProgression = "/farm_progression";
  static const String nidVerificationUrl = "api/v1/users/verify_user_nid";
  static const String checkForUpdate = "/api/v1/users/check_for_update";
  static const String userImageUrl = "api/v1/users/";
  static const String referUrl = "/api/v1/users/apply_my_referral_code";
  static const String firmBookUrl = "api/v2/orders/book_order";
  static const String paymentMethodUrl = "api/v2/payment_methods?bracket=";
  static const String paymentProofUrl = "api/v2/orders/";
  static const String chequeAreaUrl =
      "api/v2/payment_methods/cheque_collection_areas";
  static const String chequeDatesUrl =
      "api/v2/payment_methods/available_cheque_collect_dates?order_id=";
  static const String chequeSubmitUrl = "/provide_proof_by_cheque";
  static const String chequeProofUrl = "/upload_cheque_proof/";
  static const String verifyImageUrl = "/verify_image";
  static const String sendFcmToken = "api/v1/mobile_tokens/update_push_token";
  static const String socialLogin = "api/v1/users/social_login";
  static const String chatPrimaryIdValue = "ac766dd8bc7e11eb92ee0242ac120005";
  static const String chatPlatFromIdValue = "1694";
  static const String chatBotUrl =
      "https://prod-api.myalice.ai/api/bots/get_app_url";
  static const String chatBotToken =
      "9bb4f0a27dfaf89d988ccf2ef23cc5cbae99a9f87df0c371";

  static const String tncUrl = "https://www.ifarmer.asia/en/terms_of_services";
  static const String taxTimeline = "api/v1/users/tax_timeline";
  static const String taxRequest = "api/v1/users/tax_requests";
  static const String taxCerDownload = "api/v1/users/tax_certificate_download";
  static const String uploadTax = "api/v1/users/request_tax_certificate";
  static const String bankListUrl = "https://icore.ifarmer.asia/api/v1/banks";
  static const String branchListUrl = "/branches";
  static const String unreadNotification = "api/v2/users/check_notifications";
  static const String deleteProfile = "api/v1/users/delete_account";
}
