import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:employee_forums_task/colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({Key? key, this.controller}) : super(key: key);

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(
                color: Colors.grey,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                filled: true,
                fillColor: searchColor,
                focusedBorder: getInputBorder(),
                enabledBorder: getInputBorder(),
                border: getInputBorder(),
                hintText: "Search Messages",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                ),
                prefixIcon: Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 8),
                  child: FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.grey,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 40,
                  minHeight: 40,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.sliders),
            color: isSelected,
          ),
        ],
      ),
    );
  }

  OutlineInputBorder getInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(24.0),
      borderSide: BorderSide.none,
    );
  }
}
