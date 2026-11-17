/* Mixed ("delete/contract") Tuza test = Tuza with edge weights in {1, infinity}.
 * For a graph G and a triangle-free edge set N (edges that may NOT be used in a cover and MAY be shared
 * by packed triangles), the members are the sets E(T)\N.  tau(G;N) = min hitting set avoiding N,
 * nu(G;N) = max number of pairwise disjoint members.  Claim tested:  tau(G;N) <= 2 nu(G;N).
 * (This is the Chapuy-DeVos-McDonald-Mohar-Scheide weighted conjecture restricted to weights {1, W}.)
 * stdin: graph6, n <= 9 (m <= 32).  argv[1] = max number of N per graph (0 = all).
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef unsigned int u32;
#define MAXT 90
static int n, ne, nt; static int adj[10][10], eid[10][10];
static u32 tmask[MAXT];
static u32 mem[MAXT]; static int nm;
static long long nN, nTight, nFail, capN; static char *curline;
static int bestnu;
static void nu_rec(int i, u32 used, int cnt){
    if(cnt + (nm - i) <= bestnu) return;
    if(i==nm){ bestnu=cnt; return; }
    if(!(mem[i]&used)) nu_rec(i+1, used|mem[i], cnt+1);
    nu_rec(i+1, used, cnt);
}
static int cov_rec(u32 C, int budget){
    int first=-1, lb=0; u32 seen=0;
    for(int i=0;i<nm;i++) if(!(mem[i]&C)){ if(first<0) first=i; if(!(mem[i]&seen)){ seen|=mem[i]; lb++; } }
    if(first<0) return 1;
    if(lb>budget) return 0;
    u32 m=mem[first];
    while(m){ u32 b=m&-m; m^=b; if(cov_rec(C|b, budget-1)) return 1; }
    return 0;
}
static int cmp_pop(const void*a,const void*b){ int x=__builtin_popcount(*(u32*)a), y=__builtin_popcount(*(u32*)b); return x-y; }
static void test(u32 N){
    nN++;
    u32 tmp[MAXT]; int k=0;
    for(int t=0;t<nt;t++) tmp[k++]=tmask[t]&~N;
    qsort(tmp,k,sizeof(u32),cmp_pop);
    nm=0;
    for(int i=0;i<k;i++){ int ok=1; for(int j=0;j<nm;j++) if((mem[j]&tmp[i])==mem[j]){ ok=0; break; } if(ok) mem[nm++]=tmp[i]; }
    bestnu=0; nu_rec(0,0,0);
    if(!cov_rec(0, 2*bestnu)){ nFail++; printf("FAIL %s N=%x nu=%d\n", curline, N, bestnu); fflush(stdout); }
    else if(bestnu>0 && !cov_rec(0, 2*bestnu-1)){ nTight++; if(N) { static long long shown=0; if(shown<400){ shown++; printf("TIGHT %s N=%x nu=%d members=%d\n", curline, N, bestnu, nm);} } }
}
static void enumN(int e, u32 N){
    if(capN && nN>=capN) return;
    if(e==ne){ test(N); return; }
    enumN(e+1, N);
    u32 N2=N|(1u<<e); int ok=1;
    for(int t=0;t<nt;t++) if((tmask[t]&N2)==tmask[t]){ ok=0; break; }
    if(ok) enumN(e+1, N2);
}
int main(int argc,char**argv){
    long long cap = argc>1?atoll(argv[1]):0;
    char line[128]; long long graphs=0, totN=0, totT=0, totF=0;
    while(fgets(line,sizeof line,stdin)){
        line[strcspn(line,"\r\n")]=0; if(!line[0]) continue; curline=line;
        n=line[0]-63; memset(adj,0,sizeof adj); const char*p=line+1; int cur=0,k=6; ne=0;
        for(int j=1;j<n;j++) for(int i=0;i<j;i++){ if(k==6){cur=*p++-63;k=0;} if((cur>>(5-k))&1){adj[i][j]=adj[j][i]=1;} k++; }
        for(int i=0;i<n;i++) for(int j=i+1;j<n;j++) if(adj[i][j]) eid[i][j]=eid[j][i]=ne++;
        nt=0; for(int a=0;a<n;a++) for(int b=a+1;b<n;b++) if(adj[a][b]) for(int c=b+1;c<n;c++) if(adj[a][c]&&adj[b][c]) tmask[nt++]=(1u<<eid[a][b])|(1u<<eid[a][c])|(1u<<eid[b][c]);
        if(!nt||ne>32) continue;
        graphs++; nN=nTight=nFail=0; capN=cap; enumN(0,0); totN+=nN; totT+=nTight; totF+=nFail;
    }
    fprintf(stderr,"graphs_with_triangles=%lld (G,N)_pairs=%lld tight=%lld FAIL=%lld\n",graphs,totN,totT,totF);
    return 0;
}
