#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <cstdlib>
using namespace std;

int main() {
	ifstream infile;
	infile.open("scripts.sql");
	string line,ciname="cuisine";
	int j=1;
	while (getline(infile, line)) {
		//int	v2 = rand() % 100000;
		//int v1 = rand() % 15 + 5;
		//int	pin = 1000000;
		//int stdcode = 10000;
		//string pi = "", std="";
		//for(int i=1; i<=v1; i++) {
			//int num = i+v2;
			ostringstream o,p,q;
			o << ciname << j;
			string cuis = o.str();
			//p << pi << pin;
			//string pinc = p.str();
			//q << std << stdcode;
			//string stdc = q.str();
			
			string script = "INSERT INTO states VALUES (";
			script.append(line);
			string comma=",";
			script.append(comma);
			script.append("'");
			script.append(cuis);
			script.append("'");
			//script.append(comma);
			//script.append(pinc);
			//script.append(comma);
			//script.append(stdc);
			script.append(");");
			j++;
			//pin++;
			//stdcode++;
			//stdcode = ((stdcode-10000) % 90000) + 10000;
			cout<<script<<endl;
		//}
	}
	return 0;
}
		
