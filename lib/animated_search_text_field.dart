import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedSearchTextFeild extends StatefulWidget {
  const AnimatedSearchTextFeild({super.key});

  @override
  State<AnimatedSearchTextFeild> createState() =>
      _AnimatedSearchTextFeildState();
}

class _AnimatedSearchTextFeildState extends State<AnimatedSearchTextFeild> {
  bool opened = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: opened ? MediaQuery.of(context).size.width * .9 : 56,
        height: 56,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white,
            boxShadow: kElevationToShadow[2]),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: opened
                      ? TextField(
                          onSubmitted: (value) {
                            setState(() {
                              opened = !opened;
                            });
                          },
                          style: const TextStyle(
                            color: Colors.blue,
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Colors.blue,
                            ),
                            border: InputBorder.none,
                          ),
                        )
                      : null,
                ),
              ),
            ),
            Material(
              type: MaterialType.transparency,
              child: opened
                  ? InkWell(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(32),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(32)),
                      onTap: () {
                        setState(() {
                          opened = !opened;
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Icon(
                          Icons.close,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                    )
                  : InkWell(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32)),
                      onTap: () {
                        setState(() {
                          opened = !opened;
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                    ),
            ),
          ],
        ));
  }
}
