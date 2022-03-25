import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:generic_restaurant_app/models/section_model.dart';
import 'package:generic_restaurant_app/pages/section_page.dart';
import 'package:generic_restaurant_app/providers/providers.dart';
import 'package:generic_restaurant_app/resources/theme.dart';
import 'package:page_transition/page_transition.dart';

class SectionCardWidget extends StatelessWidget {
  final SectionModel section;
  const SectionCardWidget({
    Key? key,
    required this.section,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final Design design = ref.watch(appSettingsProvider).design;
        final bool hasInternet = ref.watch(connectivityProvider);
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              PageTransition(
                child: SectionScreen(
                  section: section,
                  //design: design,
                ),
                type: PageTransitionType.leftToRight,
              )
            );
          },
          child: Padding(
            padding: design.padding,
            child: Stack(
              children: [
                hasInternet
                ? FutureBuilder(
                    future: ref.watch(firebaseProvider).downloadURL(section.cover),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        return ImageContainerDecoration(
                          design: design,
                          section: section,
                          height: _height/4,
                          imageProvider: CachedNetworkImageProvider(snapshot.data),
                        );
                      }
                      return LoadingSectionCardWidget(design: design, height: _height/4);
                    },
                  )
                : ImageContainerDecoration(
                    design: design,
                    section: section,
                    height: _height/4,
                    imageProvider: AssetImage(section.cover)
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
    );
  }
}

class ImageContainerDecoration extends StatelessWidget {
  final Design design;
  final SectionModel section;
  final double height;
  final ImageProvider imageProvider;
  const ImageContainerDecoration({
    Key? key,
    required this.design,
    required this.section,
    required this.height,
    required this.imageProvider
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: design.circularRadius,
        boxShadow: [design.shadow],
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover
        )
      ),
      height: height,
    );
  }
}
class LoadingSectionCardWidget extends StatelessWidget {
  final Design design;
  final double height;
  const LoadingSectionCardWidget({
    Key? key,
    required this.design,
    required this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: design.circularRadius,
        boxShadow: [design.shadow],
      ),
      height: height,
      child: const Center(child: CircularProgressIndicator.adaptive(),),
    );
  }
}
