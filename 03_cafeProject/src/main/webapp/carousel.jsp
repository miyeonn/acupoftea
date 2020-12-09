<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>캐러셀연습</title>
</head>
<body>
<style>
*{
	background-color:black;
}

body {
  margin: 0;
  padding: 0;
  display: flex;
  height: 100vh;
  align-items: center;
}

.container {
  overflow: hidden;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;
}

.slider {
  display: flex;
  flex: 1 1 500px;
  list-style: none;
  padding: 0;
  margin: 0 10px;
}

.item {
  flex: 0 0 150px;
  height: 215px;
  margin-left: 10px;
  border-radius: 5px;
  display: flex;
  flex-direction: column;
  
  $numBoxes: 20;
  $step: 360 / $numBoxes;
	}  
  &:first-child {
    margin-left: 0;
  }

	  @for $i from 1 through $numBoxes {
    &:nth-child(#{$i}) {
      background: hsla($i * $step, 90%, 60%, 1);
      z-index: $numBoxes - $i + 1;
    }
  }

  
  a {
    flex: 1;
  }


.controls {
  margin-top: 20px;
  flex: 1 1 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  
  button {
    border: none;
    border-radius: 25px;
    background: hsla(0, 90%, 65%, 1);
    padding: 12px 15px;
    color: white;
    font-size: 18px;
    font-weight: bold;
    line-height: 18px;
    -webkit-appearance: none;
    cursor: pointer;
  }
}

.progress-bar {
  flex: 0 0 200px;
  height: 4px;
  border-radius: 4px;
  margin: 0 20px;
  background: hsla(0, 90%, 65%, 1);
  transform: scaleX(0);
  transform-origin: 0% 50%;
}

</style>
<div class="container">
  <ul class="slider">
    <li class="item"><a href="#"></a></li>
    <li class="item"><a href="#"></a></li>
    <li class="item"><a href="#"></a></li>
    <li class="item"><a href="#"></a></li>

  </ul>
  <div class="controls">
    <button class="prev">Prev</button>
    <div class="progress-bar"></div>
    <button class="next">Next</button>
  </div>
</div>

</body>
<script>
const { calc, css, physics, pointer, transform, value } = window.popmotion;
const { applyOffset, clamp, pipe } = transform;

function getTotalItemsWidth(items) {
  const { left } = items[0].getBoundingClientRect();
  const { right } = items[items.length - 1].getBoundingClientRect();
  return right - left;
}

function angleIsVertical(angle) {
  const isUp = (
    angle <= -90 + 45 &&
    angle >= -90 - 45
  );
  const isDown = (
    angle <= 90 + 45 &&
    angle >= 90 - 45
  );

  return (isUp || isDown);
}

function carousel(container) {
  // Select DOM
  const slider = container.querySelector('.slider');
  const items = slider.querySelectorAll('.item');

  // Calculate slider measurements
  const sliderVisibleWidth = slider.offsetWidth;
  const totalItemsWidth = getTotalItemsWidth(items);

  // Set min/max scroll offsets
  const maxXOffset = 0;
  const minXOffset = - (totalItemsWidth - sliderVisibleWidth);
  const clampXOffset = clamp(minXOffset, maxXOffset);

  // Create slider renderer
  const sliderRenderer = css(slider);
  const sliderX = value(0, (x) => sliderRenderer.set('x', x));

  let action;
  let touchOrigin = { x: 0, y: 0 };

  // Touch event handling
  function stopTouchScroll() {
    document.removeEventListener('touchend', stopTouchScroll);
    if (action) action.stop();
    action = physics({
      from: sliderX.get(),
      velocity: sliderX.getVelocity(),
      friction: 0.2
    }).output(pipe(
      clampXOffset,
      (v) => sliderX.set(v)
    )).start();
  }

  function determineDragDirection(e) {
    const touch = e.changedTouches[0];
    const touchLocation = {
      x: touch.pageX,
      y: touch.pageY
    };
    const distance = calc.distance(touchOrigin, touchLocation);

    if (!distance) return;
    document.removeEventListener('touchmove', determineDragDirection);

    const angle = calc.angle(touchOrigin, touchLocation);
    if (angleIsVertical(angle)) return;

    if (action) action.stop();
    action = pointer(e).start();

    action.output(pipe(
      ({ x }) => x,
      applyOffset(action.x.get(), sliderX.get()),
      clampXOffset,
      (v) => sliderX.set(v)
    ));
  }

  function startTouchScroll(e) {
    document.addEventListener('touchend', stopTouchScroll);
    if (action) action.stop();
    const touch = e.touches[0];
    touchOrigin = {
      x: touch.pageX,
      y: touch.pageY
    };
    document.addEventListener('touchmove', determineDragDirection);
  }

  slider.addEventListener('touchstart', startTouchScroll);
}

carousel(document.querySelector('.container'));
</script>
</html>