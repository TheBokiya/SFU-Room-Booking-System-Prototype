import controlP5.*;

ControlP5 window1;
ControlP5 window2;
ControlP5 defaultWindow;
ControlP5 cWindow;
ControlP5 closeHelp;
ControlP5 closeEr;
PFont roomNo;
PFont roomSz;
PImage help;
Textfield search;
String roomTitle = "";
String roomSize;
PImage screen1;
PImage roomBooked;
PImage error;
PImage screen2;
PImage screen3;
PImage screen4;
PImage infoBox;
PImage helpPage;
int currentIndex;
Flags f;
DropdownList p1, p2, p3, p4;
//contains rooms and information about room (ie: size)
//int[][] rooms;
//contains times
boolean[][] times;
int[][] roomCoords;
String[] roomNames;
int[] roomID;

public int myColorRect = 200;

public int myColorBackground = 100;
int popX;
int popY;
Toggle Gre;
Toggle Tea;
Toggle Edi;
Toggle Ava;

CheckBox avail;
CheckBox rooms;

//    ellipse(858, 561, 15, 15);d
//  ellipse(888, 612, 15, 15);d
//  ellipse(861, 642, 15, 15);d
//  ellipse(860, 668, 15, 15);
//  ellipse(825 ,666, 15, 15);
//  ellipse(826, 641, 15, 15);
//  ellipse(1253, 537, 15, 15);
//  ellipse(1256, 684, 15, 15);
//  ellipse(1281, 683, 15, 15);
//  ellipse(1307, 684, 15, 15);
//  ellipse(1330, 686, 15, 15);
//  ellipse(1351, 687, 15, 15);
//  ellipse(1376,687, 15, 15);

