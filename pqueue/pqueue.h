
#ifndef PQUEUE_H
 #define PQUEUE_H

// Min queue

#include <stdbool.h>
#include <stdlib.h>

typedef struct _pqueue pqueue;

pqueue *pqueue_create(void);
void pqueue_disassemble(pqueue *pq);
void pqueue_destroy(pqueue *pq);

bool pqueue_is_empty(pqueue *pq);
size_t pqueue_size(pqueue *pq);

bool pqueue_enqueue(pqueue *pq, const void *value, int priority);
const void *pqueue_dequeue(pqueue *pq);

int pqueue_next_priority(pqueue *pq);
bool pqueue_set_priority(pqueue *pq, const void *value, int priority);

#endif
