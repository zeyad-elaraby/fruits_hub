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

  static String m0(amount) => "Pay ${amount} EGP";

  static String m1(count) => "You have ${count} products in the shopping cart";

  static String m2(value) => "${value} Kilo";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "address": MessageLookupByLibrary.simpleMessage("Address"),
    "bestSelling": MessageLookupByLibrary.simpleMessage("Best Selling"),
    "cart": MessageLookupByLibrary.simpleMessage("Cart"),
    "cashOnDelivery": MessageLookupByLibrary.simpleMessage("Cash on Delivery"),
    "city": MessageLookupByLibrary.simpleMessage("City"),
    "confirm_order_prompt": MessageLookupByLibrary.simpleMessage(
      "Please confirm your order",
    ),
    "createAccount": MessageLookupByLibrary.simpleMessage("Create Account"),
    "createNewAccount": MessageLookupByLibrary.simpleMessage(
      "Create New Account",
    ),
    "delivery": MessageLookupByLibrary.simpleMessage("Delivery"),
    "delivery_address": MessageLookupByLibrary.simpleMessage(
      "Delivery Address",
    ),
    "dontHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account?",
    ),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "egPound": MessageLookupByLibrary.simpleMessage("EGP"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "floor": MessageLookupByLibrary.simpleMessage(
      "Floor Number , Apartment Number ..",
    ),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Forgot Password?"),
    "forgotPasswordEmailDescription": MessageLookupByLibrary.simpleMessage(
      "Don\'t worry, just enter your email and we\'ll send a reset password link.",
    ),
    "forgotThePassword": MessageLookupByLibrary.simpleMessage(
      "Forgot Password",
    ),
    "fullName": MessageLookupByLibrary.simpleMessage("Full Name"),
    "goodMorning": MessageLookupByLibrary.simpleMessage("Good Morning !.."),
    "haveAccount": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "more": MessageLookupByLibrary.simpleMessage("More"),
    "myAccount": MessageLookupByLibrary.simpleMessage("My Account"),
    "newAccount": MessageLookupByLibrary.simpleMessage("New Account"),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "onlinePayment": MessageLookupByLibrary.simpleMessage("Online Payment"),
    "or": MessageLookupByLibrary.simpleMessage("Or"),
    "orderAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Order added successfully",
    ),
    "order_summary": MessageLookupByLibrary.simpleMessage("Order Summary"),
    "paayWithPaypal": MessageLookupByLibrary.simpleMessage("Pay with Paypal"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "payButtonLabel": m0,
    "payment": MessageLookupByLibrary.simpleMessage("Payment"),
    "payment_method": MessageLookupByLibrary.simpleMessage("Payment Method"),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "pickupFromLocation": MessageLookupByLibrary.simpleMessage(
      "Pickup From Location",
    ),
    "pleaseSelectPaymentMethod": MessageLookupByLibrary.simpleMessage(
      "Please select a payment method",
    ),
    "products": MessageLookupByLibrary.simpleMessage("Products"),
    "productsInCart": m1,
    "results": MessageLookupByLibrary.simpleMessage("Results"),
    "review": MessageLookupByLibrary.simpleMessage("Review"),
    "searchAbout": MessageLookupByLibrary.simpleMessage("Search about......."),
    "sendTheLink": MessageLookupByLibrary.simpleMessage("Send The Link"),
    "shipping": MessageLookupByLibrary.simpleMessage("Shipping"),
    "shopNow": MessageLookupByLibrary.simpleMessage("Shop Now"),
    "shoppingCart": MessageLookupByLibrary.simpleMessage("Shopping Cart"),
    "signInWithApple": MessageLookupByLibrary.simpleMessage(
      "Sign in with Apple",
    ),
    "signInWithFacebook": MessageLookupByLibrary.simpleMessage(
      "Sign in with Facebook",
    ),
    "signInWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Sign in with Google",
    ),
    "subtotal": MessageLookupByLibrary.simpleMessage("Subtotal"),
    "success": MessageLookupByLibrary.simpleMessage("Success"),
    "termsAndConditionsPrefix": MessageLookupByLibrary.simpleMessage(
      "By creating an account, you agree to",
    ),
    "termsAndConditionsSuffix": MessageLookupByLibrary.simpleMessage(
      "our Terms and Conditions",
    ),
    "total": MessageLookupByLibrary.simpleMessage("Total"),
    "verificationEmailSentSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Verification email sent successfully",
    ),
    "warning": MessageLookupByLibrary.simpleMessage("Warning"),
    "weightInKilos": m2,
  };
}
