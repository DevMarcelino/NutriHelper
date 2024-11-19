import 'package:flutter/material.dart';
import 'package:nutrihelper/Doctor%20Appoinment%20App/Model/doctor.dart';
import 'package:nutrihelper/Doctor%20Appoinment%20App/Model/symptom.dart';
import 'package:nutrihelper/Doctor%20Appoinment%20App/View/Widgets/list_of_doctor.dart';
import 'package:nutrihelper/Doctor%20Appoinment%20App/View/doctor_detail_screen.dart';
import 'package:nutrihelper/Doctor%20Appoinment%20App/const.dart';

class DoctorAppoinmentHomeScreen extends StatefulWidget {
  const DoctorAppoinmentHomeScreen({super.key});

  @override
  State<DoctorAppoinmentHomeScreen> createState() =>
      _DoctorAppoinmentHomeScreenState();
}

class _DoctorAppoinmentHomeScreenState
    extends State<DoctorAppoinmentHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerParts(),
          const SizedBox(height: 20),
          clinicAndHomeVisit(),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Qual seu Foco?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: -.5,
                color: black,
              ),
            ),
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                ...List.generate(
                  symptoms.length,
                  (index) => Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(left: 15, right: 15)
                        : const EdgeInsets.only(right: 15),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 15),
                      decoration: BoxDecoration(
                        color: grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundImage: AssetImage(
                              symptoms[index].image,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            symptoms[index].label,
                            style: const TextStyle(
                              fontSize: 16,
                              color: black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 35),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Dietas Populares",
              style: TextStyle(
                fontSize: 22,
                color: black,
                letterSpacing: -.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(15),
              child: Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  ...List.generate(
                    doctors.length,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DoctorDetailScreen(
                              doctor: doctors[index],
                            ),
                          ),
                        );
                      },
                      child: ListOfDoctor(
                        doctor: doctors[index],
                      ),
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

  Padding clinicAndHomeVisit() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: purple.withOpacity(0.2),
                    blurRadius: 15,
                    spreadRadius: 5,
                    offset: const Offset(-0, 10),
                  ),
                ],
                color: purple,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.add_circle,
                    size: 60,
                    color: Colors.white,
                  ),
                  SizedBox(height: 80),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dieta Nova",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1,
                        ),
                      ),
                      Text(
                        "Crie uma Nova Dieta",
                        style: TextStyle(
                          color: Color.fromARGB(228, 255, 255, 255),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.2),
                    blurRadius: 10,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: purple.withOpacity(0.15),
                        shape: BoxShape.circle),
                    padding: const EdgeInsets.all(12),
                    child: const Icon(
                      Icons.home_filled,
                      size: 30,
                      color: purple,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Procure Dietas Populares",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1,
                        ),
                      ),
                      Text(
                        "Encontre a Dieta ideal para voce",
                        style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding headerParts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                "Bem Vindo",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: black,
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(
                "assets/doctor-appoinment/hand.png",
                height: 40,
                width: 40,
              ),
            ],
          ),

        ],
      ),
    );
  }
}
