#define _POSIX_C_SOURCE 200809L
/* Exact decimal-block multiplication. Computational evidence, not a Lean proof. */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <time.h>
#include <inttypes.h>
static volatile sig_atomic_t stop_requested=0;
static unsigned char ds[1000];
static void stop_handler(int sig) { (void)sig; stop_requested=1; }
static double seconds(void) { struct timespec t; clock_gettime(CLOCK_MONOTONIC,&t);return t.tv_sec+t.tv_nsec/1e9; }
static uint64_t weight(uint32_t x) { return ds[x%1000]+ds[x/1000%1000]+ds[x/1000000]; }
int main(int argc,char **argv) {
    unsigned long parsed=argc>1?strtoul(argv[1],NULL,10):1000;
    if(parsed<1 || parsed>1000000) return 2;
    uint32_t limit=(uint32_t)parsed;
    double max_seconds=argc>2?strtod(argv[2],NULL):1800;
    if(max_seconds<=0 || max_seconds>1800) return 2;
    signal(SIGTERM,stop_handler);signal(SIGINT,stop_handler);
    for(unsigned i=1;i<1000;i++) ds[i]=ds[i/10]+i%10;
    size_t cap=(limit+8)/9+2;
    uint32_t *blocks=calloc(cap,sizeof(uint32_t));if(!blocks) return 3;
    double start=seconds();uint64_t checked=0,hits=0,below=0;
    uint32_t last_u=0,last_s=0;
    printf("{\"type\":\"start\",\"limit\":%u,\"max_seconds\":%.0f,\"memory_bytes\":%zu}\n",limit,max_seconds,cap*sizeof(uint32_t));
    fflush(stdout);
    for(uint32_t u=2;u<=9;u++) {
        size_t len=1;blocks[0]=1;uint32_t residue=1;
        for(uint32_t s=1;s<=limit;s++) {
            uint64_t carry=0;
            for(size_t i=0;i<len;i++) {
                uint64_t v=(uint64_t)blocks[i]*u+carry;
                blocks[i]=(uint32_t)(v%1000000000);carry=v/1000000000;
            }
            if(carry) { if(len>=cap) return 4; blocks[len++]=(uint32_t)carry; }
            residue=residue*u%9;
            last_u=u;last_s=s;
            if(residue==s%9) {
                checked++;uint64_t total=0;
                for(size_t i=0;i<len && total<=s;i++) total+=weight(blocks[i]);
                if(total<=s) {
                    unsigned topdigits=0;for(uint32_t t=blocks[len-1];t;t/=10) topdigits++;
                    printf("{\"type\":\"%s\",\"u\":%u,\"s\":%u,\"digit_sum\":%" PRIu64 ",\"core_digits\":%zu}\n",total==s?"equal":"below",u,s,total,9*(len-1)+topdigits);
                    if(total==s) hits++;else below++;
                    fflush(stdout);
                }
            }
            if(s%100000==0 || s==limit) {
                printf("{\"type\":\"progress\",\"u\":%u,\"s\":%u,\"blocks\":%zu,\"low_block\":%u,\"high_block\":%u,\"elapsed\":%.3f}\n",u,s,len,blocks[0],blocks[len-1],seconds()-start);
                fflush(stdout);
            }
            if(s%1000==0 && (stop_requested || seconds()-start>=max_seconds)) goto done;
        }
    }
done:
    printf("{\"type\":\"finish\",\"complete\":%s,\"last_u\":%u,\"last_s\":%u,\"mod9_checked\":%" PRIu64 ",\"equalities\":%" PRIu64 ",\"below\":%" PRIu64 ",\"elapsed\":%.3f}\n",last_u==9 && last_s==limit?"true":"false",last_u,last_s,checked,hits,below,seconds()-start);
    free(blocks);return 0;
}