void setup() {
  roomBooked = loadImage("room_booked.png");
  help = loadImage("help-page.jpg");
  error = loadImage("noRoomsFound.png");
  roomNo = createFont("DIN BLACK.tff", 60);
  roomSz = createFont("DINL___.TFF", 48);
  f = new Flags(7);
  roomCoords = new int[28][2];
  roomNames = new String[28];
  times = new boolean[28][24];
  roomID = new int[28];
  roomID[0] = 3;
  roomID[1] = 2;
  roomID[2] = 1;
  roomID[3] = 1;
  roomID[4] = 1;
  roomID[5] = 1;
  for (int y = 6; y < roomID.length; y++) {
    roomID[y] = int(random(1, 3));
  }
  roomNames[0] = "Video Production";
  roomNames[1] = "Sound Room";
  roomNames[2] = "3815 Top Right";
  roomNames[3] = "3815 Bottom Right";
  roomNames[4] = "3815 Bottom Left";
  roomNames[5] = "3815 Top Left";
  roomNames[6] = "3658";
  roomNames[7] = "3660";
  roomNames[8] = "3662";
  roomNames[9] = "3664";
  roomNames[10] = "3666";
  roomNames[11] = "3668";
  roomNames[12] = "3670";
  roomNames[13] = "3240";
  roomNames[14] = "3210";
  roomNames[15] = "3220";
  roomNames[16] = "3225";
  roomNames[17] = "3262";
  roomNames[18] = "3264";
  roomNames[19] = "3266";
  roomNames[20] = "3325";
  roomNames[21] = "3315";
  roomNames[22] = "3320";
  roomNames[23] = "3365";
  roomNames[24] = "3370";
  roomNames[25] = "3165";
  roomNames[26] = "3086";
  roomNames[27] = "3062";

  for (int i = 0; i < 28; i++) {
    for (int i2 = 0; i2 < 24; i2++) {
      int rand = int(random(0, 2));
      if (rand == 0) {
        times[i][i2] = true;
      }
      else {
        times[i][i2] = false;
      }
    }
  }
  roomCoords[0][0] = 858;
  roomCoords[0][1] = 561;
  roomCoords[1][0] = 888;
  roomCoords[1][1] = 612;
  roomCoords[2][0] = 861;
  roomCoords[2][1] = 642;
  roomCoords[3][0] = 860;
  roomCoords[3][1] = 668;
  roomCoords[4][0] = 825;
  roomCoords[4][1] = 666;
  roomCoords[5][0] = 826;
  roomCoords[5][1] = 641;
  roomCoords[6][0] = 1253; 
  roomCoords[6][1] =  537;
  roomCoords[7][0] = 1250;
  roomCoords[7][1] = 681;
  roomCoords[8][0] = 1281;
  roomCoords[8][1] = 683;
  roomCoords[9][0] = 1307;
  roomCoords[9][1] = 684;
  roomCoords[10][0] = 1330;
  roomCoords[10][1] = 686;
  roomCoords[11][0] =  1351;
  roomCoords[11][1] = 687;
  roomCoords[12][0] = 1376;
  roomCoords[12][1] = 687;


  //  ellipse(558, 618, 15, 15);
  //  ellipse(569, 648, 15, 15);
  //  ellipse(648, 626, 15, 15);
  //  ellipse(671, 619, 15, 15);
  //  ellipse(826, 612, 15, 15);
  //  ellipse(847, 615, 15, 15);
  //  ellipse(878, 616, 15, 15);
  //  ellipse(1132, 612, 15, 15);
  //  ellipse(1122, 639, 15, 15);
  //  ellipse(1152, 639, 15, 15);
  //  ellipse(1309, 648, 15, 15);
  //  ellipse(1327, 648, 15, 15);
  //  ellipse(754, 807, 15, 15);
  //  ellipse(1120, 828, 15, 15);
  //  ellipse(1128, 850, 15, 15);

  roomCoords[13][0] = 558;
  roomCoords[13][1] = 618;
  roomCoords[14][0] = 569;
  roomCoords[14][1] = 648;
  roomCoords[15][0] = 648;
  roomCoords[15][1] = 626;
  roomCoords[16][0] = 671;
  roomCoords[16][1] = 619;
  roomCoords[17][0] = 826;
  roomCoords[17][1] = 612;
  roomCoords[18][0] = 847;
  roomCoords[18][1] = 615;
  roomCoords[19][0] = 878;
  roomCoords[19][1] = 616;
  roomCoords[20][0] = 1132;
  roomCoords[20][1] = 612;
  roomCoords[21][0] = 1122;
  roomCoords[21][1] = 639;
  roomCoords[22][0] = 1151;
  roomCoords[22][1] = 638;
  roomCoords[23][0] = 1300;
  roomCoords[23][1] = 648;
  roomCoords[24][0] = 1330;
  roomCoords[24][1] = 648;
  roomCoords[25][0] = 754;
  roomCoords[25][1] = 807;
  roomCoords[26][0] = 1120;
  roomCoords[26][1] = 828;
  roomCoords[27][0] = 1128;
  roomCoords[27][1] =  850;

  println(roomCoords.length);
  f.setFlag(true, 0);
  screen1 = loadImage("main-page1.jpg");
  screen2 = loadImage("main-page2.jpg");
  screen3 = loadImage("pop_up_window.png");
  screen4 = loadImage("smart_Search.png");
  infoBox = loadImage("key_map.png");
  popX = (screen3.width * 2)/3;
  popY = (screen3.height * 2)/3;
  size(1920, 1080);
  closeHelp = new ControlP5(this);
  defaultWindow = new ControlP5(this);
  window1 = new ControlP5(this);
  cWindow = new ControlP5(this);
  Ava = window1.addToggle("Available", true, 1210, 270, 50, 50);
  //    if (mouseX > 1510 && mouseX < 1613) {
  //     if (mouseY > 117 && mouseY < 172) {
    closeHelp.addButton("Back", 128, 1720, 200, 100, 50);
    closeHelp.setAutoDraw(false);
  cWindow.addButton("Close", 128, 1510, 117, 60, 60);
  defaultWindow.addButton("SmartSearch", 128, 1397, 101, 216, 66);
  defaultWindow.addButton("Help", 128, 1620, 101, 216, 66);
  Tea = window1.addToggle("Team Rooms", true, 1210, 440, 50, 50);
  Edi= window1.addToggle("Editing Suite", true, 1210, 512, 50, 50);
  Gre = window1.addToggle("Green Room", true, 1210, 584, 50, 50);
  search = window1.addTextfield("Room Number", 690, 260, 360, 60);
  window1.addButton("Search", 128, 1180, 770, 370, 110);
  //   if (mouseX > 372 && mouseX < 944) {
  //   if (mouseY > 693 && mouseY < 858) {
    closeEr = new ControlP5(this);
  closeEr.addButton("OK", 128, width/2 - 50, height/2 + 40, 100 ,50);
 closeEr.setAutoDraw(false); 
  p3 = window1.addDropdownList("Time", 690, 595, 250, 120);
  String[] loc3 = new String[24];
  for (int t = 0; t < 24; t++) {
    String temp = t + ":00";
    loc3[t] = temp;
  }
  String d = "Time";
  customize(p3, loc3, d);

  p2 = window1.addDropdownList("Size", 690, 505, 250, 120);
  String[] loc2 = {
    "ANY", "SMALL", "MEDIUM", "LARGE"
  };
  d = "Size";
  customize(p2, loc2, d);

  window2 = new ControlP5(this);
  window2.addButton("Book", 128, 368, 693, 580, 170);
  window1.setAutoDraw(false);
  window2.setAutoDraw(false);
  defaultWindow.setAutoDraw(false);
  p1 = window1.addDropdownList("Location", 690, 415, 250, 120);
  String[] loc = {
    "ALL", "GALLERIA", "LIBRARY"
  };
  d = "Location";
  customize(p1, loc, d);
  p4 = window2.addDropdownList("Time", 1318, 315, 250, 120);
  String[] loc4 = new String[24];
  for (int t = 0; t < 24; t++) {
    String temp = t + ":00";
    loc4[t] = temp;
  }
  d = "Time";
  customize(p4, loc4, d);
  cWindow.setAutoDraw(false);
  //  controlP5.addNumberbox("numberboxA", myColorRect, 100, 140, 100, 14).setId(1);
  //  controlP5.setAutoDraw(false);
}

