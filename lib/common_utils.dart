class CommonUtils {
  final String baseURL = "https://api.neurotags.in/user/service/openapi?";

// DEV
  // final String signInURL = 'https://dev.qrcodechimp.com/user/services/openapi';
  // final String updateProf = 'https://dev.qrcodechimp.com/user/services/api';
  // final String historyURL = 'https://dev.qrcodechimp.com/app/services/api';

//PROD
  final String signInURL = 'https://www.qrcodechimp.com/user/services/openapi';
  final String updateProf = 'https://www.qrcodechimp.com/user/services/api';
  final String historyURL = 'https://www.qrcodechimp.com/app/services/api';

//Shared Preference
  var history = 'tag_history';
  var history_rec_count = 'history_rec_count';
  var firstSignin = 'first_signin';
  var resetFlash = 'launch';
  var favourite = 'tag_fav';
  var loginRes = 'loginRes';
  var vibrate = 'vibrate';
  var beep = 'beep';
  var saveHistory = 'savehistory';
  var defaultScanScreen = 'defaultScanScreen';

  //Colors
  var historyScreenTitle = '#061244';
  var primaryBlueColor = '#4D77FA';
  var greyColor = '#ECEEF7';
  var cardBgLightBlue = '#B1C0F9';
  var textGreyColor = '#76839C';
  var textLignBlueColor = '#4D77FA';
  var hintColor = '#949494';
  var generateURLGreyColor = '#39393A';
  var favColor = '#FF9190';
  var historyListHeaderColor = '#9FA4B3';
}
