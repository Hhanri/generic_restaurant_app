import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:generic_restaurant_app/models/section_model.dart';
import 'package:generic_restaurant_app/pages/section_page.dart';
import 'package:generic_restaurant_app/resources/theme.dart';
import 'package:page_transition/page_transition.dart';

class SectionCardWidget extends StatelessWidget {
  final SectionModel section;
  const SectionCardWidget({
    Key? key,
    required this.section
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final double _height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageTransition(
            child: SectionScreen(section: section),
            type: PageTransitionType.leftToRight,
          )
        );
      },
      child: Padding(
        padding:Design.padding,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: Design.circularRadius,
                image: DecorationImage(
                  image: AssetImage(
                    section.cover
                  ),
                  fit: BoxFit.cover
                ),
                boxShadow: [Design.shadow]
              ),
              height: _height/4,
            ),
            Container(
              height: _height/4,
              decoration: BoxDecoration(
                borderRadius: Design.circularRadius,
                gradient: Design.gradient
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: Design.padding,
                  child: Text(
                    section.sectionName,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
