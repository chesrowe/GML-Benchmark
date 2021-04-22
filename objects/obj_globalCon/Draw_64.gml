//Draw results to screen

draw_line(0, 24, room_width, 24);
draw_line(0, 48, room_width, 48);

draw_text(0, 0, "Number of Iterations per frame: " + string(iterationsPerCalculation) + "    Number of frames: " + string(framesOfIteration));

drawResults(0, 24, 0);

draw_line(room_width / 2, 24, room_width / 2, room_height);

drawResults(700, 24, 1);
