var shader = game.createRuntimeShader("compressed");
var shader2 = game.createRuntimeShader("colorInversion");
var shader3 = game.createRuntimeShader("adjustColor");

var hueFilter = new ShaderFilter(shader3); // Reuse this

var amount = 0;

function onUpdatePost(elapsed) {
    amount = amount + 2.5;
    shader3.setFloat("hue", amount); 
}

function onCreatePost() {
    game.camHUD.filters = []; // Force render-to-texture init
    game.camOther.filters = [];
}

function onEvent(ev, v1, v2) {
    if (ev == 'Trigger') {
        if (v1 == 'speedshit') {
            shader2.setInt("invert", 0);
            game.camGame.filters = [new ShaderFilter(shader), new ShaderFilter(shader2)];
            
        }

        if (v1 == 'badappleswap') {
            shader2.setInt("invert", 1);
        }

        if (v1 == 'badappleend') {
            shader2.setInt("invert", 0);
        }

        if (v1 == 'partytime') {
            game.camGame.filters = [new ShaderFilter(shader), hueFilter];
            game.camHUD.filters = [hueFilter];  
            game.camOther.filters = [hueFilter];   
        }
    }
}
