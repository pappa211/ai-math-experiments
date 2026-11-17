#include <algorithm>
#include <chrono>
#include <fstream>
#include <iostream>
#include <numeric>
#include <set>
#include <vector>
using namespace std;
using Clock=chrono::steady_clock;
Clock::time_point started=Clock::now();
long long nodes=0,minimum_covers=0;int cores=0;bool found=false,timed=false;
vector<pair<int,int>> CE;vector<int> N,pat,chosen,h,vc,wt,tf;vector<vector<int>> cost;
int n,m,maxb,badS=0,bestPrivate=0;
bool deadline(){return chrono::duration<double>(Clock::now()-started).count()>50;}
void emit(bool hit){
 cout<<"{\"status\":\""<<(hit?"COUNTEREXAMPLE":timed?"UNKNOWN_TIMEOUT":"NO_COUNTEREXAMPLE_IN_DOMAIN")<<"\",\"cores_started\":"<<cores<<",\"multisets_visited\":"<<nodes<<",\"minimum_covers_checked\":"<<minimum_covers<<",\"seconds\":"<<chrono::duration<double>(Clock::now()-started).count();
 if(hit){cout<<",\"nA\":"<<n<<",\"core_edges\":[";for(int i=0;i<m;i++){if(i)cout<<",";cout<<"["<<CE[i].first<<","<<CE[i].second<<"]";}cout<<"],\"neighborhood_vertex_masks\":[";for(int i=0;i<(int)chosen.size();i++){if(i)cout<<",";cout<<N[chosen[i]];}cout<<"],\"violating_core_edge_mask\":"<<badS<<",\"ordinary_tau\":"<<m<<",\"private_tau\":"<<bestPrivate;}
 cout<<"}\n";
}
void rec(int lo){
 ++nodes;if((nodes&4095)==0&&deadline()){timed=true;return;}
 int maxdeg=0;vector<int>deg(n);for(auto e:CE){deg[e.first]++;deg[e.second]++;}for(int x:deg)maxdeg=max(maxdeg,x);
 if((int)chosen.size()>=maxdeg){
  bool minimum=true;int worst=0,which=0;
  for(int s=1;s<(1<<m);s++){int d=h[s]-wt[s];if(tf[s]&&d<0){minimum=false;break;}if(d<worst){worst=d;which=s;}}
  if(minimum){minimum_covers++;if(worst<0){found=true;badS=which;bestPrivate=m+worst;emit(true);return;}}
 }
 if((int)chosen.size()==maxb)return;
 for(int i=lo;i<(int)pat.size();i++){
  chosen.push_back(i);for(int s=0;s<(1<<m);s++)h[s]+=cost[i][s];
  rec(i);if(found||timed)return;
  for(int s=0;s<(1<<m);s++)h[s]-=cost[i][s];chosen.pop_back();
 }
}
int canonical(int mask,const vector<pair<int,int>>&all,int nn){vector<int>p(nn);iota(p.begin(),p.end(),0);int best=mask;do{int z=0;for(int i=0;i<(int)all.size();i++)if(mask>>i&1){int a=p[all[i].first],b=p[all[i].second];if(a>b)swap(a,b);int j=0;while(all[j]!=make_pair(a,b))j++;z|=1<<j;}best=min(best,z);}while(next_permutation(p.begin(),p.end()));return best;}
void core(int nn,int mask,const vector<pair<int,int>>&all){
 n=nn;CE.clear();for(int i=0;i<(int)all.size();i++)if(mask>>i&1)CE.push_back(all[i]);m=CE.size();vector<int>tri;
 for(int a=0;a<n;a++)for(int b=a+1;b<n;b++)for(int c=b+1;c<n;c++){int t=0;for(int j=0;j<m;j++)if(CE[j]==make_pair(a,b)||CE[j]==make_pair(a,c)||CE[j]==make_pair(b,c))t|=1<<j;if(__builtin_popcount((unsigned)t)==3)tri.push_back(t);}
 if(tri.empty())return;cores++;maxb=n==4?6:5;int lim=1<<m;wt.resize(lim);tf.assign(lim,1);vc.assign(lim,n);
 vector<int>covermask(1<<n);for(int q=0;q<(1<<n);q++)for(int j=0;j<m;j++)if((q>>CE[j].first&1)||(q>>CE[j].second&1))covermask[q]|=1<<j;
 for(int s=0;s<lim;s++){wt[s]=__builtin_popcount((unsigned)s);for(int t:tri)if((s&t)==t)tf[s]=0;for(int q=0;q<(1<<n);q++)if((s&covermask[q])==s)vc[s]=min(vc[s],__builtin_popcount((unsigned)q));}
 pat.clear();N.clear();set<int>seen;
 for(int q=0;q<(1<<n);q++){int z=0;for(int j=0;j<m;j++)if((q>>CE[j].first&1)&&(q>>CE[j].second&1))z|=1<<j;if(z&&seen.insert(z).second){pat.push_back(z);N.push_back(q);}}
 cost.assign(pat.size(),vector<int>(lim));for(int i=0;i<(int)pat.size();i++)for(int s=0;s<lim;s++)cost[i][s]=vc[s&pat[i]];
 chosen.clear();h.assign(lim,0);rec(0);
}
int main(){
 for(int nn:{4,5}){vector<pair<int,int>>all;for(int a=0;a<nn;a++)for(int b=a+1;b<nn;b++)all.emplace_back(a,b);
  for(int z=0;z<(1<<(int)all.size());z++)if(canonical(z,all,nn)==z){core(nn,z,all);if(found)return 0;if(timed){emit(false);return 0;}}
 }
 emit(false);return 0;
}
