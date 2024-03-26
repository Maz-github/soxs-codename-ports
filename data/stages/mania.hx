import flixel.addons.display.FlxBackdrop;

var coolBackdrop = FlxBackdrop;
var prevColor;
var hue:Float = 0;
var bgZoom:Float = 0;
var beatBop:Bool = true;

function create() {
	//bg.camera = camHUD;
	//bg.moves = true;
	//bg.velocity.x = 10;
	coolBackdrop = new FlxBackdrop(Paths.image('bgcolorable')); // second argument: FlxAxes is required to determinate in what axes the sprite should be repeated, default to XY
	coolBackdrop.moves = true;
	coolBackdrop.velocity.x = 100; // you can adjust the values to make the scrolling faster or lower
	coolBackdrop.velocity.y = 50;
	coolBackdrop.active = true;
	add(coolBackdrop);
	trace(coolBackdrop.color);
}

function postCreate() {
	for (strum in strumLines) {
		for (note in strum.notes) {
		}
	}
	for (i in 0...4) {
    		playerStrums.members[i].x = 800 + i * 90;
    		playerStrums.members[i].y = 0;

    		cpuStrums.members[i].x = 80 + i * 90;
    		cpuStrums.members[i].y = 0;
	}

	camHUD.zoom = 0.7;
}

function update(elapsed) {
	camZooming = false;
	for (i in 0...4) {
	}

	healthBarBG.x = -camGame.scroll.x + 1000;
	healthBarBG.y = 360;
	healthBar.y = healthBarBG.y + 4;
	iconP1.y = iconP2.y = healthBarBG.y - 70;
	iconP1.angle = 90;
	iconP1.visible = iconP2.visible = false;
	iconP2.angle = iconP1.angle * -1;
	healthBarBG.angle = healthBar.angle = 90;
	healthBar.x = healthBarBG.x + 4;

	for(e in [scoreTxt, missesTxt, accuracyTxt]) {
		e.x = -camGame.scroll.x + 580;
	}
	if (beatBop == "false") {
		camHUD.zoom = 0.70;
		hue += elapsed * 50;
		if (hue > 360)
			hue -= 360;
		
		var color = FlxColor.fromHSB(Std.int(hue), 0.3, 1);
		coolBackdrop.color = color;
	}
}

function setColor(color) {
	coolBackdrop.color = color;
}

function beatHit(curBeat) {
	if (beatBop){
	if (curBeat % 4 == 0) {
		hue += 50;
		if (hue > 360)
			hue -= 360;
		
		var color = FlxColor.fromHSB(Std.int(hue), 0.3, 1);
		coolBackdrop.color = color;

		coolBackdrop.scale.x = coolBackdrop.scale.y = 1.025;
		FlxTween.tween(coolBackdrop.scale, {x:1, y:1}, 0.5, {type: FlxTween.ONESHOT, ease: FlxEase.quadOut});
		camHUD.zoom = 0.725;
		FlxTween.tween(camHUD, {zoom:0.7}, 0.5, {ease: FlxEase.quadOut});
	}
	}
}

function onPlayerHit(event) {
	if (event.direction == 0) {
		FlxTween.color(plrstrum1, 0.25, 0xFFC24B99, 0xFF373737, {ease: FlxEase.quadOut});
	}
	if (event.direction == 1) {
		FlxTween.color(plrstrum2, 0.25, 0xFF00FFFF, 0xFF373737, {ease: FlxEase.quadOut});
	}
	if (event.direction == 2) {
		FlxTween.color(plrstrum3, 0.25, 0xFF12FA05, 0xFF373737, {ease: FlxEase.quadOut});
	}
	if (event.direction == 3) {
		FlxTween.color(plrstrum4, 0.25, 0xFFF9393F, 0xFF373737, {ease: FlxEase.quadOut});
	}
}

function onPlayerMiss(event) {
	if (event.direction == 0) {
		FlxTween.color(plrstrum1, 1, FlxColor.BLUE, 0xFF373737, {ease: FlxEase.quadOut});
	}
	if (event.direction == 1) {
		FlxTween.color(plrstrum2, 1, FlxColor.BLUE, 0xFF373737, {ease: FlxEase.quadOut});
	}
	if (event.direction == 2) {
		FlxTween.color(plrstrum3, 1, FlxColor.BLUE, 0xFF373737, {ease: FlxEase.quadOut});
	}
	if (event.direction == 3) {
		FlxTween.color(plrstrum4, 1, FlxColor.BLUE, 0xFF373737, {ease: FlxEase.quadOut});
	}
}

function onDadHit(event) {
	if (event.direction == 0) {
		FlxTween.color(cpustrum1, 0.25,  0xFFC24B99, 0xFF373737, {ease: FlxEase.quadOut});
	}
	if (event.direction == 1) {
		FlxTween.color(cpustrum2, 0.25, 0xFF00FFFF, 0xFF373737, {ease: FlxEase.quadOut});
	}
	if (event.direction == 2) {
		FlxTween.color(cpustrum3, 0.25, 0xFF12FA05, 0xFF373737, {ease: FlxEase.quadOut});
	}
	if (event.direction == 3) {
		FlxTween.color(cpustrum4, 0.25, 0xFFF9393F, 0xFF373737, {ease: FlxEase.quadOut});
	}
}

function bop(bopper) {
	beatBop = bopper;
}