#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <cstdlib>
using namespace std;

int main() {
	ifstream infile;
	string comma=",";
	infile.open("scripts.sql");
	string line,ciname="spot";
	int j=1;
	while (j<=57450) {
		int nospots = rand() % 3;
		int spotno = rand() % 50000;
		string pi = "", std="";
		for(int i=1; i<=nospots; i++) {
			int type = rand() % 16 +1;
			int num = spotno+i;
			ostringstream o,p,q;
			o << pi << type;
			string typeID = o.str();
			p << pi << j;
			string pinc = p.str();
			q << ciname << num;
			string stdc = q.str();
			
			string script = "INSERT INTO touristspots(cityid,spotname,typeid) VALUES (";
			script.append(pinc);
			script.append(comma);
			script.append("'");
			script.append(stdc);
			script.append("'");
			script.append(comma);
			script.append(typeID);
			script.append(");");
			cout<<script<<endl;
		}
		j++;
	}
	return 0;
}
		
