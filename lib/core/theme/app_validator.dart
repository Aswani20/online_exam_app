import 'package:flutter/material.dart';

class AppValidators {
  //Non_empty validator
  static String? nonEmptyField(value) {
    if (value == null || value.isEmpty) {
      return "Please enter value";
    }
    return null;
  }

  //first-last name validator
  static String? nameValidator(value) {
    if (value == null || value.isEmpty) {
      return "Please enter name";
    }
    final lengthRegex = RegExp(r'^.{3,}$');
    if (!lengthRegex.hasMatch(value)) {
      return "Name must be more than 3 characters";
    }
    return null;
  }

  //Password validator
  static String? passwordValidator(value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }
    final passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');
    if (!passwordRegex.hasMatch(value)) {
      return 'Password must contain upper, lower, and special character';
    }
    return null;
  }

  //Confirm password validator
  static String? confirmPasswordValidator(value, TextEditingController passwordController) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }
    if (value != passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  //Email validation
  static String? emailValidator(value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    }
    final customEmailRegex = RegExp(r'^[\w.-]+@[\w-]+\.[a-zA-Z]{2,}$');
    if (!customEmailRegex.hasMatch(value)) {
      return 'Email must be like this "example@gmail.com';
    }
    return null;
  }

  //Phone validation
  static String? phoneNumberValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    final egyptPhoneRegex = RegExp(r'^01[0125][0-9]{8}$');
    if (!egyptPhoneRegex.hasMatch(value)) {
      return 'Enter a valid Egyptian phone number (e.g., 01xxxxxxxxx)';
    }

    return null;
  }
}
