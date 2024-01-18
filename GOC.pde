SpriteManager _SM;

void setup() {
    size(1024, 768);
    _SM = new SpriteManager();
    _SM.spawn(new Magician(50, 50));
    _SM.spawn(new Archer(236, 30, 100));
    _SM.spawn(new Archer(512, 30, 500));
    _SM.spawn(new Archer(788, 30, 800));
    _SM.spawn(new Invader(250, 150));
    _SM.spawn(new Invader(150, 200));
}

void draw() {
    background(0);
    _SM.manage();
}

void keyPressed() {
    _SM.player.keyDown();
}

void keyReleased() {
    _SM.player.keyUp();
}
