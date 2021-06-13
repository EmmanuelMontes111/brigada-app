import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownbuttonWidget extends StatelessWidget {
  final String hint;
  final ValueChanged<int> onChanged;
  final List<String> items;

  // final List<Kit> itemsKit;
  // final List<RadioBrigada> itemsRadio;
  // final List<HeadPhones> itemsHeadPhones;
  final int selectedIndex;
  final String error;
  final TextStyle style;
  final String title;
  // List typeItems;

  DropdownbuttonWidget({
    @required this.onChanged,
    @required this.items,
    @required this.selectedIndex,
    this.hint,
    this.error,
    this.style,
    this.title,
  });


  // @override
  // void initState() {
  //   if (widget.itemsKit != null) {
  //     widget.typeItems = widget.itemsKit;
  //   } else if (widget.itemsRadio != null) {
  //     widget.typeItems = widget.itemsRadio;
  //   } else if (widget.itemsHeadPhones != null) {
  //     widget.typeItems = widget.itemsHeadPhones;
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return _createWidget(
      context,
      Border.all(color: Colors.grey),
      12.0,
      null,
          () {
        FocusScope.of(context).requestFocus(FocusNode());
        _showAlertDialog(context);
      },
    );
  }

  Widget _createWidget(BuildContext context, BoxBorder boxBorder,
      double padding, Color color, GestureTapCallback onTap) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 2.0, bottom: 2.0),
          child: Container(
            width: double.infinity,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: boxBorder,
              borderRadius: BorderRadius.circular(4.0),
              color: color,
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10.0, padding, 10.0, padding),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      selectedIndex < 0
                          ? hint ?? ''
                          : items[selectedIndex],
                      style: selectedIndex < 0
                          ? Theme.of(context)
                          .textTheme
                          .subtitle1
                          .apply(color: Color.fromRGBO(0, 0, 0, 0.65))
                          : Theme.of(context).textTheme.subtitle1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              color: Colors.black,
              letterSpacing: 0.15,
            ),
          ),
          content: _builtAlertDialogContent(),
        );
      },
    );
  }

  Widget _builtAlertDialogContent() {
    return Container(
      width: 300.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index],
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                )),
            onTap: () {
              Navigator.of(context).pop();
              onChanged(index);
            },
          );
        },
      ),
    );
  }
}
