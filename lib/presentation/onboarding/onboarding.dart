import 'package:course_clean_architecture_with_mvvm/presentation/resources/assets_manager.dart';
import 'package:course_clean_architecture_with_mvvm/presentation/resources/color_manager.dart';
import 'package:course_clean_architecture_with_mvvm/presentation/resources/strings_manager.dart';
import 'package:course_clean_architecture_with_mvvm/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = _getSliderData();

  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  List<SliderObject> _getSliderData() =>
      [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onboardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubTitle4, ImageAssets.onboardingLogo4)
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
          controller: _pageController,
          itemCount: _list.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (contex, index) {
            //return  OnBoardingPage
            return OnBoardingPage(_list[index]);
          }),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    debugPrint("Skip button clicked!");

                  },
                  child:  Text(
                    AppStrings.skip,
                    style: Theme.of(context).textTheme.subtitle2 ,
                    textAlign: TextAlign.end,
                  )),
            ),
            //Add Layout for indicator and arrows
            _getBottomSheetWidget()

          ],
        ),
      ),
    );
  }


  Widget _getBottomSheetWidget() {
    return Container(
      color: ColorManager.primary,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        //Left Arrow
        Padding(padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(height: AppSize.s20, width: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.leftArrowIC),), onTap: () {
            //Go to previous screen/slide

            debugPrint("Left arrow clicked!");
            _pageController.animateToPage(_getPreviousIndex(), duration: const Duration(milliseconds: DurationConstant.d300), curve: Curves.bounceInOut);
          },

          ),

        ),

        //Circles indicator
        Row(children: [
          for( int i = 0; i < _list.length; i++)
            Padding(padding: const EdgeInsets.all(AppPadding.p8),
              child: _getProperCircle(i),)
        ],),


        //Right Arrow
        Padding(padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(height: AppSize.s20, width: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.rightArrowIC),), onTap: () {
            //Go to next screen/slide

            _pageController.animateToPage(_getNextIndex(), duration: const Duration(milliseconds: DurationConstant.d300), curve: Curves.bounceInOut);

          },

          ),

        ),

      ],),
    );
  }

  int _getPreviousIndex(){
    int previousIndex = _currentIndex--;
    if(previousIndex == -1){
      _currentIndex = _list.length - 1; // infinite loop to go to the first slider
    }
    return _currentIndex;
  }

  int _getNextIndex(){
    int nextIndex = _currentIndex++;
    if(nextIndex >= _list.length){
      _currentIndex = 0; // infinite loop to go to the length of slider list
    }
    return _currentIndex;
  }

  Widget _getProperCircle(int index)
  {
    if(index == _currentIndex){
return SvgPicture.asset(ImageAssets.hollowCirlceIc); // Selected slider
    }else{
      return SvgPicture.asset(ImageAssets.solidCircleIc); // Unselected slider
    }
  }

}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnBoardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),


        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme
                .of(context)
                .textTheme
                .headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme
                .of(context)
                .textTheme
                .subtitle1,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),

        //Image Widget
        SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
