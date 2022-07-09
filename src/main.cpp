#include <iostream>
#include "header.h"
#include "lhhadd.h"
#include "juu.h"

using namespace std;

int main()
{
    cout << "main start >>>>>>>>" << endl;
    headerFunc();

    cout << ladd(2,8) << endl;

    printJuu();

    cout << "main end >>>>>>>>>>" << endl;
    return 0;
}
