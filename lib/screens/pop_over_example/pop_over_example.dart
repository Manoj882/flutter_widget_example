
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class PopOverWidgetExample extends StatelessWidget {
  const PopOverWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PopOver Widget Example'),),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 15,
              itemBuilder: (context, index){
                return ListTile(
              title: const Text('Manoj BK'),
              subtitle: const Text('Kapan, Kathmandu'),
              trailing: Builder(
                builder: (BuildContext  context) {
                  return IconButton(
                    onPressed: () => showPopover(
                      context: context,
                      bodyBuilder: (context) => MenuItems(
                        onItem1Pressed: (){
                          Navigator.of(context).pop();
                          debugPrint('I am ( Menu Item 1) pressed: $index');
                        },
                        onItem2Pressed: (){
                          Navigator.of(context).pop();
                          debugPrint('I am ( Menu Item 2) pressed: $index');
                        },
                        onItem3Pressed: (){
                          Navigator.of(context).pop();
                          debugPrint('I am ( Menu Item 3) pressed: $index');
                        },
                        ),
                      
                      width: 150,
                      //height: 100, 
                      backgroundColor: Colors.white,
                      barrierColor: Colors.transparent,
                      transitionDuration: const Duration(microseconds: 100)
                      ),
                    icon: const Icon(
                    Icons.more_vert_outlined),);
                }
              ),
            );
              }),
          ],
        ),
      ),
    );
  }
}


class MenuItems extends StatelessWidget {
  const MenuItems({
    required this.onItem1Pressed,
    required this.onItem2Pressed,
    required this.onItem3Pressed,
    super.key});

  final void Function()? onItem1Pressed;
  final void Function()? onItem2Pressed;
  final void Function()? onItem3Pressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5,),
        child: Column(
          children: [
            MenuItemContainer(labelText: 'Menu Item 1', onTap: onItem1Pressed,),
            MenuItemContainer(labelText: 'Menu Item 2', onTap: onItem2Pressed,),
            MenuItemContainer(labelText: 'Menu Item 3', onTap: onItem3Pressed,),
        
          ],
        ),
      ),
    );
  }
}

class MenuItemContainer extends StatelessWidget {
  const MenuItemContainer({
    required this.labelText,
    required this.onTap,
    super.key});

  final String labelText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        color: Colors.white,
        child: Text(labelText),
      ),
    );
  }
}


