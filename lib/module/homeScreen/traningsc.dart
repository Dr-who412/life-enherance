import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:life_partner/model/exr_model.dart';
import 'package:life_partner/module/exr_model/exr_screen.dart';

import 'cubit/homeCubit.dart';
import 'cubit/state.dart';

class Tranning2 extends StatelessWidget {
  const Tranning2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MeasuringWidget(12, 'WORKOUT'),
            MeasuringWidget(5, 'KCAL'),
            MeasuringWidget(30, 'MINUTE'),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Card(
          margin: EdgeInsets.symmetric(
            horizontal: 5,
          ),
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'WEEK GOAL',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Be Strong and Finish Your Exercises and Mainrain Your Diet Every Day ',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        // ElevatedButton(
                        //     onPressed: () {},
                        //     child: Text('SET A GOAL'),
                        //     style: ElevatedButton.styleFrom(
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(20),
                        //         ),
                        //         backgroundColor: Color(0xFF3E6864)))
                      ]),
                )
              ],
            ),
          ),
        ),
        BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return ConditionalBuilder(
              condition: !(state is GetEXRLoading) &&
                  HomeCubit.get(context).exrModel?.status == true,
              builder: (context) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                height: MediaQuery.of(context).size.height * 2 / 3,
                child: GridView.custom(
                  physics: BouncingScrollPhysics(),
                  semanticChildCount: 9,
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 4,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 8,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: [
                      QuiltedGridTile(2, 2),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 2),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    childCount: 10,
                    (context, index) => CategoryWidget2(
                      item: HomeCubit.get(context).exrModel?.exercise[index],
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ExrScreen(
                                    item: HomeCubit.get(context)
                                        .exrModel
                                        ?.exercise[index],
                                  ))),
                    ),
                  ),
                ),
              ),
              fallback: (BuildContext context) => state is GetEXRLoading ||
                      HomeCubit.get(context).exrModel == null
                  ? Container(
                      height: MediaQuery.of(context).size.height * 2 / 5,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator())
                  : Container(
                      height: MediaQuery.of(context).size.height * 2 / 5,
                      alignment: Alignment.center,
                      child: Text('Empty Exercise !'),
                    ),
            );
          },
        ),
      ],
    );
  }
}

class MeasuringWidget extends StatelessWidget {
  int counter;
  String label;
  MeasuringWidget(this.counter, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text('$counter'), Text(label)],
    );
  }
}

class CategoryWidget2 extends StatelessWidget {
  // String categoryName;
  // String imagePath;
  Exercise? item;
  Function onTap;
  CategoryWidget2({required this.item, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("zzzzzzzzzzzzzz");
        onTap();
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(children: [
          CachedNetworkImage(
            imageUrl: item?.thumbnail ?? '###',
            imageBuilder: (context, imageProvider) => Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white54,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white54.withOpacity(.4),
                  ),
                )),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Positioned(
              top: 10,
              left: 2,
              child: Row(
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  Card(
                    elevation: 12,
                    color: Colors.black26.withOpacity(.2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(item?.title ?? '##',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                ],
              )),
        ]),
      ),
    );
  }
}
