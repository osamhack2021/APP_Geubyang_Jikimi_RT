import 'package:flutter/material.dart';

class StorageManage extends StatelessWidget {
  const StorageManage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('창고'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.album),
                    title: Text('포카리스웨트'),
                    subtitle:
                        Text('개수'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('불출'),
                        onPressed: () {/* ... */},
                      ),
                      // const SizedBox(width: 8),
                      // TextButton(
                      //   child: const Text('LISTEN'),
                      //   onPressed: () {/* ... */},
                      // ),
                      // const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
