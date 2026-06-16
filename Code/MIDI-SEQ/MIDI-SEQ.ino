#include <USBHost_t36.h>
#include <SPI.h>
#include <Adafruit_GFX.h>
#include <Adafruit_ST7735.h>

// Screen 1 — ADSR, BPM, VOL, NOTE
#define TFT1_CS  10
#define TFT1_DC   9
#define TFT1_RST  8
Adafruit_ST7735 tft1 = Adafruit_ST7735(TFT1_CS, TFT1_DC, TFT1_RST);

// Screen 2 — Sequencer
#define TFT2_CS  7
#define TFT2_DC  6
#define TFT2_RST 5
Adafruit_ST7735 tft2 = Adafruit_ST7735(TFT2_CS, TFT2_DC, TFT2_RST);

USBHost myusb;
MIDIDevice midi(myusb);

// Colors
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

// CC numbers
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

// Param IDs
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
#define ID_WRITE_STEP   0x10
#define ID_WRITE_NOTE   0x11
#define ID_ACTIVE_HI    0x12
#define ID_ACTIVE_LO    0x13

// State
byte seq_notes[16];
bool seq_active[16];
int  edit_step    = 0;
bool seq_running  = false;
int  current_note = 60;
bool gate_on      = false;
bool seq_reset    = false;

int v_attack = 0, v_decay = 0, v_sustain = 64, v_release = 32;
int v_bpm = 64, v_cutoff = 0, v_resonance = 0;
int v_lfo_rate = 0, v_lfo_depth = 0, v_volume = 64;

// Previous values
int p_attack=-1, p_decay=-1, p_sustain=-1, p_release=-1;
int p_bpm=-1, p_note=-999, p_volume=-1;
bool p_gate=true, p_running=false;
int p_step=-1;
bool p_seq_reset = false;

const char* NOTE_NAMES[] = {"C","C#","D","D#","E","F","F#","G","G#","A","A#","B"};

// ─── UART to FPGA ────────────────────────────────────────────────────────────

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

// ─── Screen 1 — Sound parameters ─────────────────────────────────────────────

// Draw a vertical bar (for ADSR)
void drawVBar(Adafruit_ST7735 &t, int x, int y, int w, int h, int val, uint16_t color) {
    int filled = map(val, 0, 127, 0, h);
    t.fillRect(x, y, w, h, COL_DIM);
    if (filled > 0) t.fillRect(x, y + h - filled, w, filled, color);
    t.drawRect(x, y, w, h, COL_WHITE);
}

void drawEnvelope1() {
    int ex = 2, ey = 28, ew = 156, eh = 90;
    tft1.fillRect(ex, ey, ew, eh, COL_BG);
    tft1.drawRect(ex, ey, ew, eh, COL_DIM);

    int ax = map(v_attack,  0, 127, 3, ew/4);
    int dx = map(v_decay,   0, 127, 3, ew/4);
    int sy = map(v_sustain, 0, 127, 4, eh-6);
    int rx = map(v_release, 0, 127, 3, ew/4);
    int hold = ew/6;

    int x0 = ex+2,     y0 = ey+eh-3;
    int x1 = x0+ax,    y1 = ey+3;
    int x2 = x1+dx,    y2 = ey+eh-3-sy;
    int x3 = x2+hold,  y3 = y2;
    int x4 = min(x3+rx, ex+ew-3), y4 = y0;

    // filled area
    tft1.fillTriangle(x0,y0, x1,y1, x1,y0, COL_FILL);
    if (x2 > x1) tft1.fillRect(x1, y2, x2-x1, y0-y2, COL_FILL);
    if (x3 > x2) tft1.fillRect(x2, y2, x3-x2, y0-y2, COL_FILL);
    tft1.fillTriangle(x3,y3, x4,y4, x3,y4, COL_FILL);

    // outline — thicker by drawing twice offset by 1
    tft1.drawLine(x0,y0, x1,y1, COL_GREEN);
    tft1.drawLine(x0,y0-1, x1,y1+1, COL_GREEN);
    tft1.drawLine(x1,y1, x2,y2, COL_GREEN);
    tft1.drawLine(x1,y1+1, x2,y2-1, COL_GREEN);
    tft1.drawLine(x2,y2, x3,y3, COL_GREEN);
    tft1.drawLine(x2,y2-1, x3,y3-1, COL_GREEN);
    tft1.drawLine(x3,y3, x4,y4, COL_GREEN);
    tft1.drawLine(x3,y3-1, x4,y4+1, COL_GREEN);

    // ADSR labels on graph
    tft1.setTextColor(COL_ACCENT); tft1.setTextSize(1);
    tft1.setCursor(x0+2,     y0-10); tft1.print("A");
    tft1.setCursor(x1+2,     y1+2);  tft1.print("D");
    tft1.setCursor(x2+2,     y2-10); tft1.print("S");
    tft1.setCursor(x3+2,     y3+2);  tft1.print("R");
}

