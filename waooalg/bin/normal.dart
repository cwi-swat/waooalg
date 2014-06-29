
abstract class Exp {
  int eval();
}

class Lit extends Exp {
  int value;
  Lit(this.value);
  
  @override
  int eval() => value;
}

class Add extends Exp {
  Exp lhs, rhs;
  Add(this.lhs, this.rhs);
  
  @override
  int eval() => lhs.eval() + rhs.eval();
}

void main() {
  var x = new Add(new Lit(1), new Lit(2));
  print(x.eval());
}