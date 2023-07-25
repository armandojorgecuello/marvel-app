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

  static String m0(to) => "Latest update: ${to}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "sCreatorDescriptionScreenInfo": MessageLookupByLibrary.simpleMessage(
            "These are the comics in which this author has collaborated:"),
        "sDescriptionScreenComicCreators":
            MessageLookupByLibrary.simpleMessage("Creators"),
        "sDescriptionScreenComicStories":
            MessageLookupByLibrary.simpleMessage("Stories"),
        "sDescriptionScreenDescription":
            MessageLookupByLibrary.simpleMessage("Description"),
        "sDescriptionScreenDigitalPurchasePrice":
            MessageLookupByLibrary.simpleMessage("Digital value"),
        "sDescriptionScreenLastUpdateDate": m0,
        "sDescriptionScreenNoDescription": MessageLookupByLibrary.simpleMessage(
            "This comic does not have a description"),
        "sDescriptionScreenPrintPrice":
            MessageLookupByLibrary.simpleMessage("Printed value"),
        "sHomehScreenFilterBy":
            MessageLookupByLibrary.simpleMessage("Filter by:"),
        "sHomehScreenNoInformationAvailable":
            MessageLookupByLibrary.simpleMessage("No Information Available"),
        "sHomehScreenTitle": MessageLookupByLibrary.simpleMessage("Marvel App"),
        "sPlashScreenStaticText":
            MessageLookupByLibrary.simpleMessage("You can find"),
        "sSplashScreenComic": MessageLookupByLibrary.simpleMessage("Comic"),
        "sSplashScreenDigest": MessageLookupByLibrary.simpleMessage("Digest"),
        "sSplashScreenDigitalComic":
            MessageLookupByLibrary.simpleMessage("Digital comic"),
        "sSplashScreenGraphicNovel":
            MessageLookupByLibrary.simpleMessage("Graphic novel"),
        "sSplashScreenHardcover":
            MessageLookupByLibrary.simpleMessage("Hardcover"),
        "sSplashScreenInfiniteComic":
            MessageLookupByLibrary.simpleMessage("Infinite comic"),
        "sSplashScreenMagazine":
            MessageLookupByLibrary.simpleMessage("Magazine"),
        "sSplashScreenTradePaperback":
            MessageLookupByLibrary.simpleMessage("Trade paperback")
      };
}
