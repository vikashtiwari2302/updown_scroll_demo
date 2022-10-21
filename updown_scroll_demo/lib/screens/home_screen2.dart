import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:updown_scroll_demo/model/common_response_data_model.dart';

import '../constants/export.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CommonResponseDataModel> weSayWePrayResponseModel =
    commonResponseDataModelFromJson(Strings.jsonVal);
    return SafeArea(
      child: Scaffold(
          body: ListView.builder(
              itemCount: weSayWePrayResponseModel.length,
              itemBuilder: (BuildContext context, int index) {
                var id;
                if (kDebugMode) {
                  print('jsonData ${Strings.jsonVal}');
                  print('@@@ ${json.decode(Strings.jsonVal)}');
                }
                id = weSayWePrayResponseModel[index].id;
                print('id $id');
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
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                          weSayWePrayResponseModel[index].wePray!.length,
                          itemBuilder: (BuildContext context, int index2) {
                            return TextView(
                              text: weSayWePrayResponseModel[index]
                                  .wePray![index2],
                              textColor: AppColors.black,
                              maxLine: 4,
                            );
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: 'Amens',
                            textColor: AppColors.black,
                          ),
                          TextView(
                            text:
                            weSayWePrayResponseModel[index].book.toString(),
                            textColor: AppColors.gray,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}
