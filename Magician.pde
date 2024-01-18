class Magician extends Sprite {
  
    long mark, wait = 1400; 
  
    Magician(float x, float y){
        super(x, y, 40, 40);
    }
    
    @Override
    void display() {
        fill(255);
        triangle(pos.x, pos.y, pos.x + 20, pos.y + 40, pos.x + 40, pos.y);
    }
    
    @Override
    void update() {
        

        if(millis() - mark > wait) {
            float randx = random(1024);
            float randy = random(768);
            pos.x = randx;
            pos.y = randy;
            
            PVector aim = new PVector(_SM.player.pos.x - this.pos.x, _SM.player.pos.y - this.pos.y);
            aim = aim.normalize().mult(8);
            
            mark = millis();
            _SM.spawn(new Bullet(pos, aim, team));
        }
    }
}
