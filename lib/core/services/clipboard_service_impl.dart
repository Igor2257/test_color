import 'package:flutter/services.dart';
import 'package:test_color/core/services/clipboard_service.dart';

class ClipboardServiceImpl implements ClipboardService {
  @override
  Future<void> copy(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }
}
