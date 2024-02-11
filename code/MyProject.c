unsigned char column[8] = {
    0b11111110,
    0b11111101,
    0b11111011,
    0b11110111,
    0b11101111,
    0b11011111,
    0b10111111,
    0b01111111};


unsigned char mohammed[64] = {


     // M and space
    0b00000000,
    0b00000000,
    0b11111110,
    0b00001000,
    0b00110000,
    0b00001000,
    0b11111110,
    0b00000000,

    // O and space
    0b00000000,
    0b00000000,
    0b01111100,
    0b10000010,
    0b10000010,
    0b01111100,
    0b00000000,
    0b00000000,
    // H and space
    0b00000000,
    0b00000000,
    0b11111110,
    0b00010000,
    0b00010000,
    0b00010000,
    0b11111110,
    0b00000000,

     // A and space
    0b00000000,
    0b00000000,
    0b11111000,
    0b00010100,
    0b00010010,
    0b00010010,
    0b00010100,
    0b11111000,

      // M and space
    0b00000000,
    0b00000000,
    0b11111110,
    0b00001000,
    0b00110000,
    0b00001000,
    0b11111110,
    0b00000000,

      // M and space
    0b00000000,
    0b11111110,
    0b00001000,
    0b00110000,
    0b00001000,
    0b11111110,
    0b00000000,
    0b00000000,
     // E and space
    0b00000000,
    0b00000000,
    0b11111110,
    0b10010010,
    0b10010010,
    0b10010010,
    0b10010010,
    0b00000000,

     // D and space
    0b00000000,
    0b00000000,
    0b11111110,
    0b10000010,
    0b10000010,
    0b10000010,
    0b01111100,
    0b00000000,



};
short c = 0;
short EightStepInRowsArray = 0;
int Repeat_cycles = 0;

void main()
{
    DDRA = 255;
    DDRC = 255;
    while (1)
    {
        for (c = 0; c < 8; c++)
        {
            PORTC = column[c];
            PORTA = mohammed[EightStepInRowsArray + c];
            delay_ms(1);
        }
        Repeat_cycles++;
        if (Repeat_cycles == 200)
        {
            Repeat_cycles = 0;
            EightStepInRowsArray = (EightStepInRowsArray + 8) % 64;
        }
    }

}