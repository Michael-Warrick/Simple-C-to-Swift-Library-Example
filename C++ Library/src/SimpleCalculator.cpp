#include "SimpleCalculator.hpp"

SimpleCalculator::SimpleCalculator() {}

SimpleCalculator::~SimpleCalculator() {}

int SimpleCalculator::add(int a, int b) {
    return a + b;
}

int SimpleCalculator::subtract(int a, int b) {
    return a - b;
}

int SimpleCalculator::multiply(int a, int b) {
    return a * b;
}

int SimpleCalculator::divide(int a, int b) {
    if (b != 0) {
        return a / b;
    }
    else {
        // Error: Division by zero
        return 0;
    }
}

#ifdef __cplusplus
extern "C" {

SimpleCalculator* createSimpleCalculator() {
    return new SimpleCalculator();
}

void destroySimpleCalculator(SimpleCalculator* calculator) {
    delete calculator;
}

int add(SimpleCalculator* calculator, int a, int b) {
    return calculator->add(a, b);
}

int subtract(SimpleCalculator* calculator, int a, int b) {
    return calculator->subtract(a, b);
}

int multiply(SimpleCalculator* calculator, int a, int b) {
    return calculator->multiply(a, b);
}

int divide(SimpleCalculator* calculator, int a, int b) {
    return calculator->divide(a, b);
}

}
#endif