import '../../../core/helpers/hive_helper.dart';

class OnBoardingController {
  static bool isOnBoarded() {
    return HiveHelper.settingsBox.get('isOnboarded', defaultValue: false);
  }

  static void setOnBoarded() {
    HiveHelper.settingsBox.put('isOnboarded', true);
  }
}
