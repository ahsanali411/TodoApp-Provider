import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider_todo_app/constants/size_config.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String titleText;
  final bool needValidator;
  final maxLines;

  MyTextFormField(this.controller, this.titleText, this.needValidator,
      {this.maxLines});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextFormField(
      controller: controller,
      maxLines: maxLines == null ? 1 : maxLines,
      decoration: InputDecoration(
          labelText: titleText,
          // labelStyle: TextStyle(color: Colors.black54),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(SizeConfig.screenWidth * 2)))),
      validator: needValidator == true
          ? (text) {
              if (text == null || text.toString().trim().isEmpty) {
                return "Field is required";
              } else {
                return null;
              }
            }
          : null,
    );
  }
}

class MySpaceHeight extends StatelessWidget {
  final double sizeConfigValue;

  MySpaceHeight(this.sizeConfigValue);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight * sizeConfigValue,
    );
  }
}

class MySpaceWidth extends StatelessWidget {
  final double sizeConfigValue;

  MySpaceWidth(this.sizeConfigValue);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth * sizeConfigValue,
    );
  }
}

class MyCustomButton extends StatelessWidget {
  final String btnText;
  final Color btnBackgroundColor;
  final double? paddingHorizontalSizeConfigValue;
  final double? paddingVerticalSizeConfigValue;
  final VoidCallback? btnOnPressed;

  MyCustomButton(this.btnText, this.btnBackgroundColor,
      {this.paddingHorizontalSizeConfigValue,
      this.paddingVerticalSizeConfigValue,
      this.btnOnPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: btnOnPressed,
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(btnBackgroundColor),
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(
                  horizontal:
                      SizeConfig.screenWidth * paddingHorizontalSizeConfigValue,
                  vertical:
                      SizeConfig.screenHeight * paddingVerticalSizeConfigValue),
            )),
        child: AutoSizeText(
          btnText,
          style: TextStyle(
            color: Colors.white,
            fontSize: SizeConfig.screenWidth * 4,
          ),
          maxLines: 1,
        ));
  }
}

class MyRowContainer extends StatelessWidget {
  final List<Widget>? widgetsList;

  MyRowContainer({@required this.widgetsList});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 100,
      child: Row(
        children: widgetsList == null ? [] : widgetsList!,
      ),
    );
  }
}
