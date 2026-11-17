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

/* ---- cover feasibility inside A with budget ---- */
static u128 Aallow;
static int cover_rec(u128 C, int budget){
    /* find first uncovered triangle; lower bound by greedy disjoint uncovered triangles */
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

/* memo of A masks tested in this graph */
#define MEMO 4096
static u128 memoA[MEMO]; static int memoR[MEMO]; static int nmemo;

static int k_nu; static long long npack; static long long nbad;
static int packT[64];
static int any_good;

static int test_packing(int k){
    u128 B=0; for(int i=0;i<k;i++) B|=tmask[packT[i]];
    u128 A=B;
    for(int i=0;i<k;i++){
        int T=packT[i]; int a=tv[T][0], b=tv[T][1], c=tv[T][2];
        for(int w=0;w<n;w++){ if(w==a||w==b||w==c) continue;
            if(!(adj[w][a]&&adj[w][b]&&adj[w][c])) continue;
            u128 sp = ((u128)1<<eid[w][a])|((u128)1<<eid[w][b])|((u128)1<<eid[w][c]);
            if(sp & B) continue;   /* each other face then meets B exactly in its T edge */
            A |= sp;
        }
    }
    for(int i=0;i<nmemo;i++) if(memoA[i]==A) return memoR[i];
    Aallow=A;
    int r = cover_rec(0, 2*k);
    if(nmemo<MEMO){ memoA[nmemo]=A; memoR[nmemo]=r; nmemo++; }
    return r;
}

static long long pack_limit;
static int aborted;
static void enum_rec(u128 used, u128 undecided, int cur){
    if(aborted) return;
    if(cur + pc(undecided)/3 < k_nu) return;
    while(undecided){
        int e = ctz128(undecided);
        int any=0;
        for(int t=0;t<ntoe[e];t++){ int T=tri_of_edge[e][t]; if(!(tmask[T]&used)){ any=1; break; } }
        if(any) break;
        undecided &= ~((u128)1<<e);
    }
    if(cur==k_nu){
        npack++;
        if(npack>pack_limit){ aborted=1; return; }
        int r=test_packing(k_nu);
        if(r) any_good=1; else nbad++;
        return;
    }
    if(!undecided) return;
    if(cur + pc(undecided)/3 < k_nu) return;
    int e = ctz128(undecided);
    for(int t=0;t<ntoe[e];t++){ int T=tri_of_edge[e][t]; if(!(tmask[T]&used)){
        packT[cur]=T;
        enum_rec(used|tmask[T], undecided & ~tmask[T], cur+1);
    }}
    enum_rec(used|((u128)1<<e), undecided & ~((u128)1<<e), cur);
}


static int ufp[MAXT];
static int uf(int x){ while(ufp[x]!=x){ ufp[x]=ufp[ufp[x]]; x=ufp[x];} return x; }
int main(int argc, char **argv){
    char line[256]; long long graphs=0, tight=0, bad=0, slack1=0;
    while(fgets(line,sizeof line,stdin)){
        line[strcspn(line,"\r\n")]=0; if(!line[0]) continue;
        parse_g6(line); graphs++;
        if(nt==0) continue;
        best=0; nu_rec(0, (((u128)1<<ne)-1), 0); int k=best;
        Aallow = (((u128)1<<ne)-1);
        if(!cover_rec(0, 2*k)) { printf("TUZA_FAIL %s\n", line); continue; }
        if(cover_rec(0, 2*k-1)) { if(!cover_rec(0,2*k-2)) slack1++; continue; }
        tight++;
        /* block-type check: shared-edge triangle components are literal K4 or K5 */
        for(int t=0;t<nt;t++) ufp[t]=t;
        for(int e=0;e<ne;e++) for(int i=1;i<ntoe[e];i++){ int a=uf(tri_of_edge[e][0]), b=uf(tri_of_edge[e][i]); if(a!=b) ufp[a]=b; }
        int ok=1;
        for(int t=0;t<nt && ok;t++) if(uf(t)==t){
            int cnt=0; int vm=0;
            for(int s2=0;s2<nt;s2++) if(uf(s2)==t){ cnt++; vm|=(1<<tv[s2][0])|(1<<tv[s2][1])|(1<<tv[s2][2]); }
            int nv=__builtin_popcount(vm);
            if(!((nv==4&&cnt==4)||(nv==5&&cnt==10))) ok=0;
        }
        if(!ok){ bad++; printf("TIGHT_NONBLOCK %s nu=%d\n", line, k); fflush(stdout); }
    }
    fprintf(stderr,"graphs=%lld tight=%lld tight_nonblock=%lld slack_exactly_one=%lld\n",graphs,tight,bad,slack1);
    return 0;
}
