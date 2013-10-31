#include <iostream>
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <cstdlib>
#include <vector>
#include <stdlib.h> 
#include <cstddef>
using namespace std;

int main() {
    int i=0;
    ifstream read;
    read.open("citiescopy.sql");
    string line;
    int j=1;
    while(getline(read,line)) {
        for(int i=0; i<2; i++) {
        ostringstream o,p;

        o << j;
        string id = o.str();
       
        string name = "hotel"+id;
        srand(j);
        p << (rand()%30)+1;
        string address = p.str();
        size_t countryi = line.find_first_of(",");
        string country = line.substr(1,countryi-2);
        size_t statei = line.find_first_of(",",countryi+1);
        string state = line.substr(countryi+2,statei-countryi-3);
        size_t cityi = line.find_first_of(",",statei+1);
        string city = line.substr(statei+2,cityi-statei-3);
     
        string script = "Insert into hotel values ("+id+",'"+name+"','"+address+"th Street, "+city+", "+state+", "+country+"','"+id+"');";
        
        j++;
        cout << script << endl;
        }
    }
    return 0;
}
