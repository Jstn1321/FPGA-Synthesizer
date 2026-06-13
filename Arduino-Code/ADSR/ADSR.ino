#include <SPI.h>
#include <Adafruit_GFX.h>
#include <Adafruit_ST7735.h>

#define TFT_CS   10
#define TFT_DC    9
#define TFT_RST   8

Adafruit_ST7735 tft = Adafruit_ST7735(TFT_CS, TFT_DC, TFT_RST);

#define ATTACK_ID  0x01
#define DECAY_ID   0x02
#define SUSTAIN_ID 0x03
#define RELEASE_ID 0x04
#define BPM_ID     0x05

int smooth_read(int pin) {
    long sum = 0;
    for(int i = 0; i < 16; i++) {
        sum += analogRead(pin);
    }
    return sum / 16;
}

void drawStaticUI() {
    tft.fillScreen(ST77XX_BLACK);

    tft.drawFastHLine(5, 115, 150, ST77XX_WHITE);
    tft.drawFastVLine(5, 25, 90, ST77XX_WHITE);

    tft.setTextColor(ST77XX_WHITE);
    tft.setTextSize(1);
}

void setup() {
    Serial.begin(115200);

    tft.initR(INITR_BLACKTAB);
    tft.setRotation(1);

    tft.initR(INITR_BLACKTAB);
    tft.setRotation(1);
    drawStaticUI();
}

void loop() {

    int attack_raw  = smooth_read(A0);
    int decay_raw   = smooth_read(A1);
    int sustain_raw = smooth_read(A2);
    int release_raw = smooth_read(A3);
    int bpm_raw     = smooth_read(A6);

    int bpm = map(bpm_raw, 0, 1023, 40, 240);

    send_val(ATTACK_ID, attack_raw);
    send_val(DECAY_ID, decay_raw);
    send_val(SUSTAIN_ID, sustain_raw);
    send_val(RELEASE_ID, release_raw);
    send_val(BPM_ID, bpm_raw);

    static unsigned long last_draw = 0;

if (millis() - last_draw > 100) {

    last_draw = millis();

    tft.fillRect(0, 0, 160, 24, ST77XX_BLACK);
    tft.fillRect(6, 26, 149, 88, ST77XX_BLACK);

    int attack  = map(attack_raw,  0, 1023, 10, 40);
    int decay   = map(decay_raw,   0, 1023, 10, 30);
    int sustain = map(sustain_raw, 0, 1023, 10, 70);
    int release = map(release_raw, 0, 1023, 10, 40);

    tft.setCursor(0,0);
    tft.print("A:");
    tft.print(attack_raw);

    tft.setCursor(80,0);
    tft.print("D:");
    tft.print(decay_raw);

    tft.setCursor(0,12);
    tft.print("S:");
    tft.print(sustain_raw);

    tft.setCursor(80,12);
    tft.print("R:");
    tft.print(release_raw);

    tft.setCursor(120,12);
    tft.print(bpm);

    int x0 = 10;
    int y0 = 115;

    int x1 = x0 + attack;
    int y1 = 30;

    int x2 = x1 + decay;
    int y2 = 115 - sustain;

    int x3 = x2 + 20;
    int y3 = y2;

    int x4 = x3 + release;
    int y4 = 115;

    tft.drawLine(x0,y0,x1,y1,ST77XX_GREEN);
    tft.drawLine(x1,y1,x2,y2,ST77XX_GREEN);
    tft.drawLine(x2,y2,x3,y3,ST77XX_GREEN);
    tft.drawLine(x3,y3,x4,y4,ST77XX_GREEN);
}
}

void send_val(byte id, int val) {

    val = constrain(val,0,1023);

    Serial.write(0xFF);
    Serial.write(id);
    Serial.write((val >> 8) & 0xFF);
    Serial.write(val & 0xFF);
}