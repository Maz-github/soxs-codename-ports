function postCreate(){
    Sack.cameras = [camHUD];
    Sack.alpha = 0;
}



function stepHit(curStep:Int){
    switch(curStep){
        case 13:
           Sack.alpha = 1;
    }}