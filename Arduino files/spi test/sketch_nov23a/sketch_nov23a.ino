#define SCK_PIN   13  // D13 = pin19 = PortB.5
#define MISO_PIN  12  // D12 = pin18 = PortB.4
#define MOSI_PIN  11  // D11 = pin17 = PortB.3
#define SS_PIN    10  // D10 = pin16 = PortB.2

#define UL unsigned long
#define US unsigned short

void SlaveInit(void) {
  pinMode(SCK_PIN, INPUT);
  pinMode(MOSI_PIN, INPUT);
  pinMode(MISO_PIN, OUTPUT);
  pinMode(SS_PIN, INPUT);
}

unsigned short Read2Bytes(void) {
    union {
    unsigned short svar;
    byte c[2];
  } w;
  
  while(!(SPSR & (1<<SPIF))) ;
  w.c[1] = SPDR;
  while(!(SPSR & (1<<SPIF))) ;
  w.c[0] = SPDR;             
  return (w.svar);
}

unsigned short Read1Bytes(void) {
    union {
    unsigned short svar;
    byte c[2];
  } w;
  
  while(!(SPSR & (1<<SPIF))) ;
  w.c[0] = SPDR;      
  return (w.svar);
}

void setup() {
  Serial.begin(115200);
  SlaveInit();
  delay(10);
  Serial.println("SPI port reader v0.1"); 
}

void loop() {
  unsigned short word1;
  byte flag1;

    while (digitalRead(SS_PIN)==1) {}
    
    SPCR = (1<<SPE)|(0<<DORD)|(0<<MSTR)|(0<<CPOL)|(0<<CPHA)|(0<<SPR1)|(1<<SPR0); // SPI on
    word1 = Read2Bytes(); 
    SPCR = (0<<SPE)|(0<<DORD)|(0<<MSTR)|(0<<CPOL)|(0<<CPHA)|(0<<SPR1)|(1<<SPR0);  // SPI off
  
    Serial.print(word1);
    Serial.print('\n');
    for(int k=0; k<24; k++)
    {
      SPDR= 011;
    }

}
