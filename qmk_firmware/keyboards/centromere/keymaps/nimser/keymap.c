#include QMK_KEYBOARD_H
// This file is a work in progress. Layout based on bépo but optimised for programming and VIM use
// NOTE: additonal settings in ~/qmk_firmware/keyboards/centromere/keymaps/nimser/config.h
// TODO:
// - FIXME Can't use SHIFT while holding the modifier used for arrows, as it's the same modifier for numbers. The SHIFT key is also the 7 key, and it means can't press SHIFT while using arrows. (has impact on using Lunacy stepped scaling or stepped movements.)
// - FIXME consider putting hjkl back where it belongs or moving arrow modifier to other hand to type faster
// - FIXME appostrophes are not easily typeable when typing in locked all caps mode
// - FIXME b/B sequences in vim use the pink finger
// - FIXME ZZ ZQ sequences in vim use the pinky finger
// - FIXME an accidental triggering of locked numerables happens once in a while, and I can't explain why so far
// - FIXME an accidental t is sometimes inputted after enter (typing fast), still need to debug the exact entry sequence causing that
// - FIXME , is reserved as the vim leader key which makes ;/, sequences in combination to f/F or t/T vim moves unidirectional
// - FIXME moving splits to rearange them doesn't behave as expected because of remaping of hjkl to arrow keys
//         original mapping is feks. <c-w><shift>K and <c-w><shift><up> won't work
//         partial fix: use <c-w>r to rotate or <c-w>x see vim's `:help window-moving`

/* transparent template for putting keys
 [???] = LAYOUT_split_3x6_3( \
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      _______, _______, _______, _______, _______, _______,                      _______, _______, _______, _______, _______, _______,\
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      _______, _______, _______, _______, _______, _______,                      _______, _______, _______, _______, _______, _______,\
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      _______, _______, _______, _______, _______, _______,                      _______, _______, _______, _______, _______, _______,\
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
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
      KC_TAB,    KC_B,    KC_W,    KC_P,     KC_O,  KC_DEL,                      KC_BSPC,    KC_V,    KC_D,    KC_L,    KC_J,  KC_Z,\
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_ESC,    KC_A,    KC_U,    KC_I,    KC_E, KC_COMMA,                         KC_C,    KC_T,    KC_S,    KC_R,    KC_N,   KC_M,\
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_PSCR,OSM(MOD_LSFT),KC_Y,   KC_X,MT(MOD_LALT,KC_DOT),KC_K,   MT(MOD_RCTL,KC_QUOT),    KC_Q,    KC_G,    KC_H,    KC_F, XXXXXXX,\
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          KC_LGUI,OSL(SPEC), KC_LCTL,  LT(FUN,KC_SPC),TT(NNUM), KC_RALT\
                                      //`--------------------------'  `--------------------------'
  ),


 [NNUM] = LAYOUT_split_3x6_3( \
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX,    KC_4,    KC_5,    KC_6, XXXXXXX, _______,                      XXXXXXX, KC_HOME, XXXXXXX,  KC_END, XXXXXXX, XXXXXXX,\
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX,    KC_1,    KC_2,    KC_3,    KC_0, _______,                      KC_LEFT, KC_DOWN,   KC_UP, KC_RIGHT, XXXXXXX, XXXXXXX,\
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX,    KC_7,    KC_8,    KC_9, _______, XXXXXXX,                      _______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,\
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          _______, _______, _______,    _______, _______, _______ \
                                      //`--------------------------'  `--------------------------'
    ),

 [SPEC] = LAYOUT_split_3x6_3( \
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
       KC_DLR, KC_PIPE,   KC_LT,   KC_GT, KC_AMPR, XXXXXXX,                      S(KC_6), KC_KP_PLUS, KC_MINS, KC_SLASH, KC_BSLS, XXXXXXX,\
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
       KC_ESC,   KC_F4,   KC_F5,   KC_F6,  KC_F12, XXXXXXX,                      KC_BRIU, KC_VOLD, KC_MUTE, KC_VOLU, XXXXXXX, XXXXXXX,\
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX,   KC_F1,   KC_F2,   KC_F3,  KC_F11, XXXXXXX,                      KC_BRID,  KC_ENT, KC_COPY,KC_PASTE,  KC_CUT, XXXXXXX,\
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX,   KC_F7,   KC_F8,   KC_F9,  KC_F10, XXXXXXX,                      XXXXXXX, KC_UNDO, XXXXXXX,KC_AGAIN, XXXXXXX, XXXXXXX,\
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          _______, _______, _______,    _______, _______, _______ \
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
