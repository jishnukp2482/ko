import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ko/domain/entities/dashboard/carousel_Modal.dart';
import 'package:ko/presentaion/manager/controller/dashboard_provider.dart';
import 'package:provider/provider.dart';

class CarouselMenu extends StatefulWidget {
  const CarouselMenu({super.key});

  @override
  State<CarouselMenu> createState() => _CarouselMenuState();
}

class _CarouselMenuState extends State<CarouselMenu> {
  @override
  Widget build(BuildContext context) {
    final carouselprovider = Provider.of<DashBoardproivder>(context);
    return CarouselSlider.builder(
        itemCount: carouselprovider.carouselitems.length,
        itemBuilder: (context, index, realIndex) {
          return CarouselItems(model: carouselprovider.carouselitems[index]);
        },
        options: CarouselOptions(
          aspectRatio: 16 / 9,
          autoPlay: true,
          enlargeCenterPage: false,
          height: MediaQuery.of(context).size.height * 0.20,
          autoPlayCurve: Curves.easeIn,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.9,
        ));
  }
}

class CarouselItems extends StatelessWidget {
  const CarouselItems({super.key, required this.model});
  final CarouselModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(model.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
