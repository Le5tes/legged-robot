$fs = 0.5;
use <../modules/foot-common-parts.scad>

smooth = false;

module metatarsus() {
    jointUpper() {
        
        }
        
    jointLower(80);
    tendonTube(0,1.5,1.5,80,1.5,1.5, smooth);
    tendonTube(0,1.5,-1.5,80,1.5,-1.5,smooth);
    tendonTube(0,-1.5,1.5,80,-1.5,1.5,smooth);
    tendonTube(0,-1.5,-1.5,80,-1.5,-1.5,smooth);
}

metatarsus();