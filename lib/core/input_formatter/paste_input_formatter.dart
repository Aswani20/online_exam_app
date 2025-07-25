import 'package:flutter/services.dart';

class PasteInputFormatter extends TextInputFormatter {
  final Function(String) onPaste;

  PasteInputFormatter({required this.onPaste});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.length > oldValue.text.length) {
      Clipboard.getData(Clipboard.kTextPlain).then((clipboardData) {
        if (clipboardData != null) {
          onPaste(clipboardData.text ?? '');
        }
      });
    }
    return newValue;
  }
}
