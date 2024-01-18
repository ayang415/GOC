class Archer extends Sprite {
  
    long mark, wait = 1200; 
  
    Archer(float x, float y, float lag){
        super(x, y, 25, 25);
        wait += lag;
    }
    
    @Override
    void update() {
        PVector aim = new PVector(_SM.player.pos.x - this.pos.x, _SM.player.pos.y - this.pos.y);
        aim = aim.normalize().mult(8); // turn this into a single unit vector, then increase its magnitude

        if(millis() - mark > wait) {
            mark = millis();
            _SM.spawn(new Bullet(pos, aim, team));
        }
    }
}
