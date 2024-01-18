class SpriteManager {
    Player player;
    
    ArrayList<Sprite> active = new ArrayList<Sprite>();
    ArrayList<Sprite> destroyed = new ArrayList<Sprite>();
    
    SpriteManager() {
        player = new Player(width / 2, height - 100);
        spawn(player);
    }
    
    void destroy(Sprite target) {
        destroyed.add(target);
    }
    
    void spawn(Sprite obj) {
        active.add(obj);
    }
    
    void manage() {
        moveEverything();
        checkCollisions();    
        bringOutTheDead();
        drawEverything();
    }
    
    void moveEverything() {
        for(int i = active.size() - 1; i >= 0; i--) {
            active.get(i).update();           
        }
    }
    
    void drawEverything() {
        for (Sprite s : active)
            s.display();
    }
    
    void checkCollisions() {
        for (int i = 0; i < active.size(); i++) {
            for (int j = i + 1; j < active.size(); j++) {
                Sprite a = active.get(i);
                Sprite b = active.get(j);
                if (a.team != b.team && collision(a, b)) {
                    active.get(i).handleCollision();
                    active.get(j).handleCollision();
                }
            }
        }
    }
    
    void bringOutTheDead() {
        for (int i = 0; i < destroyed.size(); i++) {
            Sprite target = destroyed.get(i);
            active.remove(target);
            destroyed.remove(target);
        }
    }
    
    boolean collision(Sprite a, Sprite b) {
        // assumes equal w and h
        float w1 = a.size.x / 2.0;
        float w2 = b.size.x / 2.0;
        float h1 = a.size.y / 2.0;
        float h2 = b.size.y / 2.0;
        if(w1 + w2 > dist(a.pos.x, a.pos.y, b.pos.x, b.pos.y) || h1 + h2 > dist(a.pos.x, a.pos.y, b.pos.x, b.pos.y)) {
          return true;
        }
        return false;
    }
}
