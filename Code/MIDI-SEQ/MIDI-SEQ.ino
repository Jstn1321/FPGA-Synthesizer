#include <USBHost_t36.h>
#include <SPI.h>
#include <Adafruit_GFX.h>
#include <Adafruit_ST7735.h>

#define TFT_CS 10
#define TFT_DC  9
#define TFT_RST 8
Adafruit_ST7735 tft = Adafruit_ST7735(TFT_CS, TFT_DC, TFT_RST);

USBHost myusb;
MIDIDevice midi(myusb);

#define COL_BG     0x0841
#define COL_ACCENT 0x07FF
#define COL_GREEN  0x07E0
#define COL_FILL   0x0320
#define COL_WHITE  0xFFFF
#define COL_DIM    0x4208
#define COL_ORANGE 0xFD20
#define COL_PINK   0xF81F
#define COL_RED    0xF800
#define COL_YELLOW 0xFFE0

#define CC_ATTACK    20
#define CC_DECAY     21
#define CC_SUSTAIN   22
#define CC_RELEASE   23

#define CC_BPM       24
#define CC_CUTOFF    25
#define CC_RESONANCE 26
#define CC_LFO_RATE  27
#define CC_LFO_DEPTH 28

#define CC_VOLUME    1

#define ENCODER_CLICK_CC       32
#define ENCODER_SHIFT_CLICK_CC 33

#define ID_ATTACK    0x01
#define ID_DECAY     0x02
#define ID_SUSTAIN   0x03
#define ID_RELEASE   0x04
#define ID_BPM       0x05
#define ID_NOTE      0x06
#define ID_GATE      0x07
#define ID_CUTOFF    0x08
#define ID_RESONANCE 0x09
#define ID_LFO_RATE  0x0A
#define ID_LFO_DEPTH 0x0B
#define ID_SEQ_RUN   0x0D
#define ID_VOLUME    0x0E
#define ID_SEQ_RESET 0x0F

#define PAD_BANK_A_START 36
#define PAD_BANK_B_START 44

#define PAD_OFF    0
#define PAD_RED    1
#define PAD_ORANGE 2
#define PAD_YELLOW 3
#define PAD_GREEN  4
#define PAD_CYAN   5
#define PAD_BLUE   6
#define PAD_PINK   7
#define PAD_WHITE  8

byte seq_notes[16];
bool seq_active[16];
int  edit_step   = 0;
bool seq_running = false;
int  current_note = 60;
bool gate_on      = false;
bool seq_reset = false;

int v_attack = 0, v_decay = 0, v_sustain = 64, v_release = 32;
int v_bpm = 64, v_cutoff = 100, v_resonance = 0;
int v_lfo_rate = 0, v_lfo_depth = 0, v_volume = 64;

int p_attack=-1, p_decay=-1, p_sustain=-1, p_release=-1;
int p_bpm=-1, p_note=-999, p_step=-1, p_volume=-1;
bool p_gate=true, p_running=false;
int p_cutoff=-1, p_resonance=-1, p_lfo_rate=-1;

const char* NOTE_NAMES[] = {"C","C#","D","D#","E","F","F#","G","G#","A","A#","B"};

void send_val(byte id, int val_127) {
    int val = constrain(val_127 * 8, 0, 1022);
    Serial1.write(0xFF);
    Serial1.write(id);
    Serial1.write((val >> 8) & 0xFF);
    Serial1.write(val & 0xFF);
}

void send_raw(byte id, int val) {
    val = constrain(val, 0, 1022);
    Serial1.write(0xFF);
    Serial1.write(id);
    Serial1.write((val >> 8) & 0xFF);
    Serial1.write(val & 0xFF);
}

void enableDAWMode() {
    byte sysex[] = {0x00, 0x20, 0x6B, 0x7F, 0x42,
                    0x02, 0x02, 0x40, 0x6A, 0x21};
    midi.sendSysEx(10, sysex, true);
    delay(100);
}

void setPadColor(int pad_index, byte r, byte g, byte b) {
    byte id = pad_index < 8 ? 0x04 + pad_index : 0x14 + (pad_index - 8);
    byte sysex[] = {0x00, 0x20, 0x6B, 0x7F, 0x42,
                    0x02, 0x02, 0x16, id, r, g, b};
    midi.sendSysEx(12, sysex, true);
}

void updatePadLights() {
    for (int i = 0; i < 16; i++) {
        if (i == edit_step)
            setPadColor(i, 127, 127, 127);          
        else if (seq_active[i])
            setPadColor(i, seq_running ? 0 : 0,
                           seq_running ? 127 : 0,
                           seq_running ? 0 : 127);  
        else
            setPadColor(i, 0, 0, 0);                
    }
}

void drawBar(int x, int y, int w, int h, int val, uint16_t color) {
    int filled = map(val, 0, 127, 0, w);
    tft.fillRect(x, y, w, h, COL_DIM);
    if (filled > 0) tft.fillRect(x, y, filled, h, color);
    tft.drawRect(x, y, w, h, COL_WHITE);
}

