import 'core/utils/app_strings.dart';
import 'models/onboarding_model.dart';
import 'models/setting_model.dart';

const String kPrimaryFontFamily = 'Raleway';
const String kAssetsImages = 'assets/images/';

List<OnboardingModel> pages = [
  OnboardingModel(icon: AppStrings.lightIcon, title: 'Examples', statements: [
    '“Explain quantum computing in\nsimple terms”',
    '“Got any creative ideas for a 10\nyear old’s birthday?”',
    '“How do I make an HTTP request\nin Javascript?”',
  ]),
  OnboardingModel(
      icon: AppStrings.flashIcon,
      title: 'Capabilities',
      statements: [
        'Remembers what user said earlier\nin the conversation',
        'Allows user to provide follow-up\ncorrections',
        'Trained to decline inappropriate\nrequests',
      ]),
  OnboardingModel(
      icon: AppStrings.limitationIcon,
      title: 'Limitations',
      statements: [
        'May occasionally generate\nincorrect information',
        'May occasionally produce harmful\ninstructions or biased content',
        'Limited knowledge of world and\nevents after 2021',
      ]),
];

List<SettingModel> settings = [
  SettingModel(icon: AppStrings.editIcon, title: 'Edit'),
  SettingModel(icon: AppStrings.deleteIcon, title: 'Delete'),
];

const String apiKey = 'AIzaSyCkiS30aRwUXUrA1G9on9QqISGTB-ApkrY';
