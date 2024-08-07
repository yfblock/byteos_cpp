#pragma once
#include <driver.h>
#include <interrupt.h>
#define DEFINE_SERIAL(name) serial_dri_t name
/**
 * Serial Driver Interface
 */
typedef struct serial_dri {
    // Get a character from the serial.
    char (*getchar)();
    // Put a character to the serial.
    void (*putchar)(char u8);
} serial_dri_t;
