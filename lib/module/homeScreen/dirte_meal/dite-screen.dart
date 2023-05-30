import 'package:flutter/material.dart';
import 'package:life_partner/model/meal.dart';
import 'package:life_partner/module/authScreen/sign_cubit/cubit.dart';

class DiteScreen extends StatefulWidget {
  const DiteScreen({super.key});

  @override
  State<DiteScreen> createState() => _DiteScreenState();
}

class _DiteScreenState extends State<DiteScreen> {
  @override
  Widget build(BuildContext context) {
    final sizee = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: sizee.width,
          height: sizee.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TopImage(
                  sizee: sizee,
                  image: diteModel["image"] as String,
                ),
                MiddlePart(
                    sizee: sizee,
                    duration: double.parse(SignCubit.get(context)
                            .dayMeal
                            ?.meals![SignCubit.get(context).choosedMeals ?? 0]
                            .readyInMinutes
                            .toString() ??
                        '0'),
                    cal: double.parse(SignCubit.get(context)
                            .mail
                            ?.readyInMinutes
                            .toString() ??
                        '0'),
                    name:
                        "${SignCubit.get(context).dayMeal?.meals![SignCubit.get(context).choosedMeals ?? 0].title}"),
                BottomPart(
                  sizee: sizee,
                  ingr: SignCubit.get(context)?.mail?.extendedIngredients ?? [],
                  details: diteModel["details"],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomPart extends StatelessWidget {
  const BottomPart({
    super.key,
    required this.sizee,
    required this.ingr,
    required this.details,
  });

  final Size sizee;

  final List<ExtendedIngredients> ingr;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      width: sizee.width,
      constraints: BoxConstraints(
          minHeight: sizee.height - (sizee.height * .08 + sizee.width * .75)),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 226, 230, 232),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60), topRight: Radius.circular(60)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: const Text(
              "Ingradients",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            width: sizee.width,
            height: 150,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  width: sizee.width * .22 - 5,
                  child: Column(children: [
                    Container(
                        width: sizee.width * .22 - 5,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: SizedBox()),
                    Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Text(
                          ingr[index].name ?? '',
                          style: TextStyle(fontSize: 18),
                        )),
                    Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Text(
                          ingr[index].amount.toString() ?? '',
                          style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 135, 134, 134)),
                        ))
                  ]),
                );
              },
              itemCount: ingr.length,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: const Text(
              "Details",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              SignCubit.get(context)
                      .mail
                      ?.instructions
                      ?.replaceAll('<ol>', '')
                      .replaceAll('<li>', '')
                      .replaceAll('</', '')
                      .replaceAll('li>', '')
                      .replaceAll('ol>', '') ??
                  '',
              style: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 135, 134, 134)),
            ),
          ),
          Card(
              elevation: 12,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Image.network(SignCubit.get(context).mail?.image ?? ''))
        ],
      ),
    );
  }
}

class MiddlePart extends StatelessWidget {
  const MiddlePart({
    super.key,
    required this.sizee,
    required this.name,
    required this.duration,
    required this.cal,
  });
  final String name;
  final double duration;
  final double cal;

  final Size sizee;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizee.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  children: [
                    const Icon(
                      Icons.watch_rounded,
                      color: Color.fromARGB(255, 174, 159, 159),
                    ),
                    Text(
                      "$duration Min ",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 174, 159, 159)),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  children: [
                    const Icon(
                      Icons.flash_on,
                      color: Color.fromARGB(255, 174, 159, 159),
                    ),
                    Text(
                      "$cal Cal ",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 174, 159, 159)),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class TopImage extends StatelessWidget {
  const TopImage({
    super.key,
    required this.sizee,
    required this.image,
  });
  final String image;

  final Size sizee;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizee.height * .08 + sizee.width * .75 - 10,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -sizee.height * .33,
            child: Transform.scale(
              scale: 1.2,
              child: Opacity(
                  opacity: .6,
                  child: Image.asset(
                    image,
                  )),
            ),
          ),
          Positioned(
            top: sizee.height * .08,
            child: Container(
              width: sizee.width * .75,
              child: Image.asset(
                image,
                fit: BoxFit.fitWidth,
              ),
            ),
          )
        ],
      ),
    );
  }
}

final Map<String, dynamic> diteModel = {
  "id": "ljkflaskdj",
  "name": "Lunch",
  "image": "assets/dite/balanced-diet.png",
  "duration": 35.0,
  "cal": 1200.0,
  "ingredients": [
    {
      "id": "ffffff",
      "name": "Tomato",
      "quntity": "200 gr",
      "image": "assets/dite/tomato.png",
    },
    {
      "id": "fffffdf",
      "name": "Noodle",
      "quntity": "350 gr",
      "image": "assets/dite/noodles.png"
    },
    {
      "id": "ffffffdd",
      "name": "fish Cake",
      "quntity": "2 Slices",
      "image": "assets/dite/fish-cake.png"
    },
    {
      "id": "fffdsfffff",
      "name": "Garlic",
      "quntity": "3 Slices",
      "image": "assets/dite/garlic.png"
    },
  ],
  "details":
      "Sit duis mollit nostrud veniam adipisicing. Magna non aute non adipisicing id dolor est. Ea fugiat esse aliqua consectetur dolor labore dolor occaecat excepteur."
};
