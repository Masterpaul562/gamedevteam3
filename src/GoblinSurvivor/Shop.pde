//Aiden Felt,Canon Unguren | Oct 23
class Shop {
  int tot = 3;
  PImage [] itemImages = new PImage [tot];
  String[] itemNames = {"Bananaproj.png", "enemy.png", "hammercard2.png", "swordcard.png", "axecard.png",
    "longbowcard"}; // Item names
  boolean shopOpen = false; // Shop state
  boolean equpped = false; // for the wepons to be active
  int shopWidth = 500; // Width of the shop panel
  int shopHeight = 520; // Height of the shop panel
  PImage shopIcon;
  int x, y, bX, bX2, uY, uY2;
  boolean $banana, $bow, $hammer, $sword, $axe, $longbow, bowUp,bowUpHap;

  Shop() {
    bowUpHap = false;
    bowUp = false;
    $banana = false;
    $bow = false;
    $hammer = false;
    $sword = false;
    $axe = false;
    $longbow = false;
    shopIcon = loadImage("Shoplogo.png");
    itemImages[0] = loadImage("Bananaproj.png");
    itemImages[1] = loadImage("BowCard.png");
    itemImages[2] = loadImage("hammercard2.png");
    x = 250;
    y = 325;
  }

  void display() {
    imageMode(CENTER);
    if (shopOpen == true) {
      x = 325;
      y = 325;
      fill(150, 0, 0);
      rect(x-90, y-135, shopWidth, shopHeight/2+10);
      for (int i = 0; i<=tot-1; i++) {
        itemImages[i].resize(160, 250);
        image(itemImages[i], x, y);
        if (i == 0) {
          if (mouseX>251 && mouseX<395 && mouseY<440 && mouseY>210 && mousePressed ) {
            if (!$banana) {
              $banana = true;
              println("banana");
            }
          }
        }

        if (i == 1 ) {
          if (mouseX>251+160 && mouseX<395+160 && mouseY<440 && mouseY>210 && mousePressed ) {
            if ( !$bow && panel.money >= 5 ) {
              $bow = true;
              panel.money -= 5;
              bowUp = true;
              println("bow");
            } else if (bowUp == true && panel.money >= 10) {
              panel.money -= 5;
              bowUp = false;
              bowUpHap = true;
            }
          }
        }

        if (i == 2 ) {
          if (mouseX>251+160+160 && mouseX<395+160+160 && mouseY<440 && mouseY>210 && mousePressed ) {
            if (!$hammer && panel.money >= 10) {
              $hammer = true;
              panel.money -= 10;
              println("hammer");
            }
          }
        }
        x = x+160;
        if (x >= 800) {
          x = 325;
          y +=250;
        }
      }
    }
  }
}
