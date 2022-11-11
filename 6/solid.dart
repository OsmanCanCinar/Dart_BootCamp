/*
    ** Single Responsibility Principle (SRP) **

      This principle states (very intuitively) that a class should only have a single reason to change. 
      In other words, you should create classes with a single “responsibility” so that they’re easier to 
      maintain and harder to break.

      Each class must have consistent methods and overall they have a single responsibility.


    ** Open-Closed Principle (OSP) **

      The open-closed principle states that in good architecture the developer should 
      add new behaviors without changing the existing source code. This concept is notoriously 
      described as “classes should be open for extension and closed for changes”.

      "Open for extension but closed for modification"


    ** Liskov Substitution Principle (LSP) **

      The LSP states that subclasses should be replaced with superclasses without changing the logical 
      correctness of the program. In simpler terms, it means that a subtype must guarantee the “usage 
      conditions” of its supertype plus some more behaviors.   


    ** Interface Segregation Principle (ISP) ** 

      This principle states that clients don’t have to implement a behavior they don’t need. The gist of 
      this principle is: you should create small interfaces with minimal methods.

    
    ** Dependency Inversion Principle (DIP) ** 

      The DIP states that we should favor abstractions over implementations. Extending an abstract class 
      or implementing an interface is good but descending from a concrete class is bad.
*/

// Single Responsibilty Principle
abstract class Shape {
  const Shape();

  double computeArea();

  String whichShape();
}

// Interface Segregation Principle
abstract class Diognal {
  void calculateDiognal();
}

// Interface Segregation Principle
abstract class Diameter {
  void calculateDiameter();
}

// Single Responsibilty Principle
class Rectangle extends Shape with Diognal {
  final double width;
  final double height;
  const Rectangle(this.width, this.height);

  @override
  double computeArea() => width * height;

  @override
  String whichShape() => 'Rectangle';

  // Interface Segregation Principle
  @override
  void calculateDiognal() {}
}

// Single Responsibilty Principle
class Circle extends Shape with Diameter {
  final double radius;
  const Circle(this.radius);

  @override
  double computeArea() => radius * radius * 3.1415;

  @override
  String whichShape() => 'Circle';

  // Interface Segregation Principle
  @override
  void calculateDiameter() {}
}

// Open-Closed Principle
class AreaCalculator {
  double calculate(Shape shape) => shape.computeArea();
}

// Single Responsibilty Principle - UI painting Related
class ShapePainter {
  void paintSquare() {
    /* ... */
  }
  void paintCircle() {
    /* ... */
  }
  void paintTriangle() {
    /* ... */
  }
}

void main() {
  final Rectangle rectangle = Rectangle(2, 4);
  final Circle circle = Circle(2.1);

  // Liskov Substitution Principle
  Shape myShape = Rectangle(4, 1);

  double area = myShape.computeArea();
  print(myShape.whichShape() + ' ' + myShape.computeArea().toString());

  // Liskov Substitution Principle
  myShape = Circle(5.6);

  area = myShape.computeArea();
  print(myShape.whichShape() + ' ' + myShape.computeArea().toString());
}

// The Highest Level
abstract class ICameraManager {
  void readQR();
}

// Medium level
class DeviceCameraManager extends ICameraManager {
  final IphoneCameraRead iphoneCameraRead;

  DeviceCameraManager(this.iphoneCameraRead);

  @override
  void readQR() {
    iphoneCameraRead.readQR();
  }
}

// Lowest Level
class IphoneCameraRead extends ICameraManager {
  @override
  void readQR() {
    // TODO: implement readQR
  }
}
