#include<iostream>
#include<cmath>
#include<fstream>
#include <complex>


int main()
{

 // using uninitialised variable should trigger warning
 unsigned bla;
 std::cout << "bla: " << bla << std::endl;

 
#ifdef BLA
 std::cout << "compiled with BLA" << std::endl;
#else
 std::cout << "compiled without BLA" << std::endl;
#endif
 
 
#ifdef BLABLA
 std::cout << "compiled with BLABLA" << std::endl;
#else
 std::cout << "compiled without BLABLA" << std::endl;
#endif
 
 return 0;
}
