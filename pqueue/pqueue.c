
#include "pqueue.h"

#include "heap.h"

struct _pqueue {
	heap *h;
};

struct _pq_item {
	int priority;
	const void *data;
};

static int __pq_cmp(const void *a, const void *b);

pqueue *pqueue_create(void)
{
	pqueue *pq = malloc(sizeof(*pq));
	if(!pq) {
		return NULL;
	}

	pq->h = heap_create(__pq_cmp);
	if(!pq->h) {
		free(pq);
		return NULL;
	}

	return pq;
}

void pqueue_disassemble(pqueue *pq)
{
	heap_destroy(pq->h);
	free(pq);
}

bool pqueue_is_empty(pqueue *pq)
{
	return pq && heap_is_empty(pq->h);
}

size_t pqueue_size(pqueue *pq)
{
	return pq && heap_size(pq->h);
}

bool pqueue_enqueue(pqueue *pq, const void *value, int priority)
{
	if(!pq) {
		return false;
	}

	struct _pq_item *added = malloc(sizeof(*added));
	if(!added) {
		return false;
	}

	added->priority = priority;
	added->data = value;

	return heap_add(pq->h, added);
}

const void *pqueue_dequeue(pqueue *pq)
{
	if(!pq) {
		return false;
	}

	struct _pq_item *found = heap_remove_min(pq->h);
	const void *data = found->data;
	free(found);

	return data;
}

int pqueue_next_priority(pqueue *pq)
{
	if(!pq) {
		return 0;
	}

	return ((struct _pq_item *)heap_peek_min(pq->h))->priority;
}

bool pqueue_set_priority(pqueue *pq, const void *value, int priority)
{
	if(!pq) {
		return false;
	}
}


static int __pq_cmp(const void *a, const void *b)
{
	return ((struct _pq_item *)a)->priority - ((struct _pq_item *)b)->priority;
}

