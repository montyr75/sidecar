import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class DragStepper extends StatefulWidget {
  final Axis direction;

  final int initialValue;
  final bool withBackground;

  final Duration firstIncrementDuration;
  final Duration secondIncrementDuration;
  final int speedTransitionLimitCount;

  final ValueChanged<int> onChanged;

  final bool withSpring;
  final bool withPlusMinus;
  final bool withFastCount;
  final int maxValue;
  final int minValue;

  final TextStyle counterStyle;
  final Color dragButtonColor;
  final Color chevronColor;
  final Widget? backgroundWidget;

  const DragStepper({
    Key? key,
    required this.initialValue,
    required this.onChanged,
    this.withBackground = false,
    this.direction = Axis.horizontal,
    this.withSpring = true,
    this.counterStyle = const TextStyle(fontSize: 22),
    this.dragButtonColor = const Color(0xFF9874f8),
    this.chevronColor = Colors.white,
    this.withPlusMinus = false,
    this.firstIncrementDuration = const Duration(milliseconds: 250),
    this.secondIncrementDuration = const Duration(milliseconds: 100),
    this.speedTransitionLimitCount = 3,
    this.minValue = 0,
    this.maxValue = 100,
    this.withFastCount = false,
    this.backgroundWidget,
  }) : super(key: key);

  @override
  State<DragStepper> createState() => _DragStepperState();
}

class _DragStepperState extends State<DragStepper> with SingleTickerProviderStateMixin {
  static const threshold = 0.1923;

  late final AnimationController _controller;
  late Animation<Offset> _animation;
  late int _value;
  late double _startAnimationPosX;
  late double _startAnimationPosY;
  bool isTimerEnable = true;
  bool isReadyToFastAnim = true;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
    _controller = AnimationController(vsync: this, lowerBound: -0.5, upperBound: 0.5);
    _controller.value = 0.0;

