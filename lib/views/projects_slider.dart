import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/text_style.dart';

class ProjectsSlider extends StatefulWidget {
  ProjectsSlider({Key? key}) : super(key: key);

  @override
  State<ProjectsSlider> createState() => _ProjectsSliderState();
}

class _ProjectsSliderState extends State<ProjectsSlider> {
  late CarouselController _buttonCarouselController;

  @override
  void initState() {
    super.initState();
    _buttonCarouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        CarouselSlider(
          items: [
            ItemOfSlider(),
            ItemOfSlider(),
            ItemOfSlider(),
            ItemOfSlider()
          ],
          carouselController: _buttonCarouselController,
          options: CarouselOptions(
            height: size.height * 0.8,
            viewportFraction: 0.7,
            autoPlay: true,
            enlargeCenterPage: true,
          ),
        ),
        SizedBox(height: size.height * 0.05),
        // ElevatedButton(
        //   onPressed: () => _buttonCarouselController.nextPage(
        //     duration: const Duration(milliseconds: 300),
        //     curve: Curves.linear,
        //   ),
        //   child: const Text('→'),
        // ),
        // SizedBox(height: size.height * 0.05),
      ],
    );
  }
}

class ItemOfSlider extends StatelessWidget {
  ItemOfSlider({super.key});

  List<String> images = [
    "assets/images/my_photo.JPG",
  ];
  List<String> str = [
    "Hello World",
    "This is FlutterCampus",
    "Learn App Building.",
    "Flutter is the Best"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: Colors.blueGrey.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.only(right: 32.0, left: 32.0, top: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.7,
                width: size.width * 0.3,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0),
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        images[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        images[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        images[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Image.asset(
                        images[0],
                        fit: BoxFit.cover,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: size.width * 0.06,
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    Text(
                      "Flutter Developer",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize:
                                ScaleSize.textScaler(context, baseFontSize: 16),
                          ),
                      textAlign: TextAlign.center,
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.normal,
                                    fontSize: ScaleSize.textScaler(
                                      context,
                                      baseFontSize: 8,
                                    ),
                                  ),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: str.map((strone) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Row(children: [
                                    Text(
                                      "\u2022",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.normal,
                                            fontSize: ScaleSize.textScaler(
                                              context,
                                              baseFontSize: 8,
                                            ),
                                          ),
                                    ), //bullet text
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        strone,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.normal,
                                              fontSize: ScaleSize.textScaler(
                                                context,
                                                baseFontSize: 8,
                                              ),
                                            ),
                                      ), //text
                                    )
                                  ]),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
