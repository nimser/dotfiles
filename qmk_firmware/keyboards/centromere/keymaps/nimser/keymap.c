#include QMK_KEYBOARD_H
// This file is a work in progress. Layout based on bépo but optimised for programming and VIM use
// NOTE: additonal settings in ~/qmk_firmware/keyboards/centromere/keymaps/nimser/config.h
// IDEAS:
// - last key next to the index on each side should probably get DEL and BSPC... Just a thought, might need to deepen this again...
// USABILITY TESTS:
// - PASS Can press shift-f1 one handed (search for shortcuts in Lunacy)
// - PASS Can hit Ctrl+2, Alt+1-7, left-handed (one hand) with ease in Lunacy while using the mouse
// - PASS Can use SHIFT while holding the modifier used for arrows, as it's the same modifier for numbers. The SHIFT key is also the 7 key, and it means can't press SHIFT while using arrows. (has impact on using Lunacy stepped scaling or stepped movements.)
// - PASS Can use arrow keys without having to press a modifier on the same hand
// - FIXME S-o and S-k should be pressable one-handed in vim
// - FIXME K is too far out for seemless Shift-k in vim
// - FIXME last key next to the index on each side should probably get DEL and BSPC... Just a thought, might need to deepen this again...
// - FIXME Improve S-C-Tab && C-Tab browser navigation
// - FIXME Can access to right hand letters/special chars layer from left hand so that I can leave right hand on mouse in Lunacy
// - FIXME Very unatural position pressing Ctrl+Shift+[, Ctrl+Alt+[ and the like in Lunacy.
// - FIXME appostrophes are not easily typeable when typing in locked all caps mode
// - FIXME b/B sequences in vim use the pink finger
// - FIXME ZZ ZQ sequences in vim use the pinky finger
// - FIXME an accidental t is sometimes inputted after enter (typing fast)
// - FIXME , is reserved as the vim leader key which makes ;/, sequences in combination to f/F or t/T vim moves unidirectional
// - FIXME moving splits to rearange them doesn't behave as expected because of remaping of hjkl to arrow keys
//         original mapping is feks. <c-w><shift>K and <c-w><shift><up> won't work
//         partial fix: use <c-w>r to rotate or <c-w>x see vim's `:help window-moving`

/* transparent template for putting keys
 [???] = LAYOUT_split_3x6_3( \
  //,-----------------------------------------------------.  ,-----------------------------------------------------.
      _______, _______, _______, _______, _______, _______,    _______, _______, _______, _______, _______, _______,\
  //|--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------|
      _______, _______, _______, _______, _______, _______,    _______, _______, _______, _______, _______, _______,\
  //|--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------|
      _______, _______, _______, _______, _______, _______,    _______, _______, _______, _______, _______, _______,\
  //|--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------|
                                 _______, _______, _______,    _______, _______, _______ \
                             //`--------------------------'  `--------------------------'
*/

enum centromere_layers
{
  BASE, // Base layer
  SHFT, // Shifted letters
  NNUM, // Navigation and numbers
  SPEC, // Special characters
  FUN   // FN keys and function controls
};
 // Compose key
#define NW_CMP KC_PSCR

// Mod taps
#define NW_DOT MT(MOD_RALT, KC_DOT)
#define NW_COMMA LT(FUN, KC_COMMA)
#define NW_DEL MT(MOD_RSFT, KC_DEL)
#define NW_BSPC MT(MOD_RSFT, KC_BSPC)
#define NW_QUOT LT(SPEC, KC_QUOT)
#define NW_ESC LT(NNUM, KC_ESC)
#define NW_SPC LT(FUN, KC_SPC)
     
