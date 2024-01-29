import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PickupItemWidget extends StatelessWidget {
  final String township;
  final String date;
  final String phone;
  final num total;
  final String name;
  final String id;
  final int index;
  final int sumtotal;
  const PickupItemWidget({
    super.key,
    required this.township,
    required this.date,
    required this.phone,
    required this.total,
    required this.name,
    required this.id,
    required this.index,
    required this.sumtotal,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      color: const Color.fromRGBO(255, 255, 255, 1),
      elevation: 0.9,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            columnLayout(
              alignment: CrossAxisAlignment.start,
              nameOne: id,
              nameTwo: name,
              first: true,
            ),
            columnLayout(
              alignment: CrossAxisAlignment.start,
              nameOne: township,
              nameTwo: phone,
            ),
            columnLayout(
                alignment: CrossAxisAlignment.end,
                nameOne: date,
                firstRowLast: true,
                nameTwo: total.toString(),
                checkLastContent: true,
                nameThree: "$index of $sumtotal"),
          ],
        ),
      ),
    );
  }

  Widget columnLayout({
    required CrossAxisAlignment alignment,
    required String nameOne,
    required String nameTwo,
    String? nameThree,
    bool checkLastContent = false,
    bool first = false,
    bool firstRowLast = false,
  }) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
            firstRowLast
                ? DateFormat("yyyy/MM/dd").format(DateTime.parse(nameOne))
                : nameOne,
            style: first
                ? const TextStyle(color: Color(0xff749FCE))
                : const TextStyle()),
        const SizedBox(
          height: 5,
        ),
        Text(
          checkLastContent ? "$nameTwo ways" : nameTwo,
        ),
        const SizedBox(
          height: 5,
        ),
        checkLastContent ? Text(nameThree ?? "") : const SizedBox()
      ],
    );
  }
}
