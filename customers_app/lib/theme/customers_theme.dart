import 'package:flutter/material.dart';

class CustomersTheme {
  // Border radius
  static const double radius = 8;

  // Colors
  static final CustomersColors colors = CustomersColors();

  // Gradients
  static final CustomersGradients gradients = CustomersGradients();

  // Text
  static final CustomersTextStyles textStyles = CustomersTextStyles();

  // Text selection
  static const textSelectionTheme = TextSelectionThemeData(
    cursorColor: Color(0xff599873),
    selectionColor: Color.fromRGBO(89, 152, 115, 0.3),
    selectionHandleColor: Color(0xff599873),
  );

  // Text button
  static final textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateColor.resolveWith(
        (states) => const Color(0xff599873),
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontFamily: 'Almarai',
          fontSize: 13,
          color: Color(0xff599873),
        ),
      ),
    ),
  );
}

class CustomersColors {
  Color primaryColor = const Color.fromRGBO(69, 131, 95, 1);
  Color primaryColorTransparent = const Color.fromRGBO(89, 152, 115, 0.3);
  Color text = const Color.fromARGB(255, 255, 255, 255);
  Color firstSecondaryColor = const Color.fromARGB(255, 81, 143, 234);
  Color secondSecondaryColor = const Color.fromARGB(255, 180, 180, 180);
  Color successColor = const Color.fromARGB(255, 0, 109, 62);
  Color errorColor = const Color.fromARGB(255, 155, 55, 77);
  Color backgroundColor = const Color.fromARGB(255, 248, 250, 255);
  Color fieldFillColor = const Color.fromARGB(255, 245, 245, 255);
  Color displayTextColor = const Color.fromARGB(255, 34, 46, 39);
  Color dialogNoteColor = const Color.fromARGB(255, 126, 126, 126);
  Color fieldContentColor = const Color(0xff599873);
  Color fieldLabel = Colors.grey;
  Color verySlight = const Color(0xFF129049);
  Color slight = const Color.fromARGB(255, 114, 145, 57);
  Color noticeable = const Color.fromARGB(255, 219, 202, 42);
  Color sever = const Color(0xFFc05b26);
  Color verySever = const Color.fromARGB(255, 201, 62, 38);
}

class CustomersGradients {
  LinearGradient horizontalGradient = const LinearGradient(
    colors: [
      Color.fromRGBO(89, 152, 115, 0.2),
      Color.fromRGBO(89, 152, 115, 0.8),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0, 1],
  );
  LinearGradient verticalGradient = const LinearGradient(
    colors: [
      Color.fromRGBO(89, 152, 115, 0.2),
      Color.fromRGBO(89, 152, 115, 0.8),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0, 1],
  );
}

class CustomersTextStyles {
  TextStyle titleLarge = const TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Color(0xff599873),
  );
  TextStyle listDividerLabel = TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 13,
    color: CustomersTheme.colors.primaryColor,
    decoration: TextDecoration.none,
  );
  TextStyle titleMedium = const TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 13,
    color: Color(0xff599873),
  );
  TextStyle display = const TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 10,
    color: Color.fromARGB(255, 117, 117, 117),
  );
  TextStyle displayLarge = const TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 12,
    color: Color.fromARGB(255, 117, 117, 117),
  );
  TextStyle displayLarger = const TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 16,
    color: Color.fromARGB(255, 117, 117, 117),
  );
  TextStyle displayMedium = const TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 8,
    color: Color.fromARGB(255, 117, 117, 117),
  );
  TextStyle labelSmall = const TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 10,
    color: Color.fromARGB(255, 117, 117, 117),
  );
  TextStyle fieldError = TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 8,
    color: CustomersTheme.colors.errorColor,
  );
  TextStyle fieldLabel = TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 13,
    color: CustomersTheme.colors.fieldLabel,
  );
  TextStyle dialogLabel = TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 13,
    color: CustomersTheme.colors.displayTextColor,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w200,
    height: 2,
  );
  TextStyle dialogNote = TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 10,
    color: CustomersTheme.colors.dialogNoteColor,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w200,
    height: 2,
  );
  TextStyle dialogButtonText = const TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 10,
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    color: Colors.white,
  );
  TextStyle fieldContent = TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 13,
    color: CustomersTheme.colors.fieldContentColor,
    decoration: TextDecoration.none,
  );
  TextStyle priceFloor = const TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Color(0xff599873),
  );
  TextStyle currency = const TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: Color(0xff599873),
  );
  TextStyle priceFraction = const TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: Color(0xff599873),
  );
  TextStyle priceFloorLarge = const TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color(0xff599873),
  );
  TextStyle currencyLarge = const TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Color(0xff599873),
  );
  TextStyle priceFractionLarge = const TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xff599873),
  );
}

class CustomersInputDecoration extends InputDecoration {
  // Login credentials fields
  CustomersInputDecoration.primary({required String label})
      : super(
          labelText: label,
          errorStyle: CustomersTheme.textStyles.fieldError,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: CustomersTheme.textStyles.fieldLabel,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius:
                  BorderRadius.all(Radius.circular(CustomersTheme.radius))),
          filled: true,
          fillColor: CustomersTheme.colors.fieldFillColor,
        );
// Form fields
  CustomersInputDecoration.form({required String label, required Widget icon})
      : super(
          labelText: label,
          errorStyle: CustomersTheme.textStyles.fieldError,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8),
            child: icon,
          ),
          labelStyle: CustomersTheme.textStyles.fieldLabel,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius:
                  BorderRadius.all(Radius.circular(CustomersTheme.radius))),
          filled: true,
          fillColor: CustomersTheme.colors.fieldFillColor,
        );

  // Filters fields
  CustomersInputDecoration.filter({required String label})
      : super(
          labelText: label,
          errorStyle: CustomersTheme.textStyles.fieldError,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              'lib/assets/icons/search.png',
              color: Colors.grey,
              height: 15,
              width: 15,
            ),
          ),
          labelStyle: CustomersTheme.textStyles.fieldLabel,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius:
                  BorderRadius.all(Radius.circular(CustomersTheme.radius))),
          filled: true,
          fillColor: CustomersTheme.colors.fieldFillColor,
        );

  CustomersInputDecoration.dropdown({required String label})
      : super(
            labelText: label,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: CustomersTheme.textStyles.fieldLabel,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius:
                  BorderRadius.all(Radius.circular(CustomersTheme.radius)),
            ),
            filled: true,
            fillColor: const Color.fromARGB(255, 245, 245, 255));
}
