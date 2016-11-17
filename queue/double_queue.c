
#include "queue.h"

#include <math.h>
#include <stdlib.h>

queue *queue_create(void)
{
	queue *q = malloc(sizeof(*q));
	if(!q) {
		return NULL;
	}
	q->head = NULL;
	q->tail = NULL;

	return q;
}

void queue_destroy(queue *q)
{
	if(!q) {
		return;
	}
	ll_destroy(q->head);

	free(q);
}

bool queue_is_empty(queue *q)
{
	if(!q || !q->head) {
		return true;
	}
	return false;
}

bool queue_enqueue(queue *q, double data)
{
	if(!q) {
		return false;
	}
	struct llist *new_tail = ll_create(data);
	if(!new_tail) {
		return false;
	}

	if(q->tail) {
		q->tail->next = new_tail;
	} else {
		q->head = new_tail;
	}

	q->tail = new_tail;
	return true;
}

double queue_dequeue(queue *q)
{
	if(queue_is_empty(q)) {
		return 0;
	}

	double value = q->head->data;
	struct llist *tmp = q->head;

	q->head = tmp->next;
	tmp->next = NULL;
	ll_destroy(tmp);

	if(!q->head) {
		q->tail = NULL;
	}

	return value;
}

void queue_flatten(queue **q)
{
	if(!q || queue_is_empty(*q)) {
		return;
	}

	queue *pmt = *q;
	queue *tmp = queue_create();

	size_t n = 0;
	double value;
	size_t queue_size = 1;

	while(n < queue_size) {
		queue_size = 0;

		do {
			value = queue_dequeue(pmt);
			queue_enqueue(tmp, value);
		} while(queue_size++ < n);
		++n;

		while(!queue_is_empty(pmt)) {
			double check = queue_dequeue(pmt);
			if(fabs(value - check) > .001) {
				queue_enqueue(tmp, check);
				++queue_size;
			}
		}
		queue *swap = pmt;
		pmt = tmp;
		tmp = swap;
	}
	queue_destroy(tmp);
	*q = pmt;
}
