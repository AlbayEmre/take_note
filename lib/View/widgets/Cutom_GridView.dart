part of "../home_View.dart";

class _CustomGridView extends StatefulWidget {
  const _CustomGridView({
    super.key,
  });

  @override
  State<_CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<_CustomGridView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemCount: context.watch<DatabaseService>().taskObjectList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onLongPress: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.lightBlue[50],
                      title: Text(
                        "Bu Notu Silmek istiyormusun!",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: Text(
                            "Hayır",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<DatabaseService>(context, listen: false).deleteItems(index);
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: Text(
                            "Evet",
                            style: TextStyle(color: Theme.of(context).colorScheme.error),
                          ),
                        ),
                      ],
                    );
                  });
            },
            child: Card(
              child: ListTile(
                title: Text(
                  context.watch<DatabaseService>().taskObjectList[index].Title ?? "",
                  style: TextStyle(color: Colors.red),
                ),
                subtitle: Text(context.watch<DatabaseService>().taskObjectList[index].taskText ?? ""),
              ),
            ),
          );
        },
      ),
    );
  }
}
