
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


class PrintExp implements ExpAlg<String> {  
  @override
  String add(String lhs, String rhs) => "${lhs} + ${rhs}";

  @override
  String lit(int n) => n.toString();
}

/*
 * Evaluation of expressions
 */

class EvalExp implements ExpAlg<int> {
  @override
  int add(int lhs, int rhs) => lhs + rhs;

  @override
  int lit(int n) => n;
}

/*
 * Using the code
 */

makeExp(ExpAlg a) => a.add(a.lit(1), a.lit(2));

void baseMain() {
  var x1 = makeExp(new PrintExp());
  print(x1);
  
  var x2 = makeExp(new EvalExp());
  print(x2);
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

class PrintExpMul extends PrintExp implements MulAlg<String> {
  @override
  String mul(String lhs, String rhs) => "${lhs} * ${rhs}";
}

/*
 * Evaluating multiplication
 */

class EvalExpMul extends EvalExp implements MulAlg<int> {
  @override
  int mul(int lhs, int rhs) => lhs * rhs;
}


/* Using the extended code */

makeMulExp(MulAlg a) => a.add(a.lit(1), a.mul(a.lit(2), a.lit(3))); 

void mulMain() {
  var x1 = makeMulExp(new PrintExpMul());
  print(x1);
  
  var x2 = makeMulExp(new EvalExpMul());
  print(x2);
}


void main() {
  baseMain();
  mulMain();
}

