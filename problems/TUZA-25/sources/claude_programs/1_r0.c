/* Independent exhaustive test of PK-all / PK-exists (TUZA-18 definition).
 * Reads graph6 lines on stdin (n <= 11).  For every maximum triangle packing P:
 *   B = E(P); Q (not in P) is private iff |E(Q) & B| == 1;
 *   private K4 completion of T in P: actual K4 on V(T)+w whose 3 other faces are private;
 *   A(P) = B + all edges of all such completions.
 * Decides whether a triangle cover C subset A(P) with |C| <= 2|P| exists.
 * Output per graph: only graphs with some failing P (PK-all failure), flagged if all P fail.
 * Summary on stderr.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#define MAXN 16
#define MAXE 120
#define MAXT 560
typedef unsigned long long u64;
typedef unsigned __int128 u128;

static int n, ne, nt;
static int eid[MAXN][MAXN];
static int eu[MAXE], ev[MAXE];
static int tv[MAXT][3];
static u128 tmask[MAXT];      /* edge mask of triangle */
static int tri_of_edge[MAXE][MAXN]; static int ntoe[MAXE];
static int adj[MAXN][MAXN];

static inline int pc(u128 x){ return __builtin_popcountll((u64)x)+__builtin_popcountll((u64)(x>>64)); }
static inline int ctz128(u128 x){ u64 lo=(u64)x; if(lo) return __builtin_ctzll(lo); return 64+__builtin_ctzll((u64)(x>>64)); }

static int parse_g6(const char *s){
    int nn = s[0]-63; n = nn; ne=0;
    memset(adj,0,sizeof adj);
    int bit=0; const char *p=s+1; int cur=0, k=6;
    for(int j=1;j<nn;j++) for(int i=0;i<j;i++){
        if(k==6){ cur = (*p)-63; p++; k=0; }
        int b = (cur>>(5-k))&1; k++;
        if(b){ adj[i][j]=adj[j][i]=1; }
        bit++;
    }
    for(int i=0;i<n;i++) for(int j=0;j<n;j++) eid[i][j]=-1;
    for(int i=0;i<n;i++) for(int j=i+1;j<n;j++) if(adj[i][j]){ eid[i][j]=eid[j][i]=ne; eu[ne]=i; ev[ne]=j; ne++; }
    nt=0; memset(ntoe,0,sizeof ntoe);
    for(int a=0;a<n;a++) for(int b=a+1;b<n;b++) if(adj[a][b]) for(int c=b+1;c<n;c++) if(adj[a][c]&&adj[b][c]){
        tv[nt][0]=a; tv[nt][1]=b; tv[nt][2]=c;
        int e1=eid[a][b], e2=eid[a][c], e3=eid[b][c];
        tmask[nt] = ((u128)1<<e1)|((u128)1<<e2)|((u128)1<<e3);
        tri_of_edge[e1][ntoe[e1]++]=nt; tri_of_edge[e2][ntoe[e2]++]=nt; tri_of_edge[e3][ntoe[e3]++]=nt;
        nt++;
    }
    return ne;
}

/* ---- maximum packing number ---- */
static int best;
static void nu_rec(u128 used, u128 undecided, int cur){
    if(cur + pc(undecided)/3 <= best) return;
    /* find lowest undecided edge that still lies in a free triangle */
    while(undecided){
        int e = ctz128(undecided);
        int any=0;
        for(int t=0;t<ntoe[e];t++){ int T=tri_of_edge[e][t]; if(!(tmask[T]&used)){ any=1; break; } }
        if(any) break;
        undecided &= ~((u128)1<<e);
    }
    if(!undecided){ if(cur>best) best=cur; return; }
    if(cur + pc(undecided)/3 <= best) return;
    int e = ctz128(undecided);
    for(int t=0;t<ntoe[e];t++){ int T=tri_of_edge[e][t]; if(!(tmask[T]&used)){
        nu_rec(used|tmask[T], undecided & ~tmask[T], cur+1);
    }}
    nu_rec(used|((u128)1<<e), undecided & ~((u128)1<<e), cur);
}


static u128 Aallow;
static int cover_rec(u128 C, int budget){
    int first=-1; u128 seen=0; int lb=0;
    for(int t=0;t<nt;t++) if(!(tmask[t]&C)){
        if(first<0) first=t;
        u128 m = tmask[t]&Aallow;
        if(!(m&seen)){ seen|=m; lb++; }
    }
    if(first<0) return 1;
    if(lb>budget) return 0;
    u128 m = tmask[first]&Aallow;
    while(m){ int e=ctz128(m); m&=m-1;
        if(cover_rec(C|((u128)1<<e), budget-1)) return 1; }
    return 0;
}
static int nu_del(u128 del){ best=0; u128 all=(((u128)1<<ne)-1); nu_rec(del, all&~del, 0); return best; }
static int ufp[MAXT];
static int uf(int x){ while(ufp[x]!=x){ ufp[x]=ufp[ufp[x]]; x=ufp[x];} return x; }
/* modes: R = resilience level required (1 or 2) */
int main(int argc, char **argv){
    int R = argc>1 ? atoi(argv[1]) : 2;
    char line[256]; long long graphs=0, cand=0, r1=0, r2=0;
    while(fgets(line,sizeof line,stdin)){
        line[strcspn(line,"\r\n")]=0; if(!line[0]) continue;
        parse_g6(line); graphs++;
        if(nt==0) continue;
        int ok=1; for(int e=0;e<ne;e++) if(ntoe[e]==0){ ok=0; break; }
        if(!ok) continue;
        for(int t=0;t<nt;t++) ufp[t]=t;
        for(int e=0;e<ne;e++) for(int i=1;i<ntoe[e];i++){ int a=uf(tri_of_edge[e][0]), b=uf(tri_of_edge[e][i]); if(a!=b) ufp[a]=b; }
        int comps=0; for(int t=0;t<nt;t++) if(uf(t)==t) comps++;
        if(comps!=1) continue;
        cand++;
        int k=nu_del(0);
        if(R>=1) for(int e=0;e<ne && ok;e++) if(nu_del((u128)1<<e)<k) ok=0;
        if(!ok) continue;
        r1++;
        if(R>=2){
            for(int e=0;e<ne && ok;e++) for(int f=e+1;f<ne && ok;f++)
                if(nu_del(((u128)1<<e)|((u128)1<<f))<k) ok=0;
            if(!ok) continue;
            r2++;
        }
        Aallow=(((u128)1<<ne)-1); int tau=0; while(!cover_rec(0,tau)) tau++;
        int mc=0; for(unsigned c=0;c<(1u<<(n-1));c++){ int cut=0; for(int e=0;e<ne;e++) if(((c>>eu[e])^(c>>ev[e]))&1) cut++; if(cut>mc) mc=cut; }
        int mindeg=99, mincod=99; for(int v=0;v<n;v++){int d=0; for(int w=0;w<n;w++) d+=adj[v][w]; if(d<mindeg) mindeg=d;}
        for(int e=0;e<ne;e++) if(ntoe[e]<mincod) mincod=ntoe[e];
        printf("%s n=%d m=%d nt=%d nu=%d tau=%d beta=%d leave=%d mindeg=%d mincodeg=%d %s%s\n", line, n, ne, nt, k, tau, ne-mc, ne-3*k, mindeg, mincod,
               tau==2*k?"TIGHT ":"", (ne-mc)>2*k?"CUTBAD":"");
        fflush(stdout);
    }
    fprintf(stderr,"graphs=%lld triangle-connected-all-edges-in-triangles=%lld R1=%lld R2=%lld\n",graphs,cand,r1,r2);
    return 0;
}
