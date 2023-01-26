// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_name": MessageLookupByLibrary.simpleMessage("lblbc"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "input_content":
            MessageLookupByLibrary.simpleMessage("Please enter content"),
        "input_password":
            MessageLookupByLibrary.simpleMessage("Please enter password"),
        "input_user_name":
            MessageLookupByLibrary.simpleMessage("Please enter user name"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "mine": MessageLookupByLibrary.simpleMessage("Mine"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "save": MessageLookupByLibrary.simpleMessage("Save")
      };
}
