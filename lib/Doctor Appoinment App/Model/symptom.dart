class Symptoms {
  final String image;
  final String label;

  Symptoms({
    required this.image,
    required this.label,
  });
}

List<Symptoms> symptoms = [
  Symptoms(
    image: 'assets/doctor-appoinment/temperature.png',
    label: 'Perder Peso',
  ),
  Symptoms(
    image: 'assets/doctor-appoinment/snuffle.png',
    label: 'Ganhar Peso',
  ),
  Symptoms(
    image: 'assets/doctor-appoinment/headache.png',
    label: 'Melhorar Alimentação',
  ),
  Symptoms(
    image: 'assets/doctor-appoinment/dizzy.png',
    label: 'Manter Peso',
  ),
];