void draw() {

  fill(27, 167, 166);
  if (f.getFlag(0)) {
    image(screen1, 0, 0, screen1.width, screen1.height);
    textFont(roomSz);
    text("Library", 400, 90);

    //  controlP5.draw();
  }
  if (f.getFlag(1)) {
    image(screen2, 0, 0, screen1.width, screen1.height);
        textFont(roomSz);
    text("Galleria", 400, 90);
  }
  int iX = infoBox.width/8;
  int iY = infoBox.height/8;
  image(infoBox, 0, height - iY, iX, iY);
  if (f.getFlag(2)) {
    int tX = (width - popX)/2;
    int tY = (height - popY)/2;
    image(screen4, tX, tY, popX, popY);
    window1.draw();
  }
  if (f.getFlag(3)) {
    int tX = (width - popX)/2;
    int tY = (height - popY)/2;
    image(screen3, tX, tY, popX, popY);
    window2.draw();
    noStroke();
    fill(62, 107, 109);
    rect(633, 135, 166, 64);
    rect(635, 358, 250, 60);
    stroke(1);
    fill(255);
    textFont(roomNo);
    text(roomTitle, 633, 190);
    textFont(roomSz);
    text(roomSize, 640, 400);
  }
  if(f.getFlag(4)){
    image(help, 0,0);
    closeHelp.draw();
  }

  
  if (!f.getFlag(2) && !f.getFlag(3) && !f.getFlag(5)) {
    defaultWindow.draw();
  } else if(f.getFlag(5)){
    image(error, width/2 - 200, height/2 - 150);
    closeEr.draw();
  }
  else {
    cWindow.draw();
  }
    if(f.getFlag(6)){
    int xC = width/2 - roomBooked.width/2;
    int yC = height/2 - roomBooked.height/2;
    image(roomBooked, xC, yC);
    closeEr.draw();
  }
}

void customize(DropdownList ddl, String[] s, String def) {
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(30);
  ddl.setBarHeight(60);
  ddl.captionLabel().set(def);
  ddl.captionLabel().style().marginTop = 3;
  ddl.captionLabel().style().marginLeft = 3;
  ddl.valueLabel().style().marginTop = 3;
  for (int x = 0; x < s.length; x++) {
    ddl.addItem(s[x], x);
  }
  //  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
}

void setTime(DropdownList ddl, boolean[] time) {
  ddl.clear();
  for (int x = 0; x < time.length; x++) {
    if (!time[x]) {
      String timer = x + ":00";
      ddl.addItem(timer, x);
    }
  }
}

void controlEvent(ControlEvent theEvent) {
  // if the event is from a group, which is the case with the dropdownlist
  if (theEvent.isGroup()) {
    // if the name of the event is equal to ImageSelect (aka the name of our dropdownlist)
  } 
  else if (theEvent.isController()) {
    // not used in this sketch, but has to be included
  }
}

void SmartSearch(int theValue) {
  f.setFlag(true, 2);
  f.setFlag(false, 5);
}

void Close(int theValue) {
  f.setFlag(false, 2);
  f.setFlag(false, 3);
}

