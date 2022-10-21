import 'package:updown_scroll_demo/constants/export.dart';
import 'package:updown_scroll_demo/model/we_say_we_pray_response_model.dart';

class DashboardScreen extends StatefulWidget {
  final int isIndex;
  final bool isFav;

  const DashboardScreen({
    Key? key,
    required this.isIndex,
    this.isFav = false,
  }) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<WeSayWePrayResponseModel> weSayWePrayResponseModel =
  weSayWePrayResponseModelFromJson(Strings.jsonVal);

  /* late ScrollController? _scrollControllerOne, _scrollControllerTwo;*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*comment on 13 oct   _scrollControllerOne = ScrollController();
    _scrollControllerTwo = ScrollController();

    _scrollControllerOne!.addListener(() {
      _scrollControllerTwo!.animateTo(_scrollControllerOne!.offset,
          duration: const Duration(milliseconds: 100), curve: Curves.linear);
    });*/
  }

/*  @override
  void dispose() {
    _scrollControllerOne!.dispose();
    _scrollControllerTwo!.dispose();
    super.dispose();
  }*/

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
                itemCount: weSayWePrayResponseModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextView(
                          text: weSayWePrayResponseModel[index].id.toString(),
                          textColor: AppColors.black,
                        ),
                        GestureDetector(
                          onTap: () {
                            print(
                                'clickedOnButton ${weSayWePrayResponseModel[index].isWeSaySelected}');
                            if (widget.isFav) {
                              setState(() {
                                widget.isIndex == 0
                                    ? weSayWePrayResponseModel[index]
                                            .isWeSaySelected =
                                        !weSayWePrayResponseModel[index]
                                            .isWeSaySelected
                                    : weSayWePrayResponseModel[index]
                                            .isWePraySelected =
                                        !weSayWePrayResponseModel[index]
                                            .isWePraySelected;
                              });
                            }
                            print(
                                'clickedOnButton1 ${weSayWePrayResponseModel[index].isWeSaySelected}');
                          },
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: widget.isIndex == 0
                                  ? weSayWePrayResponseModel[index]
                                      .weSay!
                                      .length
                                  : weSayWePrayResponseModel[index]
                                      .wePray!
                                      .length,
                              itemBuilder: (BuildContext context, int index2) {
                                return TextView(
                                  text: widget.isIndex == 0
                                      ? weSayWePrayResponseModel[index]
                                          .weSay![index2]
                                      : weSayWePrayResponseModel[index]
                                          .wePray![index2],
                                  textColor: (widget.isIndex == 0 &&
                                          weSayWePrayResponseModel[index]
                                              .isWeSaySelected)
                                      ? Colors.red
                                      : (widget.isIndex == 1 &&
                                              weSayWePrayResponseModel[index]
                                                  .isWePraySelected)
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
                              text: weSayWePrayResponseModel[index]
                                  .book
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
          Visibility(
            visible: isLandscape,
            child: Expanded(
              child: RotatedBox(
                quarterTurns: 2,
                child: ListView.builder(
                    /* controller: _scrollControllerTwo,*/
                    itemCount: weSayWePrayResponseModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextView(
                              text:
                                  weSayWePrayResponseModel[index].id.toString(),
                              textColor: AppColors.black,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (widget.isFav) {
                                  setState(() {
                                    widget.isIndex == 0
                                        ? weSayWePrayResponseModel[index]
                                                .isWeSaySelected =
                                            !weSayWePrayResponseModel[index]
                                                .isWeSaySelected
                                        : weSayWePrayResponseModel[index]
                                                .isWePraySelected =
                                            !weSayWePrayResponseModel[index]
                                                .isWePraySelected;
                                  });
                                }
                              },
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: widget.isIndex == 0
                                      ? weSayWePrayResponseModel[index]
                                          .weSay!
                                          .length
                                      : weSayWePrayResponseModel[index]
                                          .wePray!
                                          .length,
                                  itemBuilder:
                                      (BuildContext context, int index2) {
                                    return TextView(
                                      text: widget.isIndex == 0
                                          ? weSayWePrayResponseModel[index]
                                              .weSay![index2]
                                          : weSayWePrayResponseModel[index]
                                              .wePray![index2],
                                      textColor: (widget.isIndex == 0 &&
                                              weSayWePrayResponseModel[index]
                                                  .isWeSaySelected)
                                          ? Colors.red
                                          : (widget.isIndex == 1 &&
                                                  weSayWePrayResponseModel[
                                                          index]
                                                      .isWePraySelected)
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
                                  text: weSayWePrayResponseModel[index]
                                      .book
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
