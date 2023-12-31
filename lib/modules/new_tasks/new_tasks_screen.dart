import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/task_item.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class NewTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).newTasks;
        return SafeArea(
          child: SingleChildScrollView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'New Task',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: tasks.length > 0
                        ? Text(
                            'New tasks',
                            style: TextStyle(
                              color: Colors.tealAccent,
                              fontSize: 13,
                              fontFamily: 'NotoSans',
                            ),
                          )
                        : null,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  tasks.length > 0
                      ? ListView.builder(
                          //scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            //print(index);
                            return TaskItem(
                              tasks: tasks[index],
                            );
                          },
                          // separatorBuilder: (context, index) => Padding(
                          //       padding: const EdgeInsets.only(left: 20),
                          //       child: Container(
                          //         width: double.infinity,
                          //         height: 1.0,
                          //         color: Colors.grey[200],
                          //       ),
                          //     ),
                          itemCount: tasks.length)
                      : Container(
                          child: Center(
                              child: Image.asset(
                          'images/background.png',
                          color: Colors.cyanAccent,
                          height: 350,
                          width: 350,
                        ))),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