void Back(int theValue){
  f.setFlag(false, 4);
  f.setFlag(true, 0);
}
void Search(int theValue) {

  int tempIndex = 0;
  String name = search.getText();
  boolean G =Gre.getState();
  boolean E = Edi.getState();
  boolean T = Tea.getState();
  int time = int(p3.value());
  int loc = int(p1.value());
  int siz = int(p2.value());
  int startIndex = 0;
  int endIndex = 28;
  if (loc ==0) {
  }
  else if (loc == 1) {
    startIndex = 13;
    endIndex = 28;
  }
  else {
    endIndex = 12;
  }
  println("test");
  println(name.equals(""));
  boolean found = false;
  println(name);
  for (int x =startIndex; x < endIndex; x++) {

    if (!name.equals("")) {
      //search for name
      if (name.equals(roomNames[x])) {
        found = true;
        tempIndex = x;
        break;
      }
    }
    else {
      println(x + ": index");
      println("Got here");
      if (!G && x == 0) {
        x++;
        //skip
      } 
      else {
        //search the green room for times, ignore location and size values because there's no point
        if (!times[x][time]) {
          println(times[x][time]);
          found = true;
          tempIndex = x;
          break;
        }
      }
      println("Got here");
      if (!E && x < 6) {
        //skip
        x = 6;
      } 
      else {

        //search the sound suites, once again ignore location and size, because there's no point
        if (!times[x][time]) {
          found = true;
          tempIndex = x;
          break;
        }
      }

      println("Got here");
      if (!T && x > 5) {
        //skip
        x = 27;
      } 
      else {
        if (!times[x][time] && (siz == 0) ) {
          found = true;
          tempIndex = x;
          break;
        }
        else if (!times[x][time] && siz == roomID[x]) {
          found = true;
          tempIndex = x;
          break;
        }
        //search the team rooms
      }
      //no name given
    }
  }
  println("searching done");
  if (found) {
    f.setFlag(false, 2);
    f.setFlag(true, 3);
    setTime(p4, times[tempIndex]);
    roomTitle = roomNames[tempIndex];
    if (roomID[tempIndex] == 1) {
      roomSize = "Small 2-4";
    }
    else if (roomID[tempIndex] == 2) {
      roomSize = "Medium 4-6";
    }
    else {
      roomSize = "Large 6-8";
    }
    currentIndex = tempIndex;
  }
  else {
    f.setFlag(true, 5);
    f.setFlag(false, 2);
  }
  println(Gre.getState());
  println(Edi.getState());
  println(Tea.getState());
  println(p3.value());
}


void Book(int theValue) {
  times[currentIndex][int(p4.value())] = true;
  f.setFlag(false, 3);
  f.setFlag(true, 6);
}

void OK(int theValue){
  f.setFlag(false, 5);
  f.setFlag(false, 6);
}

void Help(int theValue){
  f.setFlag(false, 1);
  f.setFlag(true, 4);
}
void mouseClicked() {
  println(mouseX + ", " + mouseY);
  int indexTemp = -1;
  boolean found = false;
  int startIndex = 0;
  int endIndex = 0;
  if (f.getFlag(2) || f.getFlag(3)) {
    startIndex = 0;
    endIndex = 0;
  }
  else if (f.getFlag(1)) {
    startIndex = 12;
    endIndex = roomCoords.length;
  } 
  else if (f.getFlag(0)) {
    startIndex = 0;
    endIndex = 12;
  }
  else if(f.getFlag(4)){
    startIndex = roomCoords.length;
    endIndex = startIndex;
  }
  for (int x = startIndex; x < endIndex; x++) {
    float tempX = roomCoords[x][0] + 7.5;
    float tempY = roomCoords[x][1] + 7.5;
    float distance = sqrt(pow((tempX - mouseX), 2) + pow(tempY - mouseY, 2));
    if (distance <= 15) {
      indexTemp = x;
      found = true;
    }
  }
  if (found) {
    f.setFlag(true, 3);
    roomTitle = roomNames[indexTemp];
    setTime(p4, times[indexTemp]);
    if (roomID[indexTemp] == 1) {
      roomSize = "Small 2-4";
    }
    else if (roomID[indexTemp] == 2) {
      roomSize = "Medium 4-6";
    }
    else {
      roomSize = "Large 6-8";
    }
    currentIndex = indexTemp;
  }
  if (f.getFlag(0)) {
    if (mouseX < width && mouseX > (width - 165)) {
      int tempY1 = height/2 - 138;
      int tempY2 = height/2 + 138;
      if (mouseY < tempY2 && mouseY > tempY1) {
        println("click!");
        f.setFlag(true, 1);
        f.setFlag(false, 0);
      }
    }
  } 
  else if (f.getFlag(1)) {
    if (mouseX < 165 && mouseX > 0) {
      int tempY1 = height/2 - 138;
      int tempY2 = height/2 + 138;
      if (mouseY < tempY2 && mouseY > tempY1) {
        println("click!");
        f.setFlag(true, 0);
        f.setFlag(false, 1);
      }
    }
  }
}

