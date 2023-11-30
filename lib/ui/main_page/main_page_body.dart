import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/providers/ui_settings_provider.dart';
import 'package:flutter_mekanikku/ui/widgets/ads_widget.dart';
import 'package:flutter_mekanikku/ui/widgets/carousel.dart';
import 'package:flutter_mekanikku/ui/widgets/mechanic_list.dart';
import 'package:provider/provider.dart';

class MainPageBody extends StatefulWidget {
  double offset;
  ScrollController scrollController;
  MainPageBody(
      {super.key, required this.offset, required this.scrollController});

  @override
  State<MainPageBody> createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
  @override
  Widget build(BuildContext context) {
    final provUi = Provider.of<UiSettingsProvider>(context);

    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5 + widget.offset,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  (provUi.dark_mode)
                      ? Theme.of(context).colorScheme.secondary
                      : Colors.white,
                  (provUi.dark_mode)
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.17),
                const CarouselWidget(),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    const Text(
                      "Our People",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    TextButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 0, 255, 251))),
                        onPressed: () {
                          provUi.person = 'b';
                        },
                        child: const Text(
                          'refresh people',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const MechanicListWidget(),
                const SizedBox(
                  height: 8,
                ),
                AdsBannerWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
