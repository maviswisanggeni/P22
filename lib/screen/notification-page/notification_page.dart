import 'package:erigo/screen/detail-page/components/back_button.dart';
import 'package:erigo/screen/notification-page/models/notification_data.dart';
import 'package:erigo/utils/Constant.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Notifikasi',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: ListView.builder(
            itemCount: allNotif.length,
            itemBuilder: (context, index) {
              return InkWell(
                // if on tap change is read
                onTap: () {
                  setState(() {
                    //if is read is false change to true
                    if (allNotif[index].isRead == false) {
                      allNotif[index].isRead = true;
                    } else {
                      allNotif[index].isRead = false;
                    }
                  });
                },
                child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          // add background color yellow with opacity 0.08
                          decoration: BoxDecoration(
                            color: allNotif[index].isRead == false
                                ? Colors.yellow.withOpacity(0.08)
                                : Colors.grey.withOpacity(0.08),
                          ),
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                allNotif[index].title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1,
                              ),
                              Text(
                                allNotif[index].description,
                                style: TextStyle(
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          width: 10,
                          height: 100,
                          decoration: BoxDecoration(
                            color: allNotif[index].isRead == false
                                ? Colors.yellow.withOpacity(0.08)
                                : Colors.grey.withOpacity(0.08),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                color: allNotif[index].isRead == false
                                    ? Styles.secondaryColor
                                    : Colors.grey.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              );
            },
          ),
        ),
      ),
    );
  }
}
