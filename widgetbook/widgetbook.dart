
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
        devices: [
          Device(
            name: 'Custom Device',
            resolution: Resolution.dimensions(
              nativeWidth: 430,
              nativeHeight: 920,
              scaleFactor: 1,
            ),
            type: DeviceType.tablet,
          ),
        ],
        categories: [
          WidgetbookCategory(name: "First Widget", widgets: [
            WidgetbookComponent(name: "Text Label", useCases: [
              WidgetbookUseCase(
                  name: "Default",
                  builder: (context) => const Text("data"))
            ])
          ]),
          WidgetbookCategory(name: "Task", widgets: [
            WidgetbookComponent(name: "Big Task", useCases: [
              WidgetbookUseCase(
                  name: "Default",
                  builder: (context) => const TaskWidget())
            ])
          ])
        ],
        themes: [
          WidgetbookTheme(name: "Light", data: ThemeData.light()),
          WidgetbookTheme(name: "Dark", data: ThemeData.dark()),
        ],
        appInfo: AppInfo(
          name: 'Widgetbook Example',
        ));
  }
}

class TaskWidget extends StatelessWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          )
      ),
      child: Column(
        children: [
          Container(
            height: 32,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                )
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text("Missed: May 15, 2022",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16,),
          Row(children: [
            IconButton(onPressed: () { },
                icon: const Icon(
                Icons.circle,
                color: Colors.amber,
                size: 24,)),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("This is one line text!",),
              const SizedBox(height: 16,),
              Row(
                children: [
                  ElevatedButton(onPressed: () { }, child: const Text("To My Day")),
                  const SizedBox(width: 32,),
                  const Text("To Planning")
                ],
              )
            ],)
          ],)
        ],
      ),
    );
  }
}
