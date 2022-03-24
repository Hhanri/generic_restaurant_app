import 'package:flutter/material.dart';
import 'package:generic_restaurant_app/models/section_model.dart';
import 'package:generic_restaurant_app/pages/section_page.dart';
import 'package:generic_restaurant_app/resources/theme.dart';
import 'package:page_transition/page_transition.dart';

class SectionCardWidget extends StatelessWidget {
  final SectionModel section;
  final Design design;
  const SectionCardWidget({
    Key? key,
    required this.section,
    required this.design
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final double _height = MediaQuery.of(context).size.height;
    print(section.sectionName);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageTransition(
            child: SectionScreen(
              section: section,
              design: design,
            ),
            type: PageTransitionType.leftToRight,
          )
        );
      },
      child: Padding(
        padding: design.padding,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: design.circularRadius,
                image: DecorationImage(
                  image: AssetImage(
                    section.cover
                  ),
                  fit: BoxFit.cover
                ),
                boxShadow: [design.shadow]
              ),
              height: _height/4,
            ),
            Container(
              height: _height/4,
              decoration: BoxDecoration(
                borderRadius: design.circularRadius,
                gradient: design.gradient
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: design.padding,
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
