import 'package:get/get.dart';
import 'package:statistical_survey/modules/interview_module/interview_module.dart';
import 'package:statistical_survey/modules/introduce_module/splash/splash.dart';
import 'package:statistical_survey/modules/modules.dart';
import 'package:statistical_survey/modules/sync_module/sync_module.dart';
import 'package:statistical_survey/modules/sync_module/sync_screen.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashScreen(),
        binding: SplashBinding(),
        transition: Transition.fade),
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.mainMenu,
        page: () => const MainMenuScreen(),
        binding: MainMenuBinding()),
    GetPage(
        name: AppRoutes.interviewList,
        page: () => const InterviewListScreen(),
        binding: InterviewListBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.locations,
        page: () => const LocationsScreen(),
        binding: LocationsBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.subjectMatterInvestigated,
        page: () => const SubjectMatterInvestigatedScreen(),
        binding: SubjectMatterInvestigatedBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.activeStatus,
        page: () => const ActiveStatusScreen(),
        binding: ActiveStatusBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.generalInformation,
        page: () => const GeneralInformationScreen(),
        binding: GeneralInformationBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.question01,
        page: () => const QuestionNo1Screen(),
        binding: QuestionNo1Binding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.question02,
        page: () => const QuestionNo2Screen(),
        binding: QuestionNo2Binding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.question03,
        page: () => const QuestionNo3Screen(),
        binding: QuestionNo3Binding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.question04,
        page: () => const QuestionNo4Screen(),
        binding: QuestionNo4Binding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.question05,
        page: () => const QuestionNo5Screen(),
        binding: QuestionNo5Binding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.question06,
        page: () => const QuestionNo6Screen(),
        binding: QuestionNo6Binding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.sync,
        page: () => const SyncScreen(),
        binding: SyncBinding(),
        transition: Transition.rightToLeft),
  ];
}
