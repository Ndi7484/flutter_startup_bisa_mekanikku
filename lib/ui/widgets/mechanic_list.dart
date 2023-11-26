import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/providers/ui_settings_provider.dart';
import 'package:flutter_mekanikku/ui/widgets/mechanic_card.dart';
import 'package:provider/provider.dart';

class MechanicListWidget extends StatelessWidget {
  const MechanicListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provUi = Provider.of<UiSettingsProvider>(context);

    return FutureBuilder(
      future: provUi.getPerson(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data != null) {
          return Column(
            children: List.generate(
                snapshot.data.length,
                (index) => MechanicCard(
                      result: snapshot.data[index],
                    )),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
