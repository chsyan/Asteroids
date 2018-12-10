import java.util.Map;


// Gamestate
final int MAINMENU = 0;
final int HELP = 1;
final int SETTINGS = 2;
final int PLAY = 3;
final int PAUSE = 4;
final int WIN = 5;
final int GAMEOVER = 6;
int state = MAINMENU;

// Menustate
final int MENU_PLAY = 0;
final int MENU_HELP = 1;
final int MENU_SETTINGS = 2;
int menuState = MENU_PLAY;

//Settings state
boolean settingsSelected = false;
final int SETTINGS_UP = 0;
final int SETTINGS_LEFT = 1;
final int SETTINGS_RIGHT = 2;
final int SETTINGS_DOWN = 3;
final int SETTINGS_SPACE = 4;
int settingState = SETTINGS_UP;

// Game objects
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
Player player;

// Input
boolean[] pressed = new boolean[256];
char upKey, downKey, leftKey, rightKey, spaceKey;

// Font
PFont font;

// Scoring
int score;
int highScore;

//Life
int life;
boolean shipDead;

// UI

// Screenshake
float sMag, camOff;
float trauma, screenShake;
final float SMAGT = 10;

// New level
int level, levelAlpha;

void setup() {
  fullScreen();
  //size(600, 600);
  noCursor();

  // Font
  font = createFont("Hyperspace.otf", 32);
  textFont(font, 32);

  // Game objects
  player = new Player();
  gameObjects.add(player);

  // Default input keys
  upKey = 'w';
  downKey = 's';
  leftKey = 'a';
  rightKey = 'd';
  spaceKey = ' ';

  // Default values
  level = 1;
  levelAlpha = 255;
  life = 3;
  score = 0;
  highScore = 0;
  camOff = random(10000);
}

void draw() {
  if (state == MAINMENU) mainMenu();
  else if (state == HELP) help();
  else if (state == SETTINGS) setting();
  else if (state == PLAY) play();
  else if (state == PAUSE) pause();
  else if (state == GAMEOVER) gameOver();
  else if (state == WIN) win();
  else println("Game state error");
}