void drawStaticUI1() {
    tft1.fillScreen(COL_BG);

    // Title bar
    tft1.fillRect(0, 0, 160, 12, COL_ACCENT);
    tft1.setTextColor(COL_BG); tft1.setTextSize(1);
    tft1.setCursor(3, 2); tft1.print("FPGA SYNTH");

    // Top info strip labels
    tft1.setTextColor(COL_ORANGE);
    tft1.setCursor(2, 120); tft1.print("A:");
    tft1.setCursor(40, 120); tft1.print("D:");
    tft1.setCursor(78, 120); tft1.print("S:");
    tft1.setCursor(116, 120); tft1.print("R:");

    // BPM VOL NOTE in title bar right side
    tft1.setTextColor(COL_BG);
    tft1.setCursor(80, 2); tft1.print("BPM:--- VOL");
}

void updateDisplay1() {
    bool env_dirty = false;

    if (v_attack  != p_attack)  { env_dirty=true; p_attack=v_attack;   }
    if (v_decay   != p_decay)   { env_dirty=true; p_decay=v_decay;     }
    if (v_sustain != p_sustain) { env_dirty=true; p_sustain=v_sustain; }
    if (v_release != p_release) { env_dirty=true; p_release=v_release; }

    // ADSR numbers at bottom
    if (env_dirty) {
        tft1.fillRect(0, 118, 160, 10, COL_BG);
        tft1.setTextColor(COL_ORANGE); tft1.setTextSize(1);
        tft1.setCursor(2,  119); tft1.print("A:"); tft1.print(v_attack);
        tft1.setCursor(40, 119); tft1.print("D:"); tft1.print(v_decay);
        tft1.setCursor(78, 119); tft1.print("S:"); tft1.print(v_sustain);
        tft1.setCursor(116,119); tft1.print("R:"); tft1.print(v_release);
        drawEnvelope1();
    }

    // BPM in title bar
    if (v_bpm != p_bpm) {
        tft1.fillRect(80, 2, 40, 8, COL_ACCENT);
        tft1.setTextColor(COL_BG); tft1.setTextSize(1);
        tft1.setCursor(80, 3);
        tft1.print(map(v_bpm, 0, 127, 40, 240));
        tft1.print("BPM");
        p_bpm = v_bpm;
    }

    // VOL in title bar
    if (v_volume != p_volume) {
        tft1.fillRect(122, 2, 36, 8, COL_ACCENT);
        tft1.setTextColor(COL_BG); tft1.setTextSize(1);
        tft1.setCursor(122, 3);
        tft1.print("V:");
        tft1.print(map(v_volume, 0, 127, 0, 100));
        tft1.print("%");
        p_volume = v_volume;
    }

    // Note — below title, above envelope
    if (current_note != p_note || gate_on != p_gate) {
        tft1.fillRect(0, 13, 160, 14, COL_BG);
        tft1.setTextSize(1);
        tft1.setCursor(2, 15);
        tft1.setTextColor(gate_on ? COL_PINK : COL_DIM);
        tft1.print("NOTE: ");
        tft1.print(NOTE_NAMES[current_note % 12]);
        tft1.print(current_note / 12 - 1);
        tft1.print(gate_on ? "  [ON]" : "  [--]");
        p_note = current_note;
        p_gate = gate_on;
    }
}

void sendActiveSteps() {
    uint16_t mask = 0;

    for (int i = 0; i < 16; i++) {
        if (seq_active[i])
            mask |= (1 << i);
    }

    Serial1.write(0xFF);
    Serial1.write(ID_ACTIVE_HI);
    Serial1.write(0);
    Serial1.write((mask >> 8) & 0xFF);

    Serial1.write(0xFF);
    Serial1.write(ID_ACTIVE_LO);
    Serial1.write(0);
    Serial1.write(mask & 0xFF);
}

// ─── Screen 2 — Sequencer ────────────────────────────────────────────────────

void drawStaticUI2() {
    tft2.fillScreen(COL_BG);

    // Title
    tft2.fillRect(0, 0, 160, 12, COL_GREEN);
    tft2.setTextColor(COL_BG); tft2.setTextSize(1);
    tft2.setCursor(3, 2); tft2.print("SEQUENCER");

    // Status label
    tft2.setTextColor(COL_DIM);
    tft2.setCursor(2, 15); tft2.print("STATUS:");

    // Step label
    tft2.setCursor(2, 27); tft2.print("EDIT:");

    // Grid label
    tft2.setCursor(2, 40); tft2.print("STEPS 1-8:");
    tft2.setCursor(2, 80); tft2.print("STEPS 9-16:");
}

