import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinEntryTextField extends StatefulWidget {
  final String? lastPin;
  final int fields;
  final ValueChanged<String> onSubmit;
  final double fieldWidth;
  final double fontSize;
  final bool isTextObscure;
  final bool showFieldAsBox;
  final cursorColor;  // Leaving the data type dynamic for adding Color or Material Color
  final boxColor;
  final textColor;

  PinEntryTextField(
      { this.lastPin,
        this.fields: 4,
        required this.onSubmit,
        this.fieldWidth: 60.0,
        this.fontSize: 20.0,
        this.isTextObscure: false,
        this.showFieldAsBox: false,
        this.cursorColor: Colors.blue,  // Adding a Material Color so that if the user want black, it get accepted too
        this.boxColor: Colors.blue,
        this.textColor: Colors.black,

      })
      : assert(fields > 0);

  @override
  State createState() {
    return PinEntryTextFieldState();
  }
}

class PinEntryTextFieldState extends State<PinEntryTextField> {
  String _pin1 = '';
  String _pin2 = '';
  String _pin3 = '';
  String _pin4 = '';
  late List<String> _pin;
  FocusNode _focusNodes1 = FocusNode();
  FocusNode _focusNodes2 = FocusNode();
  FocusNode _focusNodes3 = FocusNode();
  FocusNode _focusNodes4 = FocusNode();
  late List<FocusNode> _focusNodes;
  TextEditingController _textControllers1 = TextEditingController();
  TextEditingController _textControllers2 = TextEditingController();
  TextEditingController _textControllers3 = TextEditingController();
  TextEditingController _textControllers4 = TextEditingController();
  late List<TextEditingController> _textControllers;


  Widget textFields = Container();

  @override
  void initState() {
    super.initState();
    _pin = [_pin1, _pin2,_pin3,_pin4];
    _focusNodes = [_focusNodes1, _focusNodes2,_focusNodes3,_focusNodes4];
    _textControllers = [_textControllers1, _textControllers2,_textControllers3,_textControllers4];
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        if (widget.lastPin != null) {
          for (var i = 0; i < widget.lastPin!.length; i++) {
            _pin[i] = widget.lastPin![i];
          }
        }
        textFields = generateTextFields(context);
      });
    });
  }


  @override
  void dispose() {
    _textControllers.forEach((TextEditingController t) => t.dispose());
    super.dispose();
  }

  Widget generateTextFields(BuildContext context) {
    List<Widget> textFields = List.generate(widget.fields, (int i) {
      return buildTextField(i, context, i == 0);
    });

    if (_pin.first != null) {
      FocusScope.of(context).requestFocus(_focusNodes[0]);
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: textFields);
  }

  void clearTextFields() {
    _textControllers.forEach(
            (TextEditingController tEditController) => tEditController.clear());
    _pin.clear();
  }

  Widget buildTextField(int i, BuildContext context, [bool autofocus = false]) {
    if (_focusNodes[i] == null) {
      _focusNodes[i] = FocusNode();
    }
    if (_textControllers[i] == null) {
      _textControllers[i] = TextEditingController();
      if (widget.lastPin != null) {
        _textControllers[i].text = widget.lastPin![i];
      }
    }

    _focusNodes[i].addListener(() {
      if (_focusNodes[i].hasFocus) {}
    });

    final String lastDigit = _textControllers[i].text;

    return Container(
      width: widget.fieldWidth,
      margin: const EdgeInsets.only(right: 17.0),
      child: TextField(
        controller: _textControllers[i],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        cursorColor: widget.cursorColor,
        maxLength: 1,
        autofocus: autofocus,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: widget.textColor,
            fontSize: widget.fontSize),
        focusNode: _focusNodes[i],
        obscureText: widget.isTextObscure,
        decoration: InputDecoration(
            counterText: "",
            enabledBorder:widget.showFieldAsBox
                ? OutlineInputBorder(borderSide: BorderSide(width: 1.0,color: widget.boxColor))
                : const UnderlineInputBorder() ,
            focusedBorder:widget.showFieldAsBox
                ? OutlineInputBorder(borderSide: BorderSide(width: 2.0,color: widget.boxColor))
                : const UnderlineInputBorder()) ,
        onChanged: (String str) {
          setState(() {
            _pin[i] = str;
          });
          if (i + 1 != widget.fields) {
            _focusNodes[i].unfocus();
            if (lastDigit != null && _pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            } else {
              FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
            }
          } else {
            _focusNodes[i].unfocus();
            if (lastDigit != null && _pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            }
          }
          if (_pin.every((String digit) => digit != null && digit != '')) {
            widget.onSubmit(_pin.join());
          }
        },
        onSubmitted: (String str) {
          if (_pin.every((String digit) => digit != null && digit != '')) {
            widget.onSubmit(_pin.join());
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return textFields;
  }
}