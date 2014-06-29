
abstract class Exp {
  accept(Visitor v);
}

abstract class Visitor {
  visitLit(Lit e);
  visitAdd(Add e);
}

class Lit extends Exp {
  int value;
  Lit(this.value);

  @override
  accept(Visitor v) => v.visitLit(this);
}

class Add extends Exp {
  Exp lhs, rhs;
  Add(this.lhs, this.rhs);

  @override
  accept(Visitor v) => v.visitAdd(this);
}

/*
 * Evaluation visitor
 */

class Eval implements Visitor {
  @override
  visitAdd(Add e) => e.lhs.accept(this) + e.rhs.accept(this);

  @override
  visitLit(Lit e) => e.value;
}

void main() {
  var x = new Add(new Lit(1), new Lit(2));
  print(x.accept(new Eval()));
//  print(x.accept(new Print()));
}