void drawEnvelope() {
    int ex = 2, ey = 118, ew = 156, eh = 10;
    tft.fillRect(ex, ey, ew, eh, COL_BG);

    int ax = map(v_attack,  0, 127, 3, 35);
    int dx = map(v_decay,   0, 127, 3, 28);
    int sy = map(v_sustain, 0, 127, 2, eh - 4);
    int rx = map(v_release, 0, 127, 3, 35);
    int hold = 18;

    int x0 = ex+1,     y0 = ey+eh-2;
    int x1 = x0+ax,    y1 = ey+2;
    int x2 = x1+dx,    y2 = ey+eh-2-sy;
    int x3 = x2+hold,  y3 = y2;
    int x4 = min(x3+rx, ex+ew-2), y4 = y0;

    tft.fillTriangle(x0,y0,x1,y1,x1,y0, COL_FILL);
    tft.fillRect(x1,y2,dx,y0-y2, COL_FILL);
    tft.fillRect(x2,y2,hold,y0-y2, COL_FILL);
    tft.fillTriangle(x3,y3,x4,y4,x3,y4, COL_FILL);

    tft.drawLine(x0,y0,x1,y1,COL_GREEN);
    tft.drawLine(x1,y1,x2,y2,COL_GREEN);
    tft.drawLine(x2,y2,x3,y3,COL_GREEN);
    tft.drawLine(x3,y3,x4,y4,COL_GREEN);
}

void drawStaticUI() {
    tft.fillScreen(COL_BG);

    tft.fillRect(0, 0, 160, 12, COL_ACCENT);
    tft.setTextColor(COL_BG); tft.setTextSize(1);
    tft.setCursor(3, 2);  tft.print("FPGA SYNTH");
    tft.setCursor(95, 2); tft.print("MiniLab 3");


    tft.setTextColor(COL_ACCENT); tft.setTextSize(1);
    tft.setCursor(2, 15); tft.print("A");
    tft.setCursor(2, 27); tft.print("D");
    tft.setCursor(2, 39); tft.print("S");
    tft.setCursor(2, 51); tft.print("R");


    tft.setTextColor(COL_ORANGE);
    tft.setCursor(2, 64); tft.print("BPM");


    tft.setTextColor(COL_GREEN);
    tft.setCursor(84, 64); tft.print("VOL");


    tft.setTextColor(COL_PINK);
    tft.setCursor(95, 76); tft.print("NOTE");


    tft.setTextColor(COL_DIM);
    tft.setCursor(2, 76); tft.print("SEQ");


    tft.setTextColor(COL_DIM);

    tft.setTextColor(COL_DIM);


    tft.setTextColor(COL_YELLOW);
    tft.setCursor(2, 92); tft.print("CUT");
    tft.setCursor(54, 92); tft.print("RES");
    tft.setTextColor(COL_PINK);
    tft.setCursor(106, 92); tft.print("LFO");

    tft.setTextColor(COL_DIM);
    tft.setCursor(2, 108); tft.print("STEP:");
}

void updateDisplay() {
    bool env_dirty = false;


    if (v_cutoff != p_cutoff) {
        drawBar(20, 99, 30, 6, v_cutoff, COL_YELLOW);
        p_cutoff = v_cutoff;
    }
    if (v_resonance != p_resonance) {
        drawBar(72, 99, 30, 6, v_resonance, COL_YELLOW);
        p_resonance = v_resonance;
    }
    if (v_lfo_rate != p_lfo_rate) {
        drawBar(124, 99, 34, 6, v_lfo_rate, COL_PINK);
        p_lfo_rate = v_lfo_rate;
    }

    if (v_attack  != p_attack)  { drawBar(10,14,148,8,v_attack,  COL_ACCENT); p_attack=v_attack;   env_dirty=true; }
    if (v_decay   != p_decay)   { drawBar(10,26,148,8,v_decay,   COL_ACCENT); p_decay=v_decay;     env_dirty=true; }
    if (v_sustain != p_sustain) { drawBar(10,38,148,8,v_sustain, COL_ACCENT); p_sustain=v_sustain; env_dirty=true; }
    if (v_release != p_release) { drawBar(10,50,148,8,v_release, COL_ACCENT); p_release=v_release; env_dirty=true; }

    if (v_bpm != p_bpm) {
        tft.fillRect(26, 62, 54, 10, COL_BG);
        tft.setTextColor(COL_ORANGE); tft.setTextSize(1);
        tft.setCursor(26, 63);
        tft.print(map(v_bpm, 0, 127, 40, 240));
        tft.print(" BPM");
        p_bpm = v_bpm;
    }


    if (v_volume != p_volume) {
        drawBar(108, 62, 50, 8, v_volume, COL_GREEN);
        p_volume = v_volume;
    }


    if (seq_running != p_running || seq_reset) {
        tft.fillRect(26, 74, 58, 10, COL_BG);
        tft.setTextColor(seq_reset ? COL_RED : (seq_running ? COL_GREEN : COL_DIM));
        tft.setTextSize(1);
        tft.setCursor(26, 75);
        if (seq_reset) {
            tft.print("RESET");
            seq_reset = false;
        } else {
            tft.print(seq_running ? "RUNNING" : "STOPPED");
        }
        p_running = seq_running;
    }


    if (current_note != p_note || gate_on != p_gate) {
        tft.fillRect(120, 74, 38, 10, COL_BG);
        tft.setTextColor(gate_on ? COL_PINK : COL_DIM);
        tft.setTextSize(1);
        tft.setCursor(120, 75);
        tft.print(NOTE_NAMES[current_note % 12]);
        tft.print(current_note / 12 - 1);
        p_note = current_note;
        p_gate = gate_on;
    }

    if (edit_step != p_step) {
        tft.fillRect(60, 108, 98, 8, COL_BG);
        tft.setTextSize(1);
        tft.setCursor(60, 108);
        tft.setTextColor(COL_WHITE);
        tft.print("S");
        tft.print(edit_step + 1);
        tft.print(":");
        tft.print(NOTE_NAMES[seq_notes[edit_step] % 12]);
        tft.print(seq_notes[edit_step] / 12 - 1);
        p_step = edit_step;
    }

    if (env_dirty) drawEnvelope();
}

