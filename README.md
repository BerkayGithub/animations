# animations

A new Flutter project using different animation visuals.

## Hero

You've probably seen hero animations many times. For example, a screen displays a list of thumbnails representing items for sale. Selecting an item flies it to a new screen, containing more details and a "Buy" button. Flying an image from one screen to another is called a hero animation in Flutter, though the same motion is sometimes referred to as a shared element transition.

main.dart

    Hero(tag: "berkay", child: FlutterLogo(size: 64)),
    OutlinedButton(onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewPage()));
    }, child: Text("Next Page"))

new_page.dart

    Hero(
      tag: "berkay",
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(Colors.green, BlendMode.modulate),
        child: FlutterLogo(size: 256),
      ),
    ),

## Ticker and Animation Controller

main.dart

    class _MyHomePageState extends State<MyHomePage>
        with SingleTickerProviderStateMixin {
      int _counter = 0;
      AnimationController? controller;
    
      @override
      void initState() {
        super.initState();
        controller = AnimationController(
          vsync: this,
          duration: Duration(seconds: 1),
          lowerBound: 0,
          upperBound: 40,
        );
        controller?.addListener(() {
          setState(() {
            debugPrint(controller?.value.toString());
          });
        });
        controller?.forward();
        controller?.addStatusListener((durum){
          debugPrint(durum.toString());
          if(durum == AnimationStatus.completed){
            controller?.reverse().orCancel;
          }else if(durum == AnimationStatus.dismissed){
            controller?.forward().orCancel;
          }
        });
      }
    
      @override
      void dispose() {
        controller?.dispose();
        super.dispose();
      }

## Tween

A linear interpolation between a beginning and ending value.

Tween is useful if you want to interpolate across a range.

To use a Tween object with an animation, call the Tween object's animate method and pass it the Animation object that you want to modify.

main.dart

    late Animation animation;
    late Animation animation2;

    @override
    void initState() {
      super.initState();
      controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3),
      );
      controller?.addListener(() {
        setState(() {
        });
      });
  
      //animation = Tween<double>(begin: 20, end: 150).animate(controller!);
      animation = ColorTween(begin: Colors.red, end: Colors.yellow).animate(controller!);
      animation2 = AlignmentTween(begin: Alignment(-1,-1), end: Alignment(1, -1)).animate(controller!);

## Curves

An parametric animation easing curve, i.e. a mapping of the unit interval to the unit interval.

Easing curves are used to adjust the rate of change of an animation over time, allowing them to speed up and slow down, rather than moving at a constant rate.

A Curve must map t=0.0 to 0.0 and t=1.0 to 1.0.

main.dart

    late Animation animation3;
  
    animation3 = CurvedAnimation(parent: controller!, curve: Curves.ease);
  
    Text(
      'You have pushed the button this many times:',
      style: TextStyle(fontSize: animation3.value * 36),
    ),

## Staggered Animations

Staggered animations are a straightforward concept: visual changes happen as a series of operations, rather than all at once. The animation might be purely sequential, with one change occurring after the next, or it might partially or completely overlap. It might also have gaps, where no changes occur.

pubspec.yaml

    flutter_sequence_animation: ^4.0.0

new_page.dart

    class _NewPageState extends State<NewPage> with SingleTickerProviderStateMixin {
      late AnimationController controller;
      late SequenceAnimation sequenceAnimation;
    
      @override
      void initState() {
        super.initState();
        controller = AnimationController(vsync: this);
    
        sequenceAnimation = SequenceAnimationBuilder()
            .addAnimatable(
              animatable: Tween<double>(begin: 0, end: 1),
              from: Duration.zero,
              to: Duration(seconds: 2),
              tag: "opacity",
            )
            // Other animatables
            .addAnimatable(
              animatable: ColorTween(
                begin: Colors.indigo[100],
                end: Colors.orange[400],
              ),
              curve: Curves.ease,
              from: const Duration(milliseconds: 750),
              to: const Duration(milliseconds: 1000),
              tag: "color",
            )
            .animate(controller);
    
        controller.forward();
      }
      // Lines of code

      child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? widget) {
            return Opacity(
              opacity: sequenceAnimation["opacity"].value,
              child: Container(
                decoration: BoxDecoration(
                  color: sequenceAnimation["color"].value,
                  border: Border.all(
                    width: 3,
                    color: Colors.pink
                  ),
                  borderRadius: sequenceAnimation["border"].value
                ),
                padding: sequenceAnimation["padding"].value,
                width: sequenceAnimation["width"].value,
                height: sequenceAnimation["height"].value,

## AnimatedContainer/AnimatedCrossfade/AnimatedOpacity

animasyonlu_widgetlar.dart

    AnimatedContainer(
      height: _height,
      width: _width,
      duration: Duration(seconds: 2),
      color: _color,
    ),
    // Other Widgets
    AnimatedCrossFade(
      firstChild: Image.network(
        "https://codit.com.tr/media/blog/34/network-nedir-network-cesitleri-ve-iletisim-protokolleri.jpg",
      ),
      secondChild: Image.network(
        "https://www.avansas.com/blog/wp-content/uploads/2023/02/network-nedir-is-hayatinda-cevrenizi-gelistirmenin-yollari-950x500.jpeg",
      ),
      crossFadeState: ilkCocukAktif
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: Duration(seconds: 3),
    ),
    //Other widgets
    AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(seconds: 2),
      child: FlutterLogo(size: 150),
    ),

## Transform,Rotate,Scale,Translate

Transform is a widget that applies a transformation before painting its child.

Unlike RotatedBox, which applies a rotation prior to layout, this object applies its transformation just prior to painting, which means the transformation is not taken into account when calculating how much space this widget's child (and thus this widget) consumes.

Scale creates a widget that scales its child along the 2D plane.

The scaleX argument provides the scalar by which to multiply the x axis, and the scaleY argument provides the scalar by which to multiply the y axis. Either may be omitted, in which case the scaling factor for that axis defaults to 1.0.

Rotate creates a widget that transforms its child using a rotation around the center.

The angle argument gives the rotation in clockwise radians.

Translate creates a widget that transforms its child using a translation.

The offset argument specifies the translation.

transform_animasyon.dart

    var _sliderDegeri = 0.0;

    //Lines of code
  
    Container getRotate() {
      return Container(
        child: Transform.rotate(
          angle: _sliderDegeri,
          origin: Offset(50, 0.0),
          child: Container(height: 100, width: 100, color: Colors.blue),),
      );
    }
  
    getScale() {
      return Container(
        child: Transform.scale(
          scale: _sliderDegeri == 0 ? 1 : _sliderDegeri/50,
          child: Container(height: 100, width: 100, color: Colors.blue),),
      );
    }
  
    getTransform() {
      return Container(
        child: Transform.translate(
          offset: Offset(_sliderDegeri, _sliderDegeri),
          child: Container(height: 100, width: 100, color: Colors.cyan),),
      );
    }
