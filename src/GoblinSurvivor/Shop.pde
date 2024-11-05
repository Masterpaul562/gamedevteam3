//Aiden Felt | Oct 23
class Shop {
  PImage [] itemImages = new PImage [3];
  String[] itemNames = {"Bananaproj.png","enemy.png","fireball.png"}; // Item names
  boolean shopOpen = false; // Shop state
  boolean equpped = false; // for the wepons to be active
  int shopWidth = 600; // Width of the shop panel
  int shopHeight = 500; // Height of the shop panel
  PImage shopIcon;
  int x, y;

  Shop() {
    shopIcon = loadImage("Shoplogo.png");
    itemImages[0] = loadImage("Bananaproj.png"); // Replace with your item paths
    itemImages[1] = loadImage("BowCard.png");
    itemImages[2] = loadImage("hammercard2.png");
    x = 250;
    y = 325;

    //itemImages[0] = loadImage("item1.png"); // Replace with your item paths
    //itemImages[1] = loadImage("item2.png");
    //itemImages[2] = loadImage("item3.png");

  }

  void display() {
    imageMode(CENTER);
    if (shopOpen == true) {
      fill(255);

      rect(200, 250, shopWidth, shopHeight);
      for (int i = 0; i<=2; i++) {
        itemImages[i].resize(100, 150);
        image(itemImages[i], x, y);
        x = x+100;
        if(x >= 600) {
          x = 250;
          y +=150;
        }
      }

     

    }
  }
}
