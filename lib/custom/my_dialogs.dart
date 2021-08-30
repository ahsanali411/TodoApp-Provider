import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_app/constants/size_config.dart';
import 'package:provider_todo_app/custom/customWidgets.dart';
import 'package:provider_todo_app/custom/reuseables_Methods.dart';
import 'package:provider_todo_app/custom/variables.dart';
import 'package:provider_todo_app/todoModel.dart';

class MyLoadingIndicatorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 3,
            vertical: SizeConfig.screenHeight * 1.5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
                Radius.circular(SizeConfig.screenWidth * 1.5))),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircularProgressIndicator(),
              MySpaceWidth(2),
              AutoSizeText(
                'Please wait...',
                style: TextStyle(
                    color: Colors.black, fontSize: SizeConfig.screenWidth * 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddNewTaskDialog extends StatefulWidget {
  @override
  _AddNewTaskDialogState createState() => _AddNewTaskDialogState();
}

class _AddNewTaskDialogState extends State<AddNewTaskDialog> {
  final TextEditingController taskTitleController = TextEditingController();

  final TextEditingController taskDetailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 3,
              vertical: SizeConfig.screenHeight * 2),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                  Radius.circular(SizeConfig.screenWidth * 2))),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AutoSizeText(
                    'Add new Task',
                    style: TextStyle(
                        color: MyVariables.headingTextBlueShadeColor,
                        fontSize: SizeConfig.screenWidth * 5,
                        fontWeight: FontWeight.w500),
                  ),
                  MySpaceHeight(4),
                  MyTextFormField(taskTitleController, 'Title', true),
                  MySpaceHeight(2),
                  MyTextFormField(
                    taskDetailController,
                    'Detail',
                    true,
                    maxLines: 2,
                  ),
                  MySpaceHeight(3),
                  MyRowContainer(widgetsList: [
                    Expanded(
                        child: MyCustomButton(
                      'Save',
                      Colors.green,
                      paddingHorizontalSizeConfigValue: 0,
                      paddingVerticalSizeConfigValue: 1.5,
                      btnOnPressed: () {
                        FocusScope.of(context).unfocus();
                        myShowLoadingIndication(context);
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            context.read<TodoModel>().addTaskInList(
                                taskTitleController.text.toString().trim(),
                                taskDetailController.text.toString().trim());
                            Navigator.pop(context, true);
                            Fluttertoast.showToast(msg: 'Added Successfully');
                            Navigator.pop(context, true);
                          });
                        } else {
                          Navigator.pop(context, false);
                          Fluttertoast.showToast(
                              msg: 'Please fill the Fields to add task');
                        }
                      },
                    )),
                    MySpaceWidth(3),
                    Expanded(
                        child: MyCustomButton(
                      'Close',
                      Colors.black,
                      paddingHorizontalSizeConfigValue: 0,
                      paddingVerticalSizeConfigValue: 1.5,
                      btnOnPressed: () {
                        FocusScope.of(context).unfocus();
                        Navigator.pop(context, false);
                      },
                    )),
                  ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
