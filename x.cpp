#include <bits/stdc++.h>
using namespace std;
#define ll long long
int main()
{
    ios::sync_with_stdio(0);
    cin.tie(0);
    int t;
    cin >> t;
    while (t--)
    {
      int n;
      cin>>n;
      vector<int>v(n),even;
      for(int i=0;i<n;i++){
        cin>>v[i];
        if(v[i]%2==0) even.push_back(v[i]);
      }
    
      if(even.size()>=2){
        cout<<even[0]<<" "<<even[1]<<'\n';
        continue;
      }
      bool f=false;
      for(int i=0;i<v.size();i++){
        for(int j=i+1;j<v.size();j++){
          if((v[j]%v[i])%2==0){
            cout<<v[i]<<" "<<v[j]<<'\n';
            f=true;
            break;
          }
        }
        if(f)break;
      }
      if(!f)cout<<-1<<'\n';

    }
    return 0;
}