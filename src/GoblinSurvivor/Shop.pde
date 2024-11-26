//Aiden Felt,Canon Unguren | Oct 23
class Shop {
  int tot = 6;
  PImage [] itemImages = new PImage [tot];
  String[] itemNames = {"Bananaproj.png", "enemy.png", "hammercard2.png", "swordcard.png", "axecard.png",
    "longbowcard"}; // Item names
  boolean shopOpen = false; // Shop state
  boolean equpped = false; // for the wepons to be active
  int shopWidth = 500; // Width of the shop panel
  int shopHeight = 520; // Height of the shop panel
  PImage shopIcon;
  int x, y;
  boolean $banana, $bow, $hammer, $sword, $axe, $longbow;

  Shop() {
    $banana = false;
    $bow = false;
    $hammer = false;
    $sword = false; 
    $axe = false;
    $longbow = false; 
    shopIcon = loadImage("Shoplogo.png");
    itemImages[0] = loadImage("Bananaproj.png"); // Replace with your item paths
    itemImages[1] = loadImage("BowCard.png");
    itemImages[2] = loadImage("hammercard2.png");
    itemImages[3] = loadImage("swordcard.png");
    itemImages[4] = loadImage("axecard.png");
    itemImages[5] = loadImage("longbowcard.png");
    x = 250;
    y = 325;

    //itemImages[0] = loadImage("item1.png"); // Replace with your item paths
    //itemImages[1] = loadImage("item2.png");
    //itemImages[2] = loadImage("item3.png");
  }

  void display() {
    imageMode(CENTER);
    if (shopOpen == true) {
      x = 325;
      y = 325;
      fill(150,0,0);
      rect(x-90, y-135, shopWidth, shopHeight);
      for (int i = 0; i<=tot-1; i++) {
        itemImages[i].resize(160, 250);
        image(itemImages[i], x, y);
        if (mouseX>x-80 && mouseX<x+80 && mouseY>y-125 && mouseY<y+125 && mousePressed) {
          if (i == 0 && !$banana) {
            panel.money +=10;
            $banana = true;
            println("banana");
          } else if (i == 1 && !$bow && panel.money >= 10) {
            $bow = true;
            panel.money -= 10; 
            println("bow");
          }else if (i == 2 && !$hammer && panel.money >= 20) {
            $hammer = true;
            panel.money -= 20; 
            println("hammer");
          }else if (i == 3 && !$sword && panel.money >= 40) {
            $sword = true;
            panel.money -= 40; 
            println("sword");
          }else if (i == 4 && !$axe && panel.money >= 40) {
            $axe = true;
            panel.money -= 40; 
            println("axe");
          }else if (i == 5 && !$longbow && panel.money >= 40) {
            $longbow = true;
            panel.money -= 40; 
            println("longbow");
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
