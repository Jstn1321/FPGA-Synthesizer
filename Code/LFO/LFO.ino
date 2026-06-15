#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, -1);

#define LFO_RATE_ID  0x0A
#define LFO_DEPTH_ID 0x0B

int smooth_read(int pin) {
    long sum = 0;
    for (int i = 0; i < 16; i++) sum += analogRead(pin);
    return sum / 16;
}

void send_val(byte id, int val) {
    val = constrain(val, 0, 1022);
    Serial.write(0xFF);
    Serial.write(id);
    Serial.write((val >> 8) & 0xFF);
    Serial.write(val & 0xFF);
}

void setup() {
    Serial.begin(115200);
    if (!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) for(;;);
    display.clearDisplay();
    display.display();
}

void loop() {
    int rate  = smooth_read(A0);
    int depth = smooth_read(A1);

    send_val(LFO_RATE_ID,  rate);
    send_val(LFO_DEPTH_ID, depth);

    static unsigned long last_display = 0;
    if (millis() - last_display > 100) {
        last_display = millis();
        display.clearDisplay();
        display.setTextColor(SSD1306_WHITE);

        display.setTextSize(1);
        display.setCursor(0, 0);
        display.print("LFO");

        display.setTextSize(2);
        display.setCursor(0, 16);
        display.print("RATE:");
        display.print(map(rate, 0, 1023, 0, 100));
        display.print("%");

        display.setCursor(0, 36);
        display.print("DEPTH:");
        display.print(map(depth, 0, 1023, 0, 100));
        display.print("%");

        display.display();
    }
}