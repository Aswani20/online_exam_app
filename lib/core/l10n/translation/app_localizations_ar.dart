// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'تطبيق الامتحانات ';

  @override
  String get userName => 'اسم المستخدم';

  @override
  String get userNameHint => 'ادخل اسم المستخدم';

  @override
  String get firstName => 'الاسم الاول';

  @override
  String get firstNameHint => 'ادخل الاسم الاول';

  @override
  String get lastName => 'الاسم الاخير';

  @override
  String get lastNameHint => 'ادخل الاسم الاخير';

  @override
  String get email => 'البريد الالكتروني';

  @override
  String get emailHint => 'الدخل البريد الالكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get passwordHint => 'ادخل كلمة المرور';

  @override
  String get confirmPassword => 'تاكيد كلمة المرور';

  @override
  String get confirmPasswordHint => 'ادخل كلمة المرور مره اخري';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get phoneNumberHint => 'ادخل رقم الهاتف';

  @override
  String get signUp => 'تسجيل الدخول';

  @override
  String get haveAccount => 'هل لديك حساب بالفعل؟';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get pleaseEnterValue => 'ادخل قيمة';

  @override
  String get pleaseEnterName => 'من فضلك ادخل الاسم';

  @override
  String get nameMustBeMoreThan3Characters =>
      'الاسم يجب ان يكون اكبر من 3 حروف';

  @override
  String get passwordMustContainUpperLowerAndSpecialCharacter =>
      'يحب ان يحتوي علي حرف كبير و حرف صغير ورمز مميز';

  @override
  String get passwordsDoNotMatch => 'كلمة المرور غير متطابقه';

  @override
  String get pleaseEnterYourPassword => 'ادخل كلمة المرور';

  @override
  String get pleaseEnterYourEmail => 'ادخل البريد الالكتروني';

  @override
  String get emailMustBeLikeThisExampleGmailCom =>
      'البريد الالكتروني يجب ان يكون  \"example@gmail.com';

  @override
  String get pleaseEnterYourPhoneNumber => 'ادخل رقم الهاتف ';

  @override
  String get enterAValidEgyptianPhoneNumber =>
      'ادخل رفم هاتف مصري  (e.g., 01xxxxxxxxx)';
}
