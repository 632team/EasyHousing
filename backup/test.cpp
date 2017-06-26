#include <cstdio>
#include <cstring>
#include <iostream>
#include <queue>
#include <vector>
#include <algorithm>
#include <string>
#include <cmath>
#include <set>
#include <map>
#include <vector>
#include <stack>
#include <utility>
#include <sstream>
using namespace std;
typedef long long ll;
typedef pair<int, int> P;
const int inf = 0x3f3f3f3f;
const int maxn = 400010;
#define pr(x) cout << #x <<" = " << x << " ";
#define prln(x) cout << #x <<" = " << x << " " << endl;

vector <string> vt;

int main()
{
    freopen("in.txt","r",stdin);
    freopen("out.txt","w",stdout);
    string s;
    while(getline(cin, s)) {
    	vt.clear();
    	bool ok = false;
    	for(int i = 0; i < s.size(); i++) {
    		if(ok) {
    			s[i] = ' '; continue;
    		}
    		if(s[i] == ')') {
    			s[i] = ' ';
    			ok = true; continue;
    		}
    		if(s[i] >= 'a' && s[i] <= 'z') continue;
    		if(s[i] >= 'A' && s[i] <= 'Z') continue;
    		s[i] = ' ';
    	}
    	stringstream ss(s);
    	string t;
    	while(ss >> t) {
    		vt.push_back(t);
    	}
    	cout << vt[0] << " " << vt[1] <<" " << vt[2] << "(" << vt[3];
    	for(int i = 4; i < vt.size(); i++) {
    		cout << ", " << vt[i];
    	}
    	cout << ") VALUES(" << "#{" << vt[3] << "}";
    	for(int i = 4; i < vt.size(); i++) {
    		cout << ", #{" << vt[i] << "}";
    	}
    	cout << ")" << endl;
    }
    return 0;
}