void setup() {
    Serial1.begin(115200);
    myusb.begin();

    tft.initR(INITR_BLACKTAB);
    tft.setRotation(1);
    drawStaticUI();

    for (int i = 0; i < 16; i++) {
        seq_notes[i]  = 60;
        seq_active[i] = true;
    }
    enableDAWMode();
    send_val(ID_SUSTAIN, v_sustain);
    updatePadLights();
}

void loop() {
    myusb.Task();

    static int  p_edit_step        = -1;
    static bool p_seq_running_leds = false;
    if (edit_step != p_edit_step || seq_running != p_seq_running_leds) {
        updatePadLights();
        p_edit_step        = edit_step;
        p_seq_running_leds = seq_running;
    }


    static bool was_connected = false;
    if (midi && !was_connected) {
        was_connected = true;
        enableDAWMode();
        tft.fillRect(130, 2, 28, 8, COL_GREEN);
        tft.setTextColor(COL_BG);
        tft.setCursor(132, 3);
        tft.print("MIDI");
        updatePadLights();
    } else if (!midi && was_connected) {
        was_connected = false;
        tft.fillRect(130, 2, 28, 8, COL_RED);
        tft.setTextColor(COL_BG);
        tft.setCursor(132, 3);
        tft.print("----");
    }

    if (midi.read()) {
        byte type  = midi.getType();
        byte data1 = midi.getData1();
        byte data2 = midi.getData2();


        if (type == 0x90 && data2 > 0 && midi.getChannel() == 1) {
            current_note         = data1;
            gate_on              = true;
            seq_notes[edit_step] = data1;
            send_raw(ID_NOTE, data1);
            send_val(ID_GATE, 127);
        }

        else if ((type == 0x80 || (type == 0x90 && data2 == 0)) && midi.getChannel() == 1) {
            gate_on = false;
            send_val(ID_GATE, 0);
        }

        else if (type == 0xB0 && data1 >= 40 && data1 <= 55 && data2 > 63) {
            edit_step = data1 - 40;
        }


        else if (type == 0xB0) {
            int raw = data2;
            switch (data1) {
                case CC_ATTACK:    v_attack    = raw; send_val(ID_ATTACK,    raw); break;
                case CC_DECAY:     v_decay     = raw; send_val(ID_DECAY,     raw); break;
                case CC_SUSTAIN:   v_sustain   = raw; send_val(ID_SUSTAIN,   raw); break;
                case CC_RELEASE:   v_release   = raw; send_val(ID_RELEASE,   raw); break;
                case CC_BPM:       v_bpm       = raw; send_val(ID_BPM,       raw); break;
                case CC_CUTOFF:    v_cutoff    = raw; send_val(ID_CUTOFF,    raw); break;
                case CC_RESONANCE: v_resonance = raw; send_val(ID_RESONANCE, raw); break;
                case CC_LFO_RATE:  v_lfo_rate  = raw; send_val(ID_LFO_RATE,  raw); break;
                case CC_LFO_DEPTH: v_lfo_depth = raw; send_val(ID_LFO_DEPTH, raw); break;
                case CC_VOLUME:    v_volume    = raw; send_val(ID_VOLUME,    raw); break;
                case ENCODER_CLICK_CC:
                  if (data2 > 63) {
                      seq_running = !seq_running;
                      send_val(ID_SEQ_RUN, seq_running ? 127 : 0);
                  }
                  break;

                case ENCODER_SHIFT_CLICK_CC:
                  if (data2 > 63) {
                      for (int i = 0; i < 16; i++) {
                          seq_notes[i]  = 60;
                          seq_active[i] = true;
                      }
                      edit_step   = 0;
                      seq_running = false;
                      seq_reset = true;
                      send_val(ID_SEQ_RUN,   0);
                      send_val(ID_SEQ_RESET, 127);
                      p_step    = -1; 
                      p_running = !seq_running;  
                      updatePadLights();  
                  }
                  break;
            }
        }
    }

    static unsigned long last = 0;
    if (millis() - last > 50) {
        last = millis();
        updateDisplay();
    }
}