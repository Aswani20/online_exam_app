// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Online Exam App';

  @override
  String get userName => 'User Name';

  @override
  String get userNameHint => 'Enter your user name';

  @override
  String get firstName => 'First Name';

  @override
  String get firstNameHint => 'Enter your first name';

  @override
  String get lastName => 'Last Name';

  @override
  String get lastNameHint => 'Enter your last name';

  @override
  String get email => 'Email';

  @override
  String get emailHint => 'Enter your email';

  @override
  String get password => 'Password';

  @override
  String get passwordHint => 'Enter password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get confirmPasswordHint => 'Confirm password';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get phoneNumberHint => 'Enter your phone number';

  @override
  String get signUp => 'Sign Up';

  @override
  String get haveAccount => 'Already have an account?';

  @override
  String get login => 'Login';

  @override
  String get pleaseEnterValue => 'Please enter value';

  @override
  String get pleaseEnterName => 'Please enter name';

  @override
  String get nameMustBeMoreThan3Characters =>
      'Name must be more than 3 characters';

  @override
  String get passwordMustContainUpperLowerAndSpecialCharacter =>
      'Password must contain upper, lower, and special character';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get pleaseEnterYourPassword => 'Please enter your password';

  @override
  String get pleaseEnterYourEmail => 'Please enter your email';

  @override
  String get emailMustBeLikeThisExampleGmailCom =>
      'Email must be like this \"example@gmail.com';

  @override
  String get pleaseEnterYourPhoneNumber => 'Please enter your phone number';

  @override
  String get enterAValidEgyptianPhoneNumber =>
      'Enter a valid Egyptian phone number (e.g., 01xxxxxxxxx)';
}
