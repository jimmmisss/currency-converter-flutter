import 'package:currency_converter/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final TextEditingController controller;
  final CurrencyModel selectedItem;
  final void Function(CurrencyModel model) onChanged;

  const CurrencyBox(
      {Key key, this.items, this.controller, this.onChanged, this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: SizedBox(
                height: 56,
                child: DropdownButton<CurrencyModel>(
                    value: selectedItem,
                    iconEnabledColor: Colors.amber,
                    isExpanded: true,
                    underline: Container(
                      height: 1,
                      color: Colors.amber,
                    ),
                    items: items
                        .map((e) =>
                            DropdownMenuItem(value: e, child: Text(e.name)))
                        .toList(),
                    onChanged: onChanged),
              )),
          SizedBox(width: 20),
          Expanded(
              flex: 2,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