    if (widget.direction == Axis.horizontal) {
      _animation = Tween<Offset>(begin: const Offset(0.0, 0.0), end: const Offset(1.5, 0.0)).animate(_controller);
    } else {
      _animation = Tween<Offset>(begin: const Offset(0.0, 0.0), end: const Offset(0.0, 1.5)).animate(_controller);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.direction == Axis.horizontal) {
      _animation = Tween<Offset>(begin: const Offset(0.0, 0.0), end: const Offset(1.5, 0.0)).animate(_controller);
    } else {
      _animation = Tween<Offset>(begin: const Offset(0.0, 0.0), end: const Offset(0.0, 1.5)).animate(_controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        width: widget.direction == Axis.horizontal ? 135.0 : 65.0,
        height: widget.direction == Axis.horizontal ? 65.0 : 135.0,
        child: Material(
          type: MaterialType.canvas,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(60.0),
          color: widget.withBackground == true ? Colors.white.withOpacity(0.2) : Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: widget.direction == Axis.horizontal ? 0.0 : null,
                  bottom: widget.direction == Axis.horizontal ? null : 0.0,
                  child: widget.direction == Axis.horizontal
                      ? IconButton(
                          visualDensity: VisualDensity.compact,
                          splashRadius: 15.0,
                          icon: Icon(!widget.withPlusMinus ? Icons.keyboard_arrow_left : Icons.remove,
                              color: widget.chevronColor),
                          onPressed: () {
                            _decrement(widget.direction == Axis.horizontal);
                          },
                        )
                      : IconButton(
                          visualDensity: VisualDensity.compact,
                          splashRadius: 15.0,
                          icon: Icon(!widget.withPlusMinus ? Icons.keyboard_arrow_down : Icons.remove,
                              color: widget.chevronColor),
                          onPressed: () {
                            _increment(widget.direction == Axis.horizontal);
                          },
                        ),
                ),
                Positioned(
                  right: widget.direction == Axis.horizontal ? 0.0 : null,
                  top: widget.direction == Axis.horizontal ? null : 0.0,
                  child: widget.direction == Axis.horizontal
                      ? IconButton(
                          visualDensity: VisualDensity.compact,
                          splashRadius: 15.0,
                          icon: Icon(!widget.withPlusMinus ? Icons.keyboard_arrow_right : Icons.add,
                              color: widget.chevronColor),
                          onPressed: () {
                            _increment(widget.direction == Axis.horizontal);
                          },
                        )
                      : IconButton(
                          visualDensity: VisualDensity.compact,
                          splashRadius: 15.0,
                          icon: Icon(!widget.withPlusMinus ? Icons.keyboard_arrow_up : Icons.add,
                              color: widget.chevronColor),
                          onPressed: () {
                            _decrement(widget.direction == Axis.horizontal);
                          },
                        ),
                ),
                GestureDetector(
                  onHorizontalDragStart: _onPanStart,
                  onHorizontalDragUpdate: _onPanUpdate,
                  onHorizontalDragEnd: _onPanEnd,
                  child: SlideTransition(
                    position: _animation,
                    child: Container(
                      width: 50,
                      decoration: BoxDecoration(
                        color: widget.dragButtonColor,
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Stack(
                        children: [
                          if (widget.backgroundWidget != null) widget.backgroundWidget!,
                          Center(
                            child: Text(
                              _value.toString(),
                              style: widget.counterStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double offsetFromGlobalPos(Offset globalPosition) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset local = box.globalToLocal(globalPosition);

    _startAnimationPosX = ((local.dx * 0.75) / box.size.width) - 0.4;
    _startAnimationPosY = ((local.dy * 0.75) / box.size.height) - 0.4;

    if (widget.direction == Axis.horizontal) {
      return ((local.dx * 0.75) / box.size.width) - 0.4;
    } else {
      return ((local.dy * 0.75) / box.size.height) - 0.4;
    }
  }

  void _onPanStart(DragStartDetails details) {
    _controller.stop();
    _controller.value = offsetFromGlobalPos(details.globalPosition);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    final value = offsetFromGlobalPos(details.globalPosition);

    isReadyToFastAnim = true;
    if (value <= -threshold) {
      _controller.value = _startAnimationPosX = _startAnimationPosY = -threshold;

      if (widget.withFastCount) {
        fastCount();
      }
    } else if (value >= threshold) {
      _controller.value = _startAnimationPosX = _startAnimationPosY = threshold;

      if (widget.withFastCount) {
        fastCount();
      }
    } else {
      isReadyToFastAnim = false;
      _controller.value = offsetFromGlobalPos(details.globalPosition);
    }
  }

  void fastCount() {
    if (isTimerEnable) {
      isTimerEnable = false;
      final isHor = widget.direction == Axis.horizontal;

      Timer(const Duration(milliseconds: 100), () {
        if (isReadyToFastAnim) {
          int velocitLimit = 0;
          Timer.periodic(widget.firstIncrementDuration, (timer) {
            if (!isReadyToFastAnim) {
              timer.cancel();
              isReadyToFastAnim = true;
            }
            if (velocitLimit > widget.speedTransitionLimitCount) {
              timer.cancel();
            }
            velocitLimit++;
            if (_controller.value <= -threshold) {
              _decrement(isHor);
            } else if (_controller.value >= threshold) {
              _increment(isHor);
            }
          });

          Timer.periodic(widget.secondIncrementDuration, (timer) {
            if (!isReadyToFastAnim) {
              timer.cancel();
              isReadyToFastAnim = true;
            }
            if (velocitLimit > widget.speedTransitionLimitCount) {
              if (_controller.value <= -threshold) {
                _decrement(isHor);
              } else if (_controller.value >= threshold) {
                _increment(isHor);
              }
            }
          });
        }
      });
    }
  }

  void _increment(bool isHor) {
    setState(() {
      if (isHor && _value < widget.maxValue) {
        _value++;
      } else if (!isHor && _value > widget.minValue) {
        _value--;
      }

      widget.onChanged(_value);
    });
  }

  void _decrement(bool isHor) {
    setState(() {
      if (isHor && _value > widget.minValue) {
        _value--;
      } else if (!isHor && _value < widget.maxValue) {
        _value++;
      }
    });

    widget.onChanged(_value);
  }

  void _onPanEnd(DragEndDetails details) {
    _controller.stop();
    isReadyToFastAnim = false;
    isTimerEnable = true;
    final isHor = widget.direction == Axis.horizontal;

    if (_controller.value <= -threshold) {
      _controller.value = -threshold;
      _decrement(isHor);
    } else if (_controller.value >= threshold) {
      _controller.value = threshold;
      _increment(isHor);
    }

    if (widget.withSpring) {
      final defaultSpring = SpringDescription.withDampingRatio(
        mass: 0.9,
        stiffness: 250.0,
        ratio: 0.6,
      );

      if (widget.direction == Axis.horizontal) {
        _controller.animateWith(SpringSimulation(defaultSpring, _startAnimationPosX, 0.0, 0.0));
      } else {
        _controller.animateWith(SpringSimulation(defaultSpring, _startAnimationPosY, 0.0, 0.0));
      }
    } else {
      _controller.animateTo(0.0, curve: Curves.bounceOut, duration: const Duration(milliseconds: 500));
    }
  }
}
