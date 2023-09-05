part of '../home_screen.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.read<HomeViewModel>();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Center(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for(int i = 0; i < context
                        .watch<HomeViewModel>()
                        .colors
                        .length; i++)
                      ...[
                        GestureDetector(
                          onTap: () {
                            if (vm.colors[i] == Colors.red) {
                              if (vm.colorType == ColorsType.red) {
                                vm.colorType = ColorsType.none;
                              } else {
                                vm.colorType = ColorsType.red;
                              }
                            }
                            else if (vm.colors[i] == Colors.yellow) {
                              if (vm.colorType == ColorsType.yellow) {
                                vm.colorType = ColorsType.none;
                              } else {
                                vm.colorType = ColorsType.yellow;
                              }
                            }
                            else if (vm.colors[i] == Colors.green) {
                              if (vm.colorType == ColorsType.green) {
                                vm.colorType = ColorsType.none;
                              } else {
                                vm.colorType = ColorsType.green;
                              }
                            }
                          },
                          child: AnimatedContainer(
                              duration: Duration(milliseconds: (context
                                  .watch<HomeViewModel>()
                                  .animationValue * 1000).toInt()),
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: vm.colors[i],
                                  width: 2.0,
                                ),
                                color: (vm.colorType == ColorsType.green &&
                                    vm.colors[i] == Colors.green ||
                                    vm.colorType == ColorsType.red &&
                                        vm.colors[i] == Colors.red ||
                                    vm.colorType == ColorsType.yellow &&
                                        vm.colors[i] == Colors.yellow) ? context
                                    .watch<HomeViewModel>()
                                    .colors[i] : Colors.white,
                              ),
                              child: CustomPaint(
                                size: const Size(24, 24),
                                painter: CheckboxPainter(
                                  isChecked: (vm.colorType ==
                                      ColorsType.green &&
                                      vm.colors[i] == Colors.green ||
                                      vm.colorType == ColorsType.red &&
                                          vm.colors[i] == Colors.red ||
                                      vm.colorType == ColorsType.yellow &&
                                          vm.colors[i] == Colors.yellow),
                                  checkboxColor: (vm.colorType ==
                                      ColorsType.green &&
                                      vm.colors[i] == Colors.green ||
                                      vm.colorType == ColorsType.red &&
                                          vm.colors[i] == Colors.red ||
                                      vm.colorType == ColorsType.yellow &&
                                          vm.colors[i] == Colors.yellow)
                                      ? context
                                      .watch<HomeViewModel>()
                                      .colors[i]
                                      : Colors.white,
                                ),
                                child: (vm.colorType == ColorsType.green &&
                                    vm.colors[i] == Colors.green ||
                                    vm.colorType == ColorsType.red &&
                                        vm.colors[i] == Colors.red ||
                                    vm.colorType == ColorsType.yellow &&
                                        vm.colors[i] == Colors.yellow)
                                    ? const Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.white,
                                )
                                    : Container(),
                              )

                          ),
                        ),
                      ]
                  ],
                ),
              ),
              const SizedBox(height: 200,)
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: AnimationDurationWidget(
                      duration: '${(context.watch<HomeViewModel>().animationValue * 1000).toInt()}',
                      onChanged: (double value) {
                        vm.animationValue = value;
                      },
                      value: context.watch<HomeViewModel>().animationValue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                    onTap: () {
                      vm.count += 10;
                      vm.addColors();
                    },
                    title: 'Add checkboxes',
                    color: Colors.deepOrangeAccent
                ),
                const SizedBox(width: 10,),
                ButtonWidget(
                    onTap: () {
                      vm.count = 1;
                      vm.colors.clear();
                      vm.colorType = ColorsType.none;
                    },
                    title: 'Clear',
                    color: Colors.grey
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
