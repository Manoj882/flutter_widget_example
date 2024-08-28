import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({required this.listOfCharacter, super.key});

  final List<String> listOfCharacter;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: RefreshIndicator(
        onRefresh: () async {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('list of character: ${listOfCharacter.length}'),
            const SizedBox(
              height: 20,
            ),
            listOfCharacter.isEmpty
                ? Container(
                  height: MediaQuery.of(context).size.height / 2,
                    child: Center(
                      child: Text('No data found'),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: listOfCharacter.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        title: Text(listOfCharacter[index]),
                      );
                    },
                  ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Center(
                child: Text('Save'),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
