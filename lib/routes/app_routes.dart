part of 'app_pages.dart';

abstract class AppRoutes {
  // unknown page
  static const unknownPage = '/not-found';

  static const splash = '/';

  // auth
  static const login = '/login';

  // main_menu
  static const mainMenu = '/main-menu';

  //interview
  static const locations = '/locations';
  static const interviewList = '/interviewList';
  static const subjectMatterInvestigated = '/subject';
  static const menu = '/interview-menu';

  //questions
  static const activeStatus = '/status';
  static const generalInformation = '/general-information';
  static const sync = '/sync';
  static const intervieweeInformation = '/interviewee-information';

  static const question01 = '/question-01';
  static const question02 = '/question-02';
  static const question03 = '/question-03';
  static const question04 = '/question-04';
  static const question05 = '/question-05';
  static const question06 = '/question-06';
}
