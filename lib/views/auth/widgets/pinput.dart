import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';


class PinPutWidget extends StatefulWidget {
  final void Function(String)? onCompleted;
  final String? Function(String?)? validator;
  final TextEditingController pinCodeController;
  const PinPutWidget({
    super.key,
    required this.onCompleted,
    required this.validator,
    required this.pinCodeController,
  });

  @override
  State<PinPutWidget> createState() => _PinputExampleState();
}

class _PinputExampleState extends State<PinPutWidget> {
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  void _handleCompleted(String pin) {
    if (widget.onCompleted != null) {
      widget.onCompleted!(pin);
    }
  }

  String? _validatePin(String? value) {
    return widget.validator!(value);
  }

  @override
  void dispose() {
    widget.pinCodeController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 80,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.grey,
      ),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            width: 2,
            color: Colors.grey ?? Colors.white
            
            ),
      ),
    );

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              preFilledWidget: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    width: 10,
                    height: 1,
                    color: Colors.grey,
                  ),
                ],
              ),
              controller: widget.pinCodeController,
              focusNode: focusNode,
              // androidSmsAutofillMethod:
              //     AndroidSmsAutofillMethod.smsUserConsentApi,
              // listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 16),
              validator: _validatePin,
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: _handleCompleted,
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    width: 10,
                    height: 1,
                    color: Colors.deepPurple,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.deepPurple??
                         Colors.deepPurple,
                  ),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 2,
                        color: Colors.deepPurple   ??
                            Colors.deepPurple)),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(
                  color: Colors.red ?? Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
