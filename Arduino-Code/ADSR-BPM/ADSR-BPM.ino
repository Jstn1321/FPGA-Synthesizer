#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, -1);

#define ATTACK_ID  0x01
#define DECAY_ID   0x02
#define SUSTAIN_ID 0x03
#define RELEASE_ID 0x04
#define BPM_ID     0x05

void setup() {
    Serial.begin(115200);
    if (!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) {
        for(;;);
    }
    display.clearDisplay();
    display.display();
}

int smooth_read(int pin) {
    long sum = 0;
    for (int i = 0; i < 16; i++) {
        sum += analogRead(pin);
    }
    return sum / 16;
}

void loop() {
    int bpm_raw = smooth_read(A6);
    int bpm     = map(bpm_raw, 0, 1023, 40, 240);

    send_val(ATTACK_ID,  smooth_read(A0));
    send_val(DECAY_ID,   smooth_read(A1));
    send_val(SUSTAIN_ID, smooth_read(A2));
    send_val(RELEASE_ID, smooth_read(A3));
    send_val(BPM_ID,     bpm_raw);

    static unsigned long last_display = 0;
    if (millis() - last_display > 100) {
        last_display = millis();
        display.clearDisplay();
        display.setTextColor(SSD1306_WHITE);
        display.setTextSize(1);
        display.setCursor(45, 4);
        display.print("BPM");
        display.setTextSize(4);
        display.setCursor(bpm >= 100 ? 16 : 28, 24);
        display.print(bpm);
        display.display();
    }
}

void send_val(byte id, int val) {
    val = constrain(val, 0, 1022); 
    Serial.write(0xFF);
    Serial.write(id);
    Serial.write((val >> 8) & 0xFF);
    Serial.write(val & 0xFF);
}