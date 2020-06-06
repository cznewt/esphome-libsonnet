
void waverearleft(int waves, int speedms)
{

    bot_move('knee_rear_left', 180);
    bot_animate(speedms);

    for (int i = 0; i < waves; i++)
    {
        bot_move('hip_rear_left', 0);
        bot_animate(speedms);

        bot_move('hip_rear_left', 65);
        bot_animate(speedms);

        bot_move('hip_rear_left', 0);
        bot_animate(speedms);

        bot_move('hip_rear_left', 45);
        bot_animate(speedms);
    }

    bot_move('knee_rear_left', 45);
    bot_animate(speedms);
}
//--------------------------------------------------------------
void waverearright(int waves, int speedms)
{

    bot_move('knee_rear_right', 180);
    bot_animate(speedms);

    for (int i = 0; i < waves; i++)
    {
        bot_move('hip_rear_right', 0);
        bot_animate(speedms);

        bot_move('hip_rear_right', 65);
        bot_animate(speedms);

        bot_move('hip_rear_right', 0);
        bot_animate(speedms);

        bot_move('hip_rear_right', 45);
        bot_animate(speedms);
    }

    bot_move('knee_rear_right', 45);
    bot_animate(speedms);
}
//--------------------------------------------------------------
void wavefrontright(int waves, int speedms)
{

    bot_move('knee_front_right', 180);
    bot_animate(speedms);

    for (int i = 0; i < waves; i++)
    {
        bot_move('hip_front_right', 0);
        bot_animate(speedms);

        bot_move('hip_front_right', 65);
        bot_animate(speedms);

        bot_move('hip_front_right', 0);
        bot_animate(speedms);

        bot_move('hip_front_right', 45);
        bot_animate(speedms);
    }

    bot_move('knee_front_right', 45);
    bot_animate(speedms);
}
//--------------------------------------------------------------
void wavefrontleft(int waves, int speedms)
{

    bot_move('knee_front_left', 180);
    bot_animate(speedms);

    for (int i = 0; i < waves; i++)
    {
        bot_move('hip_front_left', 0);
        bot_animate(speedms);

        bot_move('hip_front_left', 65);
        bot_animate(speedms);

        bot_move('hip_front_left', 0);
        bot_animate(speedms);

        bot_move('hip_front_left', 45);
        bot_animate(speedms);
    }

    bot_move('knee_front_left', 45);
    bot_animate(speedms);
}
//--------------------------------------------------------------
void scared(int shakes, int beeps)
{
    bot_move('knee_front_right', 0);
    bot_move('knee_rear_right', 0);
    bot_move('knee_front_left', 0);
    bot_move('knee_rear_left', 0);
    bot_animate(50);

    for (int i = 0; i < shakes; i++)
    {

        bot_move('hip_rear_right', 80);
        bot_move('hip_rear_left', 10);
        bot_move('hip_front_right', 10);
        bot_move('hip_front_left', 80);
        bot_animate(100);

        bot_move('hip_rear_left', 80);
        bot_move('hip_rear_right', 10);
        bot_move('hip_front_left', 10);
        bot_move('hip_front_right', 80);
        bot_animate(50);
    }

    bot_move('hip_rear_right', 45);
    bot_move('hip_rear_left', 45);
    bot_move('hip_front_right', 45);
    bot_move('hip_front_left', 45);
    bot_animate(200);

    bot_move('knee_front_right', 45);
    bot_move('knee_rear_right', 45);
    bot_move('knee_front_left', 45);
    bot_move('knee_rear_left', 45);
    bot_animate(75);
}
//--------------------------------------------------------------
void leanright(int speedms)
{
    bot_move('knee_front_right', 90);
    bot_move('knee_rear_right', 90);
    bot_animate(speedms);

    delay(speedms / 2);

    bot_move('knee_front_right', 45);
    bot_move('knee_rear_right', 45);
    bot_animate(speedms);
}
//--------------------------------------------------------------
void leanleft(int speedms)
{
    bot_move('knee_front_left', 90);
    bot_move('knee_rear_left', 90);
    bot_animate(speedms);

    delay(speedms / 2);

    bot_move('knee_front_left', 45);
    bot_move('knee_rear_left', 45);
    bot_animate(speedms);
}
//--------------------------------------------------------------
void leanforward(int speedms)
{
    bot_move('knee_front_left', 90);
    bot_move('knee_front_right', 90);
    bot_animate(speedms);

    delay(speedms / 2);

    bot_move('knee_front_left', 45);
    bot_move('knee_front_right', 45);
    bot_animate(speedms);
}
//--------------------------------------------------------------
void leanbackward(int speedms)
{
    bot_move('knee_rear_left', 90);
    bot_move('knee_rear_right', 90);
    bot_animate(speedms);

    delay(speedms / 2);

    bot_move('knee_rear_left', 45);
    bot_move('knee_rear_right', 45);
    bot_animate(speedms);
}
//--------------------------------------------------------------
void lookleft(int speedms)
{
    bot_move('hip_rear_left', 80);
    bot_move('hip_rear_right', 10);
    bot_move('hip_front_left', 10);
    bot_move('hip_front_right', 80);
    bot_animate(speedms);

    delay(speedms / 2);

    bot_move('hip_rear_right', 45);
    bot_move('hip_rear_left', 45);
    bot_move('hip_front_right', 45);
    bot_move('hip_front_left', 45);
    bot_animate(speedms);
}
//--------------------------------------------------------------
void lookright(int speedms)
{
    bot_move('hip_rear_right', 80);
    bot_move('hip_rear_left', 10);
    bot_move('hip_front_right', 10);
    bot_move('hip_front_left', 80);
    bot_animate(speedms);

    delay(speedms / 2);

    bot_move('hip_rear_right', 45);
    bot_move('hip_rear_left', 45);
    bot_move('hip_front_right', 45);
    bot_move('hip_front_left', 45);
    bot_animate(speedms);
}
//--------------------------------------------------------------
void walkforward(int steps, int speedms)
{
    for (int i = 0; i < steps; i++)
    {
        bot_move('knee_rear_right', 80);
        bot_move('knee_front_left', 80);
        bot_animate(speedms);

        bot_move('hip_rear_right', 80);
        bot_move('hip_front_left', 20);
        bot_animate(speedms);

        bot_move('knee_rear_right', 30);
        bot_move('knee_front_left', 30);
        bot_animate(speedms);

        bot_move('hip_rear_right', 45);
        bot_move('hip_front_left', 45);
        bot_animate(speedms);

        bot_move('knee_rear_right', 45);
        bot_move('knee_front_left', 45);
        bot_animate(speedms);

        bot_move('knee_rear_left', 80);
        bot_move('knee_front_right', 80);
        bot_animate(speedms);

        bot_move('hip_rear_left', 80);
        bot_move('hip_front_right', 20);
        bot_animate(speedms);

        bot_move('knee_rear_left', 30);
        bot_move('knee_front_right', 30);
        bot_animate(speedms);

        bot_move('hip_rear_left', 45);
        bot_move('hip_front_right', 45);
        bot_animate(speedms);

        bot_move('knee_rear_left', 45);
        bot_move('knee_front_right', 45);
        bot_animate(speedms);
    }
}
//--------------------------------------------------------------
void walkbackward(int steps, int speedms)
{
    for (int i = 0; i < steps; i++)
    {
        bot_move('knee_rear_right', 80);
        bot_move('knee_front_left', 80);
        bot_animate(speedms);

        bot_move('hip_rear_right', 20);
        bot_move('hip_front_left', 80);
        bot_animate(speedms);

        bot_move('knee_rear_right', 30);
        bot_move('knee_front_left', 30);
        bot_animate(speedms);

        bot_move('hip_rear_right', 45);
        bot_move('hip_front_left', 45);
        bot_animate(speedms);

        bot_move('knee_rear_right', 45);
        bot_move('knee_front_left', 45);
        bot_animate(speedms);

        bot_move('knee_rear_left', 80);
        bot_move('knee_front_right', 80);
        bot_animate(speedms);

        bot_move('hip_rear_left', 20);
        bot_move('hip_front_right', 80);
        bot_animate(speedms);

        bot_move('knee_rear_left', 30);
        bot_move('knee_front_right', 30);
        bot_animate(speedms);

        bot_move('hip_rear_left', 45);
        bot_move('hip_front_right', 45);
        bot_animate(speedms);

        bot_move('knee_rear_left', 45);
        bot_move('knee_front_right', 45);
        bot_animate(speedms);
    }
}
//--------------------------------------------------------------
void walkleft(int steps, int speedms)
{
    for (int i = 0; i < steps; i++)
    {
        bot_move('knee_rear_right', 80);
        bot_move('knee_front_left', 80);
        bot_animate(speedms);

        bot_move('hip_rear_right', 0);
        bot_move('hip_front_left', 90);
        bot_animate(speedms);

        bot_move('knee_rear_right', 30);
        bot_move('knee_front_left', 30);
        bot_animate(speedms);

        bot_move('hip_rear_right', 45);
        bot_move('hip_front_left', 45);
        bot_animate(speedms);

        bot_move('knee_rear_right', 45);
        bot_move('knee_front_left', 45);
        bot_animate(speedms);

        bot_move('knee_rear_left', 80);
        bot_move('knee_front_right', 80);
        bot_animate(speedms);

        bot_move('hip_rear_left', 90);
        bot_move('hip_front_right', 0);
        bot_animate(speedms);

        bot_move('knee_rear_left', 30);
        bot_move('knee_front_right', 30);
        bot_animate(speedms);

        bot_move('hip_rear_left', 45);
        bot_move('hip_front_right', 45);
        bot_animate(speedms);

        bot_move('knee_rear_left', 45);
        bot_move('knee_front_right', 45);
        bot_animate(speedms);
    }
}
//--------------------------------------------------------------
void walkright(int steps, int speedms)
{
    for (int i = 0; i < steps; i++)
    {
        bot_move('knee_rear_left', 80);
        bot_move('knee_front_right', 80);
        bot_animate(speedms);

        bot_move('hip_rear_left', 0);
        bot_move('hip_front_right', 90);
        bot_animate(speedms);

        bot_move('knee_rear_left', 30);
        bot_move('knee_front_right', 30);
        bot_animate(speedms);

        bot_move('hip_rear_left', 45);
        bot_move('hip_front_right', 45);
        bot_animate(speedms);

        bot_move('knee_rear_left', 45);
        bot_move('knee_front_right', 45);
        bot_animate(speedms);

        bot_move('knee_rear_right', 80);
        bot_move('knee_front_left', 80);
        bot_animate(speedms);

        bot_move('hip_rear_right', 90);
        bot_move('hip_front_left', 0);
        bot_animate(speedms);

        bot_move('knee_rear_right', 30);
        bot_move('knee_front_left', 30);
        bot_animate(speedms);

        bot_move('hip_rear_right', 45);
        bot_move('hip_front_left', 45);
        bot_animate(speedms);

        bot_move('knee_rear_right', 45);
        bot_move('knee_front_left', 45);
        bot_animate(speedms);
    }
}
//--------------------------------------------------------------
void turnleft(int steps, int speedms)
{
    for (int i = 0; i < steps; i++)
    {
        bot_move('knee_rear_right', 80);
        bot_move('knee_front_left', 80);
        bot_animate(speedms);

        bot_move('hip_rear_right', 90);
        bot_move('hip_front_left', 90);
        bot_animate(speedms);

        bot_move('knee_rear_right', 30);
        bot_move('knee_front_left', 30);
        bot_animate(speedms);

        bot_move('hip_rear_right', 45);
        bot_move('hip_front_left', 45);
        bot_animate(speedms);

        bot_move('knee_rear_right', 45);
        bot_move('knee_front_left', 45);
        bot_animate(speedms);

        bot_move('knee_rear_left', 80);
        bot_move('knee_front_right', 80);
        bot_animate(speedms);

        bot_move('hip_rear_left', 0);
        bot_move('hip_front_right', 0);
        bot_animate(speedms);

        bot_move('knee_rear_left', 30);
        bot_move('knee_front_right', 30);
        bot_animate(speedms);

        bot_move('hip_rear_left', 45);
        bot_move('hip_front_right', 45);
        bot_animate(speedms);

        bot_move('knee_rear_left', 45);
        bot_move('knee_front_right', 45);
        bot_animate(speedms);
    }
}
//--------------------------------------------------------------
void turnright(int steps, int speedms)
{
    for (int i = 0; i < steps; i++)
    {
        bot_move('knee_rear_right', 80);
        bot_move('knee_front_left', 80);
        bot_animate(speedms);

        bot_move('hip_rear_right', 0);
        bot_move('hip_front_left', 0);
        bot_animate(speedms);

        bot_move('knee_rear_right', 30);
        bot_move('knee_front_left', 30);
        bot_animate(speedms);

        bot_move('hip_rear_right', 45);
        bot_move('hip_front_left', 45);
        bot_animate(speedms);

        bot_move('knee_rear_right', 45);
        bot_move('knee_front_left', 45);
        bot_animate(speedms);

        bot_move('knee_rear_left', 80);
        bot_move('knee_front_right', 80);
        bot_animate(speedms);

        bot_move('hip_rear_left', 90);
        bot_move('hip_front_right', 90);
        bot_animate(speedms);

        bot_move('knee_rear_left', 30);
        bot_move('knee_front_right', 30);
        bot_animate(speedms);

        bot_move('hip_rear_left', 45);
        bot_move('hip_front_right', 45);
        bot_animate(speedms);

        bot_move('knee_rear_left', 45);
        bot_move('knee_front_right', 45);
        bot_animate(speedms);
    }
}
