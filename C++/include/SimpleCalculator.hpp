#pragma once

#if defined(_WIN64)
    #define EXPORT __declspec(dllexport)
#elif defined(__APPLE__) && defined(__MACH__)
    #define EXPORT
#endif

class EXPORT SimpleCalculator {
public:
    SimpleCalculator();
    ~SimpleCalculator();

    int add(int a, int b);
    int subtract(int a, int b);
    int multiply(int a, int b);
    int divide(int a, int b);
};

#ifdef __cplusplus
extern "C" {
#endif

EXPORT SimpleCalculator* createSimpleCalculator();
EXPORT void destroySimpleCalculator(SimpleCalculator* calculator);
EXPORT int add(SimpleCalculator* calculator, int a, int b);
EXPORT int subtract(SimpleCalculator* calculator, int a, int b);
EXPORT int multiply(SimpleCalculator* calculator, int a, int b);
EXPORT int divide(SimpleCalculator* calculator, int a, int b);

#ifdef __cplusplus
}
#endif