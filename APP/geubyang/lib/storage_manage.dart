import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StorageManage extends StatefulWidget {
  const StorageManage({Key? key}) : super(key: key);

  @override
  State<StorageManage> createState() => _StorageManageState();
}

class _StorageManageState extends State<StorageManage> {
  List<Item> items = [];

  @override
  void initState() {
    items = [];
    super.initState();
  }

  Widget listViewItem(Item i) {
    return Card(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        ListTile(
          leading: const Icon(Icons.album),
          title: Text(i.name),
          subtitle: Column(children: [
            Text('개수: ${i.quantity}'),
            Text('제조일자:' + DateFormat('yyyy-MM-dd').format(i.productionDate)),
            Text('유통기한:' + DateFormat('yyyy-MM-dd').format(i.expirationDate)),
          ]),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          TextButton(
            child: const Text('불출'),
            onPressed: () {/* ... */},
          ),
        ]),
      ]),
    );
  }

  String name = 'name';
  final nameController = TextEditingController();
  final qController = TextEditingController();
  DateTime pDate = DateTime.now();
  DateTime eDate = DateTime.now();
  int quantity = 42;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('창고'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) {
          return listViewItem(items[i]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('물품 추가'),
                  actions: [
                    TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '물품',
                        )),
                    TextButton(
                      onPressed: () async {
                        pDate = (await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.utc(2015, 01, 01),
                          lastDate: DateTime.utc(2025, 12, 31),
                        ))!;
                      },
                      child: Text('제조일자:' +
                          DateFormat('yyyy-MM-dd').format(pDate)),
                    ),
                    TextButton(
                      onPressed: () async {
                        eDate = (await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.utc(2015, 01, 01),
                          lastDate: DateTime.utc(2025, 12, 31),
                        ))!;
                        setState(() {
                          
                        });
                      },
                      child: Text('유통기한:' +
                          DateFormat('yyyy-MM-dd').format(eDate)),
                    ),
                    TextField(
                        controller: qController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '개수',
                        )),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _addItem(
                            nameController.text,
                            pDate,
                            eDate,
                            int.parse(qController.text),
                          );
                        });
                      },
                      child: const Text('추가'),
                    ),
                  ],
                );
              });
          setState(() {});
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _addItem(String name, DateTime pDate, DateTime eDate, int quantity) {
    items.add((Item(
        name: name,
        productionDate: pDate,
        expirationDate: eDate,
        quantity: quantity)));
  }
}

Future<DateTime?> showDatePicker({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
  DateTime? currentDate,
  DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
  SelectableDayPredicate? selectableDayPredicate,
  String? helpText,
  String? cancelText,
  String? confirmText,
  Locale? locale,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  TextDirection? textDirection,
  TransitionBuilder? builder,
  DatePickerMode initialDatePickerMode = DatePickerMode.day,
  String? errorFormatText,
  String? errorInvalidText,
  String? fieldHintText,
  String? fieldLabelText,
}) async {
  // assert(context != null);
  // assert(initialDate != null);
  // assert(firstDate != null);
  // assert(lastDate != null);
  initialDate = DateUtils.dateOnly(initialDate);
  firstDate = DateUtils.dateOnly(firstDate);
  lastDate = DateUtils.dateOnly(lastDate);
  // assert(
  //   !lastDate.isBefore(firstDate),
  //   'lastDate $lastDate must be on or after firstDate $firstDate.',
  // );
  // assert(
  //   !initialDate.isBefore(firstDate),
  //   'initialDate $initialDate must be on or after firstDate $firstDate.',
  // );
  // assert(
  //   !initialDate.isAfter(lastDate),
  //   'initialDate $initialDate must be on or before lastDate $lastDate.',
  // );
  // assert(
  //   selectableDayPredicate == null || selectableDayPredicate(initialDate),
  //   'Provided initialDate $initialDate must satisfy provided selectableDayPredicate.',
  // );
  // assert(initialEntryMode != null);
  // assert(useRootNavigator != null);
  // assert(initialDatePickerMode != null);
  // assert(debugCheckHasMaterialLocalizations(context));

  Widget dialog = DatePickerDialog(
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
    currentDate: currentDate,
    initialEntryMode: initialEntryMode,
    selectableDayPredicate: selectableDayPredicate,
    helpText: helpText,
    cancelText: cancelText,
    confirmText: confirmText,
    initialCalendarMode: initialDatePickerMode,
    errorFormatText: errorFormatText,
    errorInvalidText: errorInvalidText,
    fieldHintText: fieldHintText,
    fieldLabelText: fieldLabelText,
  );

  // if (textDirection != null) {
  //   dialog = Directionality(
  //     textDirection: textDirection,
  //     child: dialog,
  //   );
  // }

  if (locale != null) {
    dialog = Localizations.override(
      context: context,
      locale: locale,
      child: dialog,
    );
  }

  return showDialog<DateTime>(
    context: context,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    builder: (BuildContext context) {
      return builder == null ? dialog : builder(context, dialog);
    },
  );
}

class Item {
  final String name;
  final DateTime productionDate;
  final DateTime expirationDate;
  final int quantity;

  Item({
    required this.name,
    required this.productionDate,
    required this.expirationDate,
    required this.quantity,
  });

  // Item sampleItem() {
  //   return Item(
  //       name: 'name',
  //       productionDate: DateTime.now(),
  //       expirationDate: DateTime.now(),
  //       quantity: 42);
  // }
}
