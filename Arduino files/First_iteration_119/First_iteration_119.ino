#define SCK_PIN   13  // D13 = pin19 = PortB.5
#define MISO_PIN  12  // D12 = pin18 = PortB.4
#define MOSI_PIN  11  // D11 = pin17 = PortB.3
#define SS_PIN    10  // D10 = pin16 = PortB.2

#define UL unsigned long
#define US unsigned short


uint8_t currentX, currentY;
uint8_t levelMap[3][16][16] = {0};
uint8_t rockCount;
const float levelDifficulty = 0.001;
float ladderChance;
uint8_t level=1;
uint8_t i,j,l;
uint8_t maxDiagonalLength = 7;
float baseChance;
float chanceModifier;
uint8_t rockChance = 10;
uint8_t goldChance = 5;
float diamondOreChance = 5;
float diamondChanceModifier=0.02;
float diamondChance;

//000  Empty floor tile
//001  Rocks
//010  Gold ore
//011  Boundary
//100  Diamond ore
//101  Ladder
//111  Rock with ladder
//110  Empty

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

void setup() 
{
  Serial.begin(115200);
  SlaveInit();
  delay(10);
  Serial.println("SPI port reader v0.1"); 
  
}

void loop() 
{
  unsigned short word1;
  byte flag1;
  for(l=0; l<3; l++)
  {
    createLevel();
    level++;
  }
  while(1){
    while (digitalRead(SS_PIN)==1) {}
    
    SPCR = (1<<SPE)|(0<<DORD)|(0<<MSTR)|(0<<CPOL)|(0<<CPHA)|(0<<SPR1)|(1<<SPR0); // SPI on
    word1 = Read2Bytes(); 
    SPCR = (0<<SPE)|(0<<DORD)|(0<<MSTR)|(0<<CPOL)|(0<<CPHA)|(0<<SPR1)|(1<<SPR0);  // SPI off
  
    Serial.print(word1);
    Serial.print('\n');
      SPDR= 011;
  }
}
void createLevel()
{
  wipeMap();
  cornerBoundaryRT(random(2,maxDiagonalLength)); //create right top boundary
  cornerBoundaryLT(random(2,maxDiagonalLength)); //create left top boundary
  cornerBoundaryLB(random(2,maxDiagonalLength)); //create left bottom boundary
  cornerBoundaryRB(random(2,maxDiagonalLength)); //create right bottom boundary
  generateOres();
  generateLadder();
  Serial.println("Map generated");
  diamondChance = calculateDiamondChance();
  if(((float)random(0,100))/100<diamondChance)
  {
     centerDiamond(6, 011); 
  }
  levelMap[level][3][8]=000;
  printMap();
}
void cornerBoundaryLT(int diagonalLength) //This function initialises the boundary for the top left corner
{
  int x,y; //placeholder integers
  j=0; //reset iteration integer
  for (i=diagonalLength; i>0; i--) //do the following for the length of the diagonal
  {
    for(j=0; j<i; j++) // j<i with i-- and j++ leads to a triangle shape
    {
      y=j;
      x=0+i-j-1;
      levelMap[level][x][y]=011; //set the correct value to the boundary tile value
    }
  }
}

void cornerBoundaryRT(int diagonalLength)
{
  int x,y;
  j=0;
  for (i=diagonalLength; i>0; i--)
  {
    for(j=0; j<i; j++)
    {
      y=j;
      x=16-i+j;
      levelMap[level][y][x]=011;
    }
  }
}
void cornerBoundaryLB(int diagonalLength)
{
  int x,y;
  j=0;
  for (i=diagonalLength; i>0; i--)
  {
    for(j=0; j<i; j++)
    {
      y=15-j;
      x=-1+i-j;
      levelMap[level][y][x]=011;
    }
  }
}
void cornerBoundaryRB(int diagonalLength)
{
  int x,y;
  j=0;
  for (i=diagonalLength; i>0; i--)
  {
    for(j=0; j<i; j++)
    {
      y=15-j;
      x=16-i+j;
      levelMap[level][x][y]=011;
    }
  }
}
void printMap()
{
  for (int i=0; i<16; i++)
  {
    for (int j=0; j<16; j++)
    {
      if(levelMap[level][i][j]==000)
      {
        Serial.print("000 ");
      }
      else if(levelMap[level][i][j]==001)
      {
        Serial.print("001 ");
      }
      else if(levelMap[level][i][j]==010)
      {
        Serial.print("010 ");
      }
      else if(levelMap[level][i][j]==011)
      {
        Serial.print(" X  ");
      }
      else if(levelMap[i][j]==100)
      {
        Serial.print("100 ");
      }
      else if(levelMap[level][i][j]==101)
      {
        Serial.print("101 ");
      }
      else if(levelMap[level][i][j]==110)
      {
        Serial.print("110 ");
      }
      else if(levelMap[level][i][j]==111)
      {
        Serial.print("111 ");
      }
      delay(10);
    }
    Serial.println(" ");
  }
}
void generateOres()
{
  rockCount=0;
  for (i=0; i<16; i++)
  {
    for(j=0; j<16; j++)
    {
      if(levelMap[level][i][j]!=011)
      {
        if(random(0,100)<rockChance)
        {
          levelMap[level][i][j] = 001;
          rockCount++;
        }
        else if(random(0,100)<goldChance)
        {
          levelMap[level][i][j] = 010;
        }
        else if(random(0,100)<diamondOreChance)
        {
          levelMap[level][i][j] = 100;
        }
      }
    }
  }
}
void generateLadder()
{
  int k=0;
  baseChance = 1/(float)rockCount;
  while(k<2)
  {

    for(i=0; i<16; i++)
    {
      for(j=0; j<16; j++)
      {
        ladderChance = baseChance - (level * levelDifficulty);
        if(levelMap[level][i][j]==001)
        {
          chanceModifier = (float)random(0,100)/100;
          if(chanceModifier<ladderChance)
          {
            levelMap[level][i][j]=111;
            k++;
            Serial.println("I made a ladder!");
          }
        }
      }
    }
  }
}
void wipeMap()
{
  for(i=0; i<16; i++)
  {
    for(j=0; j<16; j++)
    {
      levelMap[level][i][j]=0;
    }
  }
}

void centerDiamond(int diamondSize, uint8_t tiletype)
{
  for (i=0; i<diamondSize; i++)
  {
    for (j=0;j<=2*i-1; j++)
    {
      levelMap[level][8-diamondSize+i][8-i+j-1] = tiletype;
    }
  }
  for (i=0; i<diamondSize; i++)
  {
    for (j=2*(diamondSize-i);j>0; j--)
    {
      levelMap[level][8+i][8+i-diamondSize+j-2] = tiletype;
    }
  }
}

float calculateDiamondChance()
{
  return level*diamondChanceModifier;
}