bool get_tapping_force_hold(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
        case LT(FUN,KC_SPC):
            return true;
        default:
            return false;
    }
}

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

  [BASE] = LAYOUT_split_3x6_3( \
  // Note: Use composition for accents and special charecters,
  // see https://math.dartmouth.edu/~sarunas/Linux_Compose_Key_Sequences.html
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      KC_TAB,    KC_B ,    KC_W,    KC_P,     KC_O,NW_DEL,                      NW_BSPC,    KC_V,    KC_D,    KC_L,    KC_J,  KC_Z,\
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
       NW_ESC,  KC_A,    KC_U,    KC_I,    KC_E, NW_COMMA,                       KC_C,   KC_T,    KC_S,    KC_R,    KC_N,   KC_M,\
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, NW_CMP,  KC_Y  ,   KC_X ,NW_DOT, KC_K,                         NW_QUOT,    KC_Q,    KC_G,    KC_H,    KC_F, XXXXXXX,\
  //|-------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          KC_LGUI,OSL(SPEC), KC_LCTL,  NW_SPC,MO(NNUM), KC_RALT\
                                      //`--------------------------'  `--------------------------'
  ),


 [NNUM] = LAYOUT_split_3x6_3( \
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX,    KC_4,    KC_5,    KC_6,XXXXXXX, _______,                      XXXXXXX, KC_HOME, XXXXXXX,  KC_END, XXXXXXX, XXXXXXX,\
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX,    KC_1,    KC_2,    KC_3, KC_0   ,_______,                      KC_CAPS, KC_LEFT, KC_DOWN,  KC_UP ,KC_RIGHT, XXXXXXX,\
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX,    KC_7,    KC_8,    KC_9, _______,XXXXXXX,                      _______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,\
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          _______, _______, _______,    _______, _______, _______ \
                                      //`--------------------------'  `--------------------------'
    ),

 [SPEC] = LAYOUT_split_3x6_3( \
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
       KC_DLR, KC_PIPE,   KC_LT,   KC_GT, KC_AMPR, _______,                      S(KC_6), KC_KP_PLUS, KC_MINS, KC_SLASH, KC_BSLS, XXXXXXX,\
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_HASH, KC_LPRN, KC_LCBR, KC_RCBR, KC_RPRN, KC_SCLN,                      KC_QUES, KC_EXLM, KC_UNDS,KC_PERC, KC_ASTR,  KC_EQL,\
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, KC_AT, KC_LBRC, KC_RBRC, KC_COLON,KC_TILDE,                       _______, KC_QUOT, KC_DQUO,  KC_GRV, KC_CIRC, XXXXXXX,\
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          _______, _______, _______,    _______, _______, _______ \
                                      //`--------------------------'  `--------------------------'
  ),

  [FUN] = LAYOUT_split_3x6_3( \
  // backspace, enter, arrows..D
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
       KC_ESC,  KC_F4,   KC_F5,  KC_F6, KC_F12,_______,                       KC_BRIU, KC_VOLD, KC_MUTE, KC_VOLU, XXXXXXX, XXXXXXX,\
  //|--------+--------+--------+--------+--------------+--|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX,  KC_F1,   KC_F2,  KC_F3, KC_F11,XXXXXXX,                       KC_BRID,  KC_ENT, KC_COPY,KC_PASTE,  KC_CUT, XXXXXXX,\
  //|--------+--------+--------+--------+--------------+--|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX,  KC_F7,   KC_F8,  KC_F9, KC_F10,XXXXXXX,                       XXXXXXX, KC_UNDO, XXXXXXX,KC_AGAIN, XXXXXXX, XXXXXXX,\
  //|--------+--------+--------+--------+--------------+--+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          _______,_______, _______,    _______, _______, _______ \
                                      //`--------------------------'  `--------------------------'
  ),

};

void matrix_scan_user(void) {
    uint8_t layer = get_highest_layer(layer_state);

    switch (layer) {
    	case BASE:
    		set_led_off;
    		break;
        case FUN:
            set_led_blue;
            break;
        case NNUM:
            set_led_red;
            break;
        default:
            break;
    }
};
