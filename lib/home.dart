import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_app/constants/size_config.dart';
import 'package:provider_todo_app/custom/my_dialogs.dart';
import 'package:provider_todo_app/custom/reuseables_Methods.dart';
import 'package:provider_todo_app/taskModel.dart';
import 'package:provider_todo_app/todoModel.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String getTime() {
    DateTime dateTime = DateTime.now();
    String dateTim = dateTime.toString();
    return myFormattedTimeOnly(dateTim);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(SizeConfig.screenHeight * 10),
        child: SafeArea(
          child: AppBar(
            title: Text(
              'Todo Application',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 2,
                  ),
                  Text(
                    // "10 : 30 PM",
                    getTime(),
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: SizeConfig.screenWidth * 10,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "current time",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.screenWidth * 6,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 3,
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.screenHeight * 2,
                      horizontal: SizeConfig.screenWidth * 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(SizeConfig.screenWidth * 12),
                        topRight: Radius.circular(SizeConfig.screenWidth * 12)),
                  ),
                  child: Consumer<TodoModel>(
                    builder: (context, todo, child) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: todo.taskList.length,
                          // itemCount: context.watch().taskList.length,
                          itemBuilder: (context, index) {
                            // return GestureDetector(
                            //   onTap: () {
                            //     TaskModel taskModel = TaskModel(
                            //         todo.taskList[index].title,
                            //         todo.taskList[index].detail);
                            //     Provider.of<TodoModel>(context, listen: false)
                            //         .removeFromList(taskModel);
                            //   },
                            //   child: Container(
                            //       child: ListTile(
                            //     title: Text(
                            //       // todo.taskList[index].title,
                            //       context
                            //           .watch<TodoModel>()
                            //           .taskList[index]
                            //           .title,
                            //       style: TextStyle(
                            //           color: Colors.black,
                            //           fontSize: SizeConfig.screenWidth * 6,
                            //           fontWeight: FontWeight.w500),
                            //     ),
                            //     subtitle: Text(
                            //       // todo.taskList[index].detail,
                            //       context
                            //           .watch<TodoModel>()
                            //           .taskList[index]
                            //           .detail,
                            //       style: TextStyle(
                            //         color: Colors.black54,
                            //         fontSize: SizeConfig.screenWidth * 4,
                            //       ),
                            //     ),
                            //     trailing: Icon(
                            //       Icons.check_circle,
                            //       color: Colors.greenAccent,
                            //     ),
                            //   )),
                            // );
                            return Dismissible(
                              direction: DismissDirection.endToStart,
                              key: Key(index.toString() +
                                  todo.taskList[index].title.toString() +
                                  todo.taskList[index].detail.toString()),
                              background: Container(
                                  color: Colors.red,
                                  padding: EdgeInsets.only(
                                      right: SizeConfig.screenWidth * 3),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    widthFactor: 3,
                                    child: AutoSizeText(
                                      'Delete',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: SizeConfig.screenWidth * 4,
                                      ),
                                    ),
                                  )),
                              onDismissed: (a) {
                                TaskModel taskModel = TaskModel(
                                    todo.taskList[index].title,
                                    todo.taskList[index].detail);
                                context
                                    .read<TodoModel>()
                                    .removeFromList(taskModel);
                                Fluttertoast.showToast(msg: 'Item Removed');
                              },
                              child: Container(
                                  child: ListTile(
                                title: Text(
                                  // todo.taskList[index].title,
                                  context
                                      .watch<TodoModel>()
                                      .taskList[index]
                                      .title,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: SizeConfig.screenWidth * 6,
                                      fontWeight: FontWeight.w500),
                                ),
                                subtitle: Text(
                                  // todo.taskList[index].detail,
                                  context
                                      .watch<TodoModel>()
                                      .taskList[index]
                                      .detail,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: SizeConfig.screenWidth * 4,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.check_circle,
                                  color: Colors.greenAccent,
                                ),
                              )),
                            );
                          });
                    },
                  )))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Provider.of<TodoModel>(context, listen: false).addTaskInList();
          showDialog(
              barrierDismissible: false,
              useSafeArea: true,
              context: context,
              builder: (BuildContext context) {
                return AddNewTaskDialog();
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