void drawSeqGrid() {
    // Top row — steps 1-8
    for (int i = 0; i < 8; i++) {
        int x = 2 + i * 19;
        int y = 50;
        uint16_t col;
        if (i == edit_step)
            col = COL_WHITE;
        else if (seq_active[i])
            col = seq_running ? COL_GREEN : COL_ACCENT;
        else
            col = COL_DIM;

        tft2.fillRect(x, y, 17, 24, col);
        tft2.setTextColor(COL_BG);
        tft2.setTextSize(1);
        tft2.setCursor(x+2, y+2);
        tft2.print(NOTE_NAMES[seq_notes[i] % 12]);
        tft2.setCursor(x+2, y+12);
        tft2.print(seq_notes[i] / 12 - 1);
    }

    // Bottom row — steps 9-16
    for (int i = 0; i < 8; i++) {
        int x = 2 + i * 19;
        int y = 90;
        uint16_t col;
        if (i + 8 == edit_step)
            col = COL_WHITE;
        else if (seq_active[i + 8])
            col = seq_running ? COL_GREEN : COL_ACCENT;
        else
            col = COL_DIM;

        tft2.fillRect(x, y, 17, 24, col);
        tft2.setTextColor(COL_BG);
        tft2.setTextSize(1);
        tft2.setCursor(x+2, y+2);
        tft2.print(NOTE_NAMES[seq_notes[i+8] % 12]);
        tft2.setCursor(x+2, y+12);
        tft2.print(seq_notes[i+8] / 12 - 1);
    }
}

void updateDisplay2() {
    // Status
    if (seq_running != p_running || seq_reset != p_seq_reset) {
        tft2.fillRect(54, 13, 104, 10, COL_BG);
        tft2.setTextSize(1);
        tft2.setCursor(54, 14);
        if (seq_reset) {
            tft2.setTextColor(COL_RED);
            tft2.print("RESET");
            seq_reset   = false;
            p_seq_reset = false;
        } else {
            tft2.setTextColor(seq_running ? COL_GREEN : COL_DIM);
            tft2.print(seq_running ? "RUNNING" : "STOPPED");
        }
        p_running = seq_running;
    }

    // Edit step + note
    if (edit_step != p_step) {
        tft2.fillRect(40, 25, 118, 10, COL_BG);
        tft2.setTextColor(COL_WHITE); tft2.setTextSize(1);
        tft2.setCursor(40, 26);
        tft2.print("S"); tft2.print(edit_step + 1);
        tft2.print(" → ");
        tft2.print(NOTE_NAMES[seq_notes[edit_step] % 12]);
        tft2.print(seq_notes[edit_step] / 12 - 1);
        p_step = edit_step;
    }

    // Always redraw grid when step or running changes
    drawSeqGrid();
}

// ─── Setup & Loop ─────────────────────────────────────────────────────────────

void setup() {
    Serial1.begin(115200);
    myusb.begin();

    tft1.initR(INITR_BLACKTAB);
    tft1.setRotation(1);
    drawStaticUI1();

    tft2.initR(INITR_BLACKTAB);
    tft2.setRotation(1);
    drawStaticUI2();
    drawSeqGrid();
    
    for (int i = 0; i < 16; i++) {
        seq_notes[i]  = 60;
        seq_active[i] = true;
    }
    sendActiveSteps();
    send_val(ID_SUSTAIN, v_sustain);
}

void loop() {
    myusb.Task();

    // MIDI connected indicator on screen 1
    static bool was_connected = false;
    if (midi && !was_connected) {
        was_connected = true;
        tft1.fillRect(120, 2, 38, 8, COL_GREEN);
        tft1.setTextColor(COL_BG);
        tft1.setCursor(122, 3);
        tft1.print("MIDI");
    } else if (!midi && was_connected) {
        was_connected = false;
        tft1.fillRect(120, 2, 38, 8, COL_RED);
        tft1.setTextColor(COL_BG);
        tft1.setCursor(122, 3);
        tft1.print("----");
    }

    if (midi.read()) {
        byte type  = midi.getType();
        byte data1 = midi.getData1();
        byte data2 = midi.getData2();

        // Keys — note on
        if (type == 0x90 && data2 > 0 && midi.getChannel() == 1) {
            current_note         = data1;
            gate_on              = true;
            seq_notes[edit_step] = data1;
            send_val(ID_WRITE_STEP, edit_step);
            send_val(ID_WRITE_NOTE, data1);
            send_raw(ID_NOTE, data1);
            send_val(ID_GATE, 1);
            p_step = -1;  // force seq grid redraw
        }

        // Keys — note off
        else if ((type == 0x80 || (type == 0x90 && data2 == 0)) && midi.getChannel() == 1) {
            gate_on = false;
            send_val(ID_GATE, 0);
        }

        // Pads — select step
        else if (type == 0xB0 && data1 >= 40 && data1 <= 55 && data2 > 63) {
            edit_step = data1 - 40;
            p_step = -1;  // force redraw
        }

        // CC
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
                        send_val(ID_SEQ_RUN, seq_running ? 1 : 0);
                    }
                    break;

                case ENCODER_SHIFT_CLICK_CC:
                    if (data2 > 63) {
                        for (int i = 0; i < 16; i++) {
                            seq_notes[i]  = 60;
                            seq_active[i] = true;
                        }
                        sendActiveSteps();
                        edit_step   = 0;
                        seq_running = false;
                        seq_reset   = true;
                        send_val(ID_SEQ_RUN,   0);
                        send_val(ID_SEQ_RESET, 1);
                        p_step    = -1;
                        p_running = !seq_running;
                    }
                    break;
            }
        }
    }

    static unsigned long last = 0;
    if (millis() - last > 50) {
        last = millis();
        updateDisplay1();
        updateDisplay2();
    }
}