import 'package:flutter/material.dart';
import 'package:nutrihelper/Doctor%20Appoinment%20App/Model/schedule.dart';
import 'package:nutrihelper/Doctor%20Appoinment%20App/View/Widgets/schedule_items.dart';
import 'package:nutrihelper/Doctor%20Appoinment%20App/const.dart';


class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Dietas Atuais",
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TabBar(
                        indicatorColor: purple,
                        unselectedLabelColor: black.withOpacity(0.5),
                        labelStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        labelColor: Colors.white,
                        indicator: BoxDecoration(
                          color: purple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        tabs: [
                          ...List.generate(
                            tabs.length,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Tab(
                                text: tabs[index],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Refeição Mais Proxima",
                                style: TextStyle(
                                  color: black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -.4,
                                ),
                              ),
                              const SizedBox(height: 20),
                              ...List.generate(
                                nearest.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: ScheduleItems(schedule: nearest[index],),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Futuras Refeições",
                                style: TextStyle(
                                  color: black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -.4,
                                ),
                              ),
                              const SizedBox(height: 20),
                              ...List.generate(
                                futures.length,
                                (index) =>  Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: ScheduleItems(schedule: futures[index],),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Center(
                          child: Text(
                            "Completas",
                            style: TextStyle(
                              fontSize: 24,
                              color: purple,
                            ),
                          ),
                        ),
                         const Center(
                          child: Text(
                            "Concluidas",
                            style: TextStyle(
                              fontSize: 24,
                              color: purple,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
