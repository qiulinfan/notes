/*
 * pizza.h -- public interface to pizza delivery library functions.
 *
 */
#pragma once

#include "mutex.h"

extern mutex cout_mutex;

struct location_t {
    unsigned int x;
    unsigned int y;
};

void driver_ready(unsigned int driver, location_t location);
void drive(unsigned int driver, location_t start, location_t end);

void customer_ready(unsigned int customer, location_t location);
void pay(unsigned int customer, unsigned int driver);

void match(unsigned int customer, unsigned int driver);
