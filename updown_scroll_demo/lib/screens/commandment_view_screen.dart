import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:updown_scroll_demo/constants/export.dart';
import 'package:updown_scroll_demo/model/commandment_response_model.dart';

class CommandmentViewScreen extends StatefulWidget {
  final int isIndex;
  final bool isFav;

  const CommandmentViewScreen(
      {Key? key, required this.isIndex, this.isFav = false})
      : super(key: key);

  @override
  State<CommandmentViewScreen> createState() => _CommandmentViewScreenState();
}

class _CommandmentViewScreenState extends State<CommandmentViewScreen> {
  List<CommandmentResponseModel> commandmentResponseModel =
      commandmentResponseModelFromJson(Strings.jsonVal2);

  @override
  Widget build(BuildContext context) {
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return SafeArea(
      child: Scaffold(
          body: Row(
        children: [
          Expanded(
            child: ListView.builder(
                /* controller: _scrollControllerOne,*/
                itemCount: commandmentResponseModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextView(
                          text: commandmentResponseModel[index].id.toString(),
                          textColor: AppColors.black,
                        ),
                        GestureDetector(
                          onTap: () {
                            print(
                                'clickedOnButton ${commandmentResponseModel[index].iskJVSelected}');
                            if (widget.isFav) {
                              setState(() {
                                widget.isIndex == 4
                                    ? commandmentResponseModel[index]
                                            .iskJVSelected =
                                        !commandmentResponseModel[index]
                                            .iskJVSelected
                                    : commandmentResponseModel[index]
                                            .isnKJVSelected =
                                        !commandmentResponseModel[index]
                                            .isnKJVSelected;
                              });
                            }
                            print(
                                'clickedOnButton1 ${commandmentResponseModel[index].iskJVSelected}');
                          },
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: widget.isIndex == 4
                                  ? commandmentResponseModel[index].kjv!.length
                                  : commandmentResponseModel[index]
                                      .nkjv!
                                      .length,
                              itemBuilder: (BuildContext context, int index2) {
                                return TextView(
                                  text: widget.isIndex == 4
                                      ? commandmentResponseModel[index]
                                          .kjv![index2]
                                      : commandmentResponseModel[index]
                                          .nkjv![index2],
                                  textColor: (widget.isIndex == 4 &&
                                          commandmentResponseModel[index]
                                              .iskJVSelected)
                                      ? Colors.red
                                      : (widget.isIndex == 5 &&
                                              commandmentResponseModel[index]
                                                  .isnKJVSelected)
                                          ? Colors.red
                                          : AppColors.black,
                                  maxLine: 1,
                                );
                              }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Amens',
                              textColor: AppColors.black,
                            ),
                            TextView(
                              text:
                                  commandmentResponseModel[index].id.toString(),
                              textColor: AppColors.gray,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Visibility(
            visible: isLandscape,
            child: Expanded(
              child: RotatedBox(
                quarterTurns: 2,
                child: ListView.builder(
                    /* controller: _scrollControllerTwo,*/
                    itemCount: commandmentResponseModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      var id;
                      if (kDebugMode) {
                        print('jsonData ${Strings.jsonVal}');
                        print('@@@ ${json.decode(Strings.jsonVal)}');
                      }
                      id = commandmentResponseModel[index].id;
                      print('id $id');
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextView(
                              text:
                                  commandmentResponseModel[index].id.toString(),
                              textColor: AppColors.black,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (widget.isFav) {
                                  setState(() {
                                    widget.isIndex == 4
                                        ? commandmentResponseModel[index]
                                                .iskJVSelected =
                                            !commandmentResponseModel[index]
                                                .iskJVSelected
                                        : commandmentResponseModel[index]
                                                .isnKJVSelected =
                                            !commandmentResponseModel[index]
                                                .isnKJVSelected;
                                  });
                                }
                              },
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: widget.isIndex == 4
                                      ? commandmentResponseModel[index]
                                          .kjv!
                                          .length
                                      : commandmentResponseModel[index]
                                          .nkjv!
                                          .length,
                                  itemBuilder:
                                      (BuildContext context, int index2) {
                                    return TextView(
                                      text: widget.isIndex == 4
                                          ? commandmentResponseModel[index]
                                              .kjv![index2]
                                          : commandmentResponseModel[index]
                                              .nkjv![index2],
                                      textColor: (widget.isIndex == 4 &&
                                              commandmentResponseModel[index]
                                                  .iskJVSelected)
                                          ? Colors.red
                                          : (widget.isIndex == 5 &&
                                                  commandmentResponseModel[
                                                          index]
                                                      .isnKJVSelected)
                                              ? Colors.red
                                              : AppColors.black,
                                      maxLine: 4,
                                    );
                                  }),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  text: 'Amens',
                                  textColor: AppColors.black,
                                ),
                                TextView(
                                  text: commandmentResponseModel[index]
                                      .id
                                      .toString(),
                                  textColor: AppColors.gray,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
