#include <SPI.h>

#define SCK   15  // D13 = pin19 = PortB.5
#define MISO  14  // D12 = pin18 = PortB.4
#define MOSI  16  // D11 = pin17 = PortB.3
#define SS    10  // D10 = pin16 = PortB.2
volatile uint8_t byteCount = 0;
volatile bool dataReady = false;

float data;
uint8_t *ptr = (uint8_t *)&data;

// SPI interrupt routine
ISR (SPI_STC_vect) {
  ptr[byteCount++] = SPDR;    //read one byte form SPI Data Regiser
  if (byteCount == 3) {
    dataReady = true;
  }
}

void setup (void) {
  Serial.begin(115200);
  Serial.println("\nSPI Slave");
  SPCR |= bit(SPE);        // enable SPI slave mode
  pinMode(MISO, OUTPUT);   // set MISO as OUTPUT
  SPI.attachInterrupt();
}

void loop (void) {
  if (dataReady) {
    Serial.println(data, 4);

    
    byteCount = 0;    // reset byteCount and dataReady flag
    dataReady = false;
  }
}
