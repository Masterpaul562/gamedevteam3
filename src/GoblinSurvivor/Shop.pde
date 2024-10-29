//Aiden Felt | Oct 23
class Shop {
  //Pimage [] itemImages = new PImage [3]
  //String[] itemNames = {"Item 1", "Item 2", "Item 3"}; // Item names
  boolean shopOpen = false; // Shop state
  boolean equpped = false; // for the wepons to be active
  int shopWidth = 400; // Width of the shop panel
  int shopHeight = 300; // Height of the shop panel
  PImage shopIcon;

  Shop() {
    shopIcon = loadImage("Shoplogo.png");
    //itemImages[0] = loadImage("item1.png"); // Replace with your item paths
    //itemImages[1] = loadImage("item2.png");
    //itemImages[2] = loadImage("item3.png");
  }

  void display() {
    imageMode(CENTER);
    if (shopOpen == true) {
      fill(255);
      rect(width / 2 - shopWidth / 2, height / 2 - shopHeight / 2, shopWidth, shopHeight);
    }
  }
}
