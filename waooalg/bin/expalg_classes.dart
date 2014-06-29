
/*
 * Basic expressions: literals and addition
 */

abstract class ExpAlg<E> {
  E lit(int n);
  E add(E lhs, E rhs);
}

/*
 * A print operation
 */

abstract class IPrint {
  String print();
}

class PrintExp implements ExpAlg<IPrint> {  
  @override
  IPrint add(IPrint lhs, IPrint rhs) => new PrintAdd(lhs, rhs);

  @override
  IPrint lit(int n) => new PrintLit(n);
}

class PrintAdd implements IPrint {
  IPrint lhs, rhs;
  PrintAdd(this.lhs, this.rhs);
  
  @override
  String print() => "${lhs.print()} + ${rhs.print()}";
}

class PrintLit implements IPrint {
  int value;
  PrintLit(this.value);

  @override
  String print() => value.toString();
}

/*
 * Evaluation of expressions
 */

abstract class IEval {
  int eval();
}

class EvalExp implements ExpAlg<IEval> {
  @override
  IEval add(IEval lhs, IEval rhs) => new EvalAdd(lhs, rhs);

  @override
  IEval lit(int n) => new EvalLit(n);
}

class EvalAdd implements IEval {
  IEval lhs, rhs;
  EvalAdd(this.lhs, this.rhs);
  
  @override
  int eval() => lhs.eval() + rhs.eval();
}

class EvalLit implements IEval {
  int value;
  EvalLit(this.value);

  @override
  int eval() => value;
}

/*
 * Using the code
 */

makeExp(ExpAlg a) => a.add(a.lit(1), a.lit(2));

void baseMain() {
  var x1 = makeExp(new PrintExp());
  print(x1.print());
  
  var x2 = makeExp(new EvalExp());
  print(x2.eval());
}

/*
 * Language extension with multiplication
 */

abstract class MulAlg<E> extends ExpAlg<E> {
  E mul(E lhs, E rhs); 
}

/*
 * Printing multiplication
 */

class PrintExpMul extends PrintExp implements MulAlg<IPrint> {
  @override
  IPrint mul(IPrint lhs, IPrint rhs) => new PrintMul(lhs, rhs);
}

class PrintMul implements IPrint {
  IPrint lhs, rhs;
  PrintMul(this.lhs, this.rhs);
  
  @override
  String print() => "${lhs.print()} * ${rhs.print()}";
}

/*
 * Evaluating multiplication
 */

class EvalExpMul extends EvalExp implements MulAlg<IEval> {
  @override
  IEval mul(IEval lhs, IEval rhs) => new EvalMul(lhs, rhs);
}

class EvalMul implements IEval {
  IEval lhs, rhs;
  EvalMul(this.lhs, this.rhs);
  
  @override
  int eval() => lhs.eval() * rhs.eval();
}

/* Using the extend code */

makeMulExp(MulAlg a) => a.add(a.lit(1), a.mul(a.lit(2), a.lit(3))); 

void mulMain() {
  var x1 = makeMulExp(new PrintExpMul());
  print(x1.print());
  
  var x2 = makeMulExp(new EvalExpMul());
  print(x2.eval());
}


void main() {
  baseMain();
  mulMain();
}

