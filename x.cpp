#include <bits/stdc++.h>
using namespace std;
#define ll long long
int main()
{
    ios::sync_with_stdio(0);
    cin.tie(0);
    ll t;
    cin >> t;
    while (t--)
    {
      ll n,k;
      cin>>n>>k;
      if(k&1LL){
        cout<<-1<<'\n';
        continue;
      }
      map<ll,bool>m;
      for(ll i=1;i<=60;i++){
        if((1LL<<i)&k)m[i]=true;
      }
      ll cnt=0;
      for(ll i=1;i<=60;i++){
        if(k<=0)break;
        ll x=(1LL<<i);
        ll cur=n;
        if(m[i]){
            k-=x;
            cnt++;
            cur--;
            m[i]=false;
        }
        ll total=0,p=0;
       
        for(int j=60;j>=1;j--){
            if(m[j]==false)continue;
            ll xx=(1LL<<j);
            ll y=xx/x;
            
            if(cur>=y){
                p+=y;
                total+=xx;
                cur-=y;
                m[j]=false;
            }
        }
        cnt+=p;
        k-=total;
        
      }
      cout<<cnt<<'\n';
      
    }
    return 0;
}