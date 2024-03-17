import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/view_model/responsive.dart';
import 'package:flutter_web_portfolio/views/projects_slider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/text_style.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Responsive(
        desktop: _buildUI(
          size: MediaQuery.of(context).size,
          color: Colors.red,
          text: 'Desktop View',
          fontSize: 24,
          context: context, // Pass the context here
        ),
        largeMobile: null, // You can set this to null if not applicable
        mobile: _buildUI(
          size: MediaQuery.of(context).size,
          color: Colors.green,
          text: 'Mobile View',
          fontSize: 16,
          context: context, // Pass the context here
        ),
        tablet: _buildUI(
          size: MediaQuery.of(context).size,
          color: Colors.blue,
          text: 'Tablet View',
          fontSize: 20,
          context: context, // Pass the context here
        ),
      ),
    );
  }

  Widget _buildUI({
    required Size size,
    required Color color,
    required String text,
    required double fontSize,
    required BuildContext context, // Pass the context here
  }) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(16.sp),
                child: Container(
                  width: double.infinity,
                  height: size.height * 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/images/background.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcATop,
                    // Use this blend mode to apply gradient to the text
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.white,
                          Colors.black
                        ], // Define your gradient colors here
                      ).createShader(bounds);
                    },
                    child: Text(
                      "Anish Chaulagain",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize:
                                ScaleSize.textScaler(context, baseFontSize: 24),
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ShaderMask(
                    blendMode: BlendMode.srcATop,
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [Colors.white, Colors.white, Colors.black],
                      ).createShader(bounds);
                    },
                    child: Text(
                      "Flutter Developer",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize:
                                ScaleSize.textScaler(context, baseFontSize: 16),
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(
                      Icons.facebook,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                    SizedBox(width: size.width * 0.01),
                    Icon(
                      Icons.facebook,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                    SizedBox(width: size.width * 0.01),
                    Icon(
                      Icons.facebook,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                    SizedBox(width: size.width * 0.01),
                    Icon(
                      Icons.facebook,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                  ]),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    height: size.height * 0.54,
                    width: size.width * 0.25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.5),
                          // Adjust shadow color as needed
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // Adjust offset as needed
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/my_photo.JPG',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  ShaderMask(
                    blendMode: BlendMode.srcATop,
                    // Use this blend mode to apply gradient to the text
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.white,
                          Colors.white,
                          Colors.white,
                          Colors.white,
                          Colors.white,
                          Colors.black,
                          Colors.white,
                          Colors.white,
                          Colors.white,
                        ], // Define your gradient colors here
                      ).createShader(bounds);
                    },
                    child: Text(
                      "\"Passionate Flutter Developer dedicated to crafting exceptional mobile experiences through innovation and collaboration.\"",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize:
                                ScaleSize.textScaler(context, baseFontSize: 10),
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: size.height * 0.05),
          Text(
            "Projects",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: ScaleSize.textScaler(context, baseFontSize: 16),
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height * 0.05),
          ProjectsSlider(),
          Container(
            width: double.infinity,
            height: size.height * 0.4,
            color: color,
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: fontSize),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